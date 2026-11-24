/*
 * What ad9361_set_bb_rate of libad9361-iio does to an emulated AD9361.
 *
 *   bb_rate_harness <context.xml> <fir text file or -> <rate> [<rate> ...]
 *
 * Creates the context "emu:<context.xml>" with libiio v1, calls the unchanged
 * ad9361_set_bb_rate of libad9361-iio (ad9361_baseband_auto_rate.c) once per
 * rate on the device ad9361-phy, and prints every attribute access that the
 * function makes, in call order:
 *
 *   CALL ad9361_set_bb_rate <rate>
 *   chn_read_longlong <channel> <in|out> <attribute> = <status> [<value>]
 *   chn_read_bool     <channel> <in|out> <attribute> = <status> [<0|1>]
 *   chn_write_longlong <channel> <in|out> <attribute> <value> = <status>
 *   chn_write_bool    <channel> <in|out> <attribute> <0|1> = <status>
 *   dev_read_bool  <attribute> = <status> [<0|1>]
 *   dev_write_bool <attribute> <0|1> = <status>
 *   dev_read       <attribute> = <status> [<text>]
 *   dev_write_raw  <attribute> <bytes> = <status>
 *   RET <return value>
 *
 * <status> is 0 for success and the negative errno otherwise; a value follows
 * a read that succeeded. The bytes of the last write to filter_fir_config go
 * to <fir text file>.
 *
 * The v0 functions are implemented below on libiio v1 with the return values
 * of libiio v0: -ENOENT for an attribute that does not exist.
 */
#include "iio.h"

#include <errno.h>
#include <stdio.h>
#include <string.h>

int ad9361_set_bb_rate(struct iio_device *dev, unsigned long rate);

static char *fir_text;
static size_t fir_len;

static const char *dir(const struct iio_channel *chn)
{
	return iio_channel_is_output(chn) ? "out" : "in";
}

int iio_device_attr_read_bool(const struct iio_device *dev, const char *attr, bool *val)
{
	const struct iio_attr *a = iio_device_find_attr(dev, attr);
	int ret = a ? iio_attr_read_bool(a, val) : -ENOENT;

	if (ret < 0)
		printf("dev_read_bool %s = %d\n", attr, ret);
	else
		printf("dev_read_bool %s = 0 %d\n", attr, (int)*val);
	return ret < 0 ? ret : 0;
}

int iio_device_attr_write_bool(const struct iio_device *dev, const char *attr, bool val)
{
	const struct iio_attr *a = iio_device_find_attr(dev, attr);
	int ret = a ? iio_attr_write_bool(a, val) : -ENOENT;

	ret = ret < 0 ? ret : 0;
	printf("dev_write_bool %s %d = %d\n", attr, (int)val, ret);
	return ret;
}

ssize_t iio_device_attr_read(const struct iio_device *dev, const char *attr, char *dst, size_t len)
{
	const struct iio_attr *a = iio_device_find_attr(dev, attr);
	ssize_t ret = a ? iio_attr_read_raw(a, dst, len) : -ENOENT;

	if (ret < 0)
		printf("dev_read %s = %d\n", attr, (int)ret);
	else
		printf("dev_read %s = 0 %s\n", attr, dst);
	return ret;
}

ssize_t iio_device_attr_write_raw(const struct iio_device *dev, const char *attr,
		const void *src, size_t len)
{
	const struct iio_attr *a = iio_device_find_attr(dev, attr);
	ssize_t ret = a ? iio_attr_write_raw(a, src, len) : -ENOENT;

	printf("dev_write_raw %s %zu = %d\n", attr, len, ret < 0 ? (int)ret : 0);
	if (!strcmp(attr, "filter_fir_config")) {
		free(fir_text);
		fir_text = malloc(len ? len : 1);
		if (!fir_text)
			exit(3);
		memcpy(fir_text, src, len);
		fir_len = len;
	}
	return ret;
}

int iio_channel_attr_read_bool(const struct iio_channel *chn, const char *attr, bool *val)
{
	const struct iio_attr *a = chn ? iio_channel_find_attr(chn, attr) : NULL;
	int ret = a ? iio_attr_read_bool(a, val) : (chn ? -ENOENT : -ENODEV);

	if (!chn)
		printf("chn_read_bool (none) %s = %d\n", attr, ret);
	else if (ret < 0)
		printf("chn_read_bool %s %s %s = %d\n", iio_channel_get_id(chn), dir(chn), attr, ret);
	else
		printf("chn_read_bool %s %s %s = 0 %d\n", iio_channel_get_id(chn), dir(chn), attr,
				(int)*val);
	return ret < 0 ? ret : 0;
}

int iio_channel_attr_write_bool(const struct iio_channel *chn, const char *attr, bool val)
{
	const struct iio_attr *a = chn ? iio_channel_find_attr(chn, attr) : NULL;
	int ret = a ? iio_attr_write_bool(a, val) : (chn ? -ENOENT : -ENODEV);

	ret = ret < 0 ? ret : 0;
	if (!chn)
		printf("chn_write_bool (none) %s %d = %d\n", attr, (int)val, ret);
	else
		printf("chn_write_bool %s %s %s %d = %d\n", iio_channel_get_id(chn), dir(chn), attr,
				(int)val, ret);
	return ret;
}

int iio_channel_attr_read_longlong(const struct iio_channel *chn, const char *attr, long long *val)
{
	const struct iio_attr *a = iio_channel_find_attr(chn, attr);
	int ret = a ? iio_attr_read_longlong(a, val) : -ENOENT;

	if (ret < 0)
		printf("chn_read_longlong %s %s %s = %d\n", iio_channel_get_id(chn), dir(chn), attr, ret);
	else
		printf("chn_read_longlong %s %s %s = 0 %lld\n", iio_channel_get_id(chn), dir(chn),
				attr, *val);
	return ret < 0 ? ret : 0;
}

int iio_channel_attr_write_longlong(const struct iio_channel *chn, const char *attr, long long val)
{
	const struct iio_attr *a = iio_channel_find_attr(chn, attr);
	int ret = a ? iio_attr_write_longlong(a, val) : -ENOENT;

	ret = ret < 0 ? ret : 0;
	printf("chn_write_longlong %s %s %s %lld = %d\n", iio_channel_get_id(chn), dir(chn), attr,
			val, ret);
	return ret;
}

int main(int argc, char **argv)
{
	struct iio_context *ctx;
	struct iio_device *dev;
	char uri[4096];
	int i, ret;

	if (argc < 4) {
		fprintf(stderr, "usage: %s <context.xml> <fir text file or -> <rate> [<rate> ...]\n",
				argv[0]);
		return 2;
	}
	snprintf(uri, sizeof(uri), "emu:%s", argv[1]);
	ctx = iio_create_context(NULL, uri);
	ret = iio_err(ctx);
	if (ret) {
		fprintf(stderr, "no context %s: %d\n", uri, ret);
		return 1;
	}
	dev = iio_context_find_device(ctx, "ad9361-phy");
	if (!dev) {
		fprintf(stderr, "no ad9361-phy in %s\n", uri);
		return 1;
	}
	for (i = 3; i < argc; i++) {
		unsigned long rate = strtoul(argv[i], NULL, 10);

		printf("CALL ad9361_set_bb_rate %lu\n", rate);
		ret = ad9361_set_bb_rate(dev, rate);
		printf("RET %d\n", ret);
	}
	if (strcmp(argv[2], "-") && fir_text) {
		FILE *f = fopen(argv[2], "wb");

		if (!f || fwrite(fir_text, 1, fir_len, f) != fir_len || fclose(f)) {
			fprintf(stderr, "cannot write %s\n", argv[2]);
			return 1;
		}
	}
	free(fir_text);
	iio_context_destroy(ctx);
	return 0;
}
