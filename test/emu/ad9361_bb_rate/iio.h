/*
 * Stand-in for the libiio v0 header that libad9361-iio includes.
 *
 * ad9361_baseband_auto_rate.c of libad9361-iio is written for libiio v0. This
 * header gives it the v0 functions it calls; bb_rate_harness.c implements them
 * on libiio v1 and logs every call. iio_device_find_channel is the function of
 * libiio v1 itself: it has the same form in both versions.
 */
#ifndef BB_RATE_HARNESS_IIO_H
#define BB_RATE_HARNESS_IIO_H

#include <iio/iio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <sys/types.h>

int iio_device_attr_read_bool(const struct iio_device *dev, const char *attr, bool *val);
int iio_device_attr_write_bool(const struct iio_device *dev, const char *attr, bool val);
ssize_t iio_device_attr_read(const struct iio_device *dev, const char *attr, char *dst, size_t len);
ssize_t iio_device_attr_write_raw(const struct iio_device *dev, const char *attr,
		const void *src, size_t len);
int iio_channel_attr_read_bool(const struct iio_channel *chn, const char *attr, bool *val);
int iio_channel_attr_write_bool(const struct iio_channel *chn, const char *attr, bool val);
int iio_channel_attr_read_longlong(const struct iio_channel *chn, const char *attr, long long *val);
int iio_channel_attr_write_longlong(const struct iio_channel *chn, const char *attr, long long val);

#endif
