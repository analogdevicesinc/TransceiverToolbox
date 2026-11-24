/*
 * What ad9361_fmcomms5_multichip_sync of libad9361-iio does to an emulated
 * FMComms5.
 *
 *   mcs_harness <context.xml> <flags> <reg 0x6> <reg 0x7> <slave rate>
 *
 * Creates the context "emu:<context.xml>" with libiio v1 and prepares it:
 * the registers 0x6 and 0x7 of ad9361-phy get the values <reg 0x6> and
 * <reg 0x7> (the emulation has no register until one is written), and with
 * a <slave rate> other than 0 the attribute sampling_frequency of the output
 * channel voltage0 of ad9361-phy-B gets that value. A context without
 * ad9361-phy or ad9361-phy-B is not prepared. Then it calls the unchanged
 * ad9361_fmcomms5_multichip_sync of libad9361-iio (ad9361_multichip_sync.c)
 * with <flags> and prints every attribute and register access that the
 * function makes, in call order:
 *
 *   CALL ad9361_fmcomms5_multichip_sync <flags>
 *   chn_read_longlong <device> <channel> <in|out> <attribute> = <status> [<value>]
 *   chn_write_longlong <device> <channel> <in|out> <attribute> <value> = <status>
 *   reg_read <device> 0x<address> = <status> [0x<value>]
 *   reg_write <device> 0x<address> 0x<value> = <status>
 *   dev_read <device> <attribute> = <status> [<text>]
 *   dev_write <device> <attribute> <text> = <status>
 *   dev_write_longlong <device> <attribute> <value> = <status>
 *   debug_write_longlong <device> <attribute> <value> = <status>
 *   RET <return value>
 *
 * <status> is 0 for success and the negative errno otherwise; a value follows
 * a read that succeeded. What the function prints to stderr is not kept.
 *
 * The v0 functions are implemented below on libiio v1 with the return values
 * of libiio v0: -ENOENT for an attribute that does not exist.
 */
#include "iio.h"

#include <errno.h>
#include <inttypes.h>
#include <stdio.h>
#include <string.h>

#undef iio_device_reg_read
#undef iio_device_reg_write

int ad9361_fmcomms5_multichip_sync(struct iio_context *ctx, unsigned int flags);

static const char *dev_name(const struct iio_device *dev)
{
	const char *name = iio_device_get_name(dev);

	return name ? name : iio_device_get_id(dev);
}

static const char *dir(const struct iio_channel *chn)
{
	return iio_channel_is_output(chn) ? "out" : "in";
}

int mcs_reg_read(struct iio_device *dev, uint32_t address, uint32_t *value)
{
	int ret = iio_device_reg_read(dev, address, value);

	if (ret < 0)
		printf("reg_read %s 0x%" PRIx32 " = %d\n", dev_name(dev), address, ret);
	else
		printf("reg_read %s 0x%" PRIx32 " = 0 0x%" PRIx32 "\n", dev_name(dev), address,
				*value);
	return ret;
}

int mcs_reg_write(struct iio_device *dev, uint32_t address, uint32_t value)
{
	int ret = iio_device_reg_write(dev, address, value);

	printf("reg_write %s 0x%" PRIx32 " 0x%" PRIx32 " = %d\n", dev_name(dev), address, value,
			ret < 0 ? ret : 0);
	return ret;
}

ssize_t iio_device_attr_read(const struct iio_device *dev, const char *attr, char *dst, size_t len)
{
	const struct iio_attr *a = iio_device_find_attr(dev, attr);
	ssize_t ret = a ? iio_attr_read_raw(a, dst, len) : -ENOENT;

	if (ret < 0)
		printf("dev_read %s %s = %d\n", dev_name(dev), attr, (int)ret);
	else
		printf("dev_read %s %s = 0 %s\n", dev_name(dev), attr, dst);
	return ret;
}

ssize_t iio_device_attr_write(const struct iio_device *dev, const char *attr, const char *src)
{
	const struct iio_attr *a = iio_device_find_attr(dev, attr);
	ssize_t ret = a ? iio_attr_write_string(a, src) : -ENOENT;

	printf("dev_write %s %s %s = %d\n", dev_name(dev), attr, src, ret < 0 ? (int)ret : 0);
	return ret;
}

int iio_device_attr_write_longlong(const struct iio_device *dev, const char *attr, long long val)
{
	const struct iio_attr *a = iio_device_find_attr(dev, attr);
	int ret = a ? iio_attr_write_longlong(a, val) : -ENOENT;

	ret = ret < 0 ? ret : 0;
	printf("dev_write_longlong %s %s %lld = %d\n", dev_name(dev), attr, val, ret);
	return ret;
}

int iio_device_debug_attr_write_longlong(const struct iio_device *dev, const char *attr,
		long long val)
{
	const struct iio_attr *a = iio_device_find_debug_attr(dev, attr);
	int ret = a ? iio_attr_write_longlong(a, val) : -ENOENT;

	ret = ret < 0 ? ret : 0;
	printf("debug_write_longlong %s %s %lld = %d\n", dev_name(dev), attr, val, ret);
	return ret;
}

int iio_channel_attr_read_longlong(const struct iio_channel *chn, const char *attr, long long *val)
{
	const struct iio_attr *a = iio_channel_find_attr(chn, attr);
	int ret = a ? iio_attr_read_longlong(a, val) : -ENOENT;
	const char *dev = dev_name(iio_channel_get_device(chn));

	if (ret < 0)
		printf("chn_read_longlong %s %s %s %s = %d\n", dev, iio_channel_get_id(chn), dir(chn),
				attr, ret);
	else
		printf("chn_read_longlong %s %s %s %s = 0 %lld\n", dev, iio_channel_get_id(chn),
				dir(chn), attr, *val);
	return ret < 0 ? ret : 0;
}

int iio_channel_attr_write_longlong(const struct iio_channel *chn, const char *attr, long long val)
{
	const struct iio_attr *a = iio_channel_find_attr(chn, attr);
	int ret = a ? iio_attr_write_longlong(a, val) : -ENOENT;

	ret = ret < 0 ? ret : 0;
	printf("chn_write_longlong %s %s %s %s %lld = %d\n",
			dev_name(iio_channel_get_device(chn)), iio_channel_get_id(chn), dir(chn), attr,
			val, ret);
	return ret;
}

static int prepare(struct iio_context *ctx, uint32_t reg6, uint32_t reg7, long long slave_rate)
{
	struct iio_device *master = iio_context_find_device(ctx, "ad9361-phy");
	struct iio_device *slave = iio_context_find_device(ctx, "ad9361-phy-B");
	struct iio_channel *chn;
	const struct iio_attr *a;
	int ret;

	if (!master || !slave)
		return 0;
	ret = iio_device_reg_write(master, 0x6, reg6);
	if (ret < 0)
		return ret;
	ret = iio_device_reg_write(master, 0x7, reg7);
	if (ret < 0)
		return ret;
	if (!slave_rate)
		return 0;
	chn = iio_device_find_channel(slave, "voltage0", true);
	a = chn ? iio_channel_find_attr(chn, "sampling_frequency") : NULL;
	return a ? iio_attr_write_longlong(a, slave_rate) : -ENOENT;
}

int main(int argc, char **argv)
{
	struct iio_context *ctx;
	unsigned int flags;
	char uri[4096];
	int ret;

	if (argc != 6) {
		fprintf(stderr, "usage: %s <context.xml> <flags> <reg 0x6> <reg 0x7> <slave rate>\n",
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
	flags = (unsigned int)strtoul(argv[2], NULL, 0);
	ret = prepare(ctx, (uint32_t)strtoul(argv[3], NULL, 0), (uint32_t)strtoul(argv[4], NULL, 0),
			strtoll(argv[5], NULL, 10));
	if (ret < 0) {
		fprintf(stderr, "cannot prepare %s: %d\n", uri, ret);
		return 1;
	}
	printf("CALL ad9361_fmcomms5_multichip_sync %u\n", flags);
	fflush(stdout);
	ret = ad9361_fmcomms5_multichip_sync(ctx, flags);
	printf("RET %d\n", ret);
	iio_context_destroy(ctx);
	return 0;
}
