/*
 * Stand-in for the libiio v0 header that libad9361-iio includes.
 *
 * ad9361_multichip_sync.c of libad9361-iio is written for libiio v0. This
 * header gives it the v0 functions it calls; mcs_harness.c implements them
 * on libiio v1 and logs every call. The register functions have the same
 * form in both versions: they are renamed here so that the harness can log
 * them too. iio_context_find_device, iio_device_find_channel and
 * iio_device_find_attr are the functions of libiio v1 themselves.
 */
#ifndef MCS_HARNESS_IIO_H
#define MCS_HARNESS_IIO_H

#include <iio/iio.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <sys/types.h>

int mcs_reg_read(struct iio_device *dev, uint32_t address, uint32_t *value);
int mcs_reg_write(struct iio_device *dev, uint32_t address, uint32_t value);
#define iio_device_reg_read mcs_reg_read
#define iio_device_reg_write mcs_reg_write

ssize_t iio_device_attr_read(const struct iio_device *dev, const char *attr, char *dst, size_t len);
ssize_t iio_device_attr_write(const struct iio_device *dev, const char *attr, const char *src);
int iio_device_attr_write_longlong(const struct iio_device *dev, const char *attr, long long val);
int iio_device_debug_attr_write_longlong(const struct iio_device *dev, const char *attr,
		long long val);
int iio_channel_attr_read_longlong(const struct iio_channel *chn, const char *attr, long long *val);
int iio_channel_attr_write_longlong(const struct iio_channel *chn, const char *attr, long long val);

#endif
