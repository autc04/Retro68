/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include <sys/time.h>
#include <time.h>
#include "atari-gem_errno.h"
#include "atari-traps.h"

/*
	Atari can only handle dates from 1980 to 2107.
	time_t on m68k is 32bit signed, so that gives us an upper limit of 2038.
	The code below uses that limitation to simplify the code.
*/

#define SEC_1970_TO_1980 315529200
#define SEC_1970_TO_MAX 0x7fffffff
#define SECONDS_IN_A_DAY (24 * 60 * 60)
#define SEC_JAN_AND_FEB ((31 + 29) * SECONDS_IN_A_DAY)	// In a leap year
#define SECONDS_IN_A_YEAR (365 * SECONDS_IN_A_DAY)

static const short month_to_day[] = {0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365};

int gettimeofday(struct timeval* tv, void* __tz)
{
	struct timezone* tz = __tz;
	if (tz != 0)
	{
		// Support for timezone have been removed from linux glibc, so we just fill in a zero timezone.
		tz->tz_minuteswest = 0;
		tz->tz_dsttime = 0;
	}
	if (tv != 0)
	{
		unsigned short date = trap1_2a();
		unsigned short time = trap1_2c();

		int year = ((date >> 9) & 0x7f);	// from 1980
		int month = ((date >> 5) & 0xf) - 1;
		int day = date & 0x1f;
		int hour = ((time >> 11) & 0x1f);
		int min = ((time >> 5) & 0x3f);
		int sec = (time & 0x1f) * 2;

		// Days passed in current year
		time_t days = day + month_to_day[month];
		// Add days for every passed year
		days += year * 365;

		// Add days for every passed leap year
		int months = year * 12 + month;	// total months
		months -= 2;	// remove januari and februari
		if (months > 0)
		{
			// We must have passed at least one leap day.
			int leap_days = (months / (12*4)) + 1;
			days += leap_days;
		}

		// Add it all together
		tv->tv_sec = (((((days * 24) + hour) * 60) + min) * 60) + sec + SEC_1970_TO_1980;
		tv->tv_usec = 0;
	}
	return 0;
}

int settimeofday(const struct timeval* tv, const struct timezone* tz)
{
	// Support for timezone have been removed from linux glibc, so we just ignore it.
	if (tv != 0)
	{
		if (tv->tv_sec < SEC_1970_TO_1980 || tv->tv_sec >= SEC_1970_TO_MAX)
		{
			// Outside the ranges we can handle.
			gem_error_to_errno(GEM_EBADRQ);
			return -1;
		}

		time_t seconds = tv->tv_sec - SEC_1970_TO_1980;
		int year = 0;
		time_t ysec = SECONDS_IN_A_YEAR;
		do
		{
			ysec = SECONDS_IN_A_YEAR;
			if ((year % 4) == 0)
			{
				ysec += SECONDS_IN_A_DAY;
			}
			++year;
			seconds -= ysec;
		} while (seconds >= 0);
		--year;
		seconds += ysec;

		int minutes = seconds / 60;
		int hours = minutes / 60;
		int days = hours / 24;
		int month = 0;
		int leap = year % 4;
		short ld = month_to_day[0];
		for (int m = 0; m < 12; ++m)
		{
			short d = month_to_day[m + 1];
			if (leap == 0 && m > 0) {d += 1;}
			if (d > days)
			{
				month = m;
				days -= ld;
				break;
			}
			ld = d;
		}

		unsigned short date = (unsigned short)(year << 9);
		date |= (unsigned short)((month + 1) << 5);
		date |= (unsigned short)days;
		unsigned short time = (unsigned short)((hours % 24) << 11);
		time |= (unsigned short)((minutes % 60) << 5);
		time |= (unsigned short)((seconds % 60) >> 1);

		int err;
		if ((err = trap1_2b(date)) < 0)
		{
			gem_error_to_errno(err);
			return -1;
		}
		if ((err = trap1_2d(time)) < 0)
		{
			gem_error_to_errno(err);
			return -1;
		}
	}
	return 0;
}
