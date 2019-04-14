package com.ming.frame.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 
 * @time 2017年11月6日
 * @desc 时间操作类
 * @company cn.dh.itgroup
 * @project common
 */
public class DateUtil {

	public static Date getDate() {
		return new Date();
	}

	@SuppressWarnings("deprecation")
	public static Date dayStart(Date date) {
		if (ObjectUtil.isNotNull(date)) {
			date.setHours(0);
			date.setMinutes(0);
			date.setSeconds(0);
		}
		return date;
	}

	@SuppressWarnings("deprecation")
	public static Date dayEnd(Date date) {
		if (ObjectUtil.isNotNull(date)) {
			date.setHours(23);
			date.setMinutes(59);
			date.setSeconds(59);
		}
		return date;
	}

	private static Map<String, SimpleDateFormat> mapformat = new HashMap<String, SimpleDateFormat>();

	private static SimpleDateFormat mapFormat(String str) {
		SimpleDateFormat sdf = mapformat.get(str);
		if (ObjectUtil.isNull(sdf)) {
			sdf = new SimpleDateFormat(str);
			mapformat.put(str, sdf);
		}
		return sdf;
	}

	public static String getFormat() {
		return getFormat("yyyy-MM-dd");
	}

	public static String getFormat(String format) {
		SimpleDateFormat sdf = mapFormat(format);
		return sdf.format(getDate());
	}

	public static Date parse(String dateStr) throws ParseException {
		return parse(dateStr, "yyyy-MM-dd");
	}

	public static Date parse(String dateStr, String format) throws ParseException {
		SimpleDateFormat sdf = mapFormat(format);
		return sdf.parse(dateStr);
	}

	public static String format(Date date, String format) {
		SimpleDateFormat sdf = mapFormat(format);
		return sdf.format(date);
	}

	public static String format(Date date) {
		return format(date, "yyyy-MM-dd");
	}

	public static boolean sameWeek(Date date1, Date date2) {
		boolean flag = false;
		date1 = dayStart(date1);
		date2 = dayStart(date2);
		long d1 = date1.getTime() / 1000 / 60 / 60 / 24 + 4;
		long d2 = date2.getTime() / 1000 / 60 / 60 / 24 + 4;
		if (d1 / 7 == d2 / 7) {
			flag = true;
		}
		return flag;
	}

	/**
	 * 
	 * @param startDate
	 * @param endDate
	 * @return end-start 天数
	 */
	public static int compare(Date startDate, Date endDate) {
		if (ObjectUtil.isNull(startDate) || ObjectUtil.isNull(endDate)) {
			return 0;
		}
		long start = startDate.getTime();
		long end = endDate.getTime();
		int i = (int) ((end - start) / 1000 / 24 / 60 / 60);
		return i;
	}

	/**
	 * 获取mongodb 的日期, 排除时区影响
	 * 
	 * @return
	 * @throws ParseException
	 */
	public static Date getDateForMongo() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MILLISECOND, cal.getTimeZone().getRawOffset());
		return cal.getTime();
	}

	public static Date parseDateForMongo(Date date) {
		Calendar cal = CalendarUtil.getCalendar(date);
		cal.add(Calendar.MILLISECOND, -cal.getTimeZone().getRawOffset());
		return cal.getTime();
	}

	/**
	 * 格式化日期 不含时间
	 * 
	 * @param date
	 * @return
	 */
	public static String formatDay(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		return dateFormat.format(date);
	}

	/**
	 * 格式化日期含 时分秒
	 * 
	 * @param date
	 * @return
	 */
	public static String formatTime(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateFormat.format(date);
	}

	/**
	 * 格式化日期 不含时间
	 * 
	 * @param date
	 * @return
	 */
	public static Date parseDay(String date) {
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			return dateFormat.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 格式化日期含 时分秒
	 * 
	 * @param date
	 * @return
	 */
	public static Date parseTime(String date) {
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return dateFormat.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 获取指定日期的，前/后多少个月的开始日期
	 * 
	 * @param date
	 *            指定日期
	 * @param month
	 *            正值为向后多少个月，负值为向前多少个月
	 * @return
	 */
	public static Date getMinMonthDate(Date date, int month) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, month);
		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
		return calendar.getTime();
	}

	/**
	 * 获取指定日期的，前/后多少个月的结束日期
	 * 
	 * @param date
	 *            指定日期
	 * @param month
	 *            正值为向后多少个月，负值为向前多少个月
	 * @return
	 */
	public static Date getMaxMonthDate(Date date, int month) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, month);
		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		return calendar.getTime();
	}

	/**
	 * 获取指定日期的，前/后多少周的开始日期
	 * 
	 * @param date
	 *            指定日期
	 * @param week
	 *            正值为向后多少个周，负值为向前多少个周
	 * @return
	 */
	public static Date getMinWeekDate(Date date, int week) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.WEEK_OF_YEAR, week);
		calendar.setTime(calendar.getTime());
		calendar.set(Calendar.DAY_OF_WEEK, calendar.getActualMinimum(Calendar.DAY_OF_WEEK));
		calendar.add(Calendar.DATE, 1);
		return calendar.getTime();
	}

	/**
	 * 获取指定日期的，前/后多少个周的结束日期
	 * 
	 * @param date
	 *            指定日期
	 * @param week
	 *            正值为向后多少个周，负值为向前多少个周
	 * @return
	 */
	public static Date getMaxWeekDate(Date date, int week) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.WEEK_OF_YEAR, week);
		calendar.setTime(calendar.getTime());
		calendar.set(Calendar.DAY_OF_WEEK, calendar.getActualMaximum(Calendar.DAY_OF_WEEK));
		calendar.add(Calendar.DATE, 1);
		return calendar.getTime();
	}

	/**
	 * 获取指定日期的所在月份的天数
	 * 
	 * @param date
	 * @return
	 */
	public static int getDayOfMonth(String date) {

		return DateUtil.getDayOfMonth(DateUtil.parseDay(date));
	}

	/**
	 * 获取指定日期的所在月份的天数
	 * 
	 * @param date
	 * @return
	 */
	public static int getDayOfMonth(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DATE, 1);
		calendar.roll(Calendar.DATE, -1);
		return calendar.get(Calendar.DATE);
	}

}
