package com.ming.frame.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

/**
 * @author 
 * @time 2017年11月6日
 * @desc 时间日历帮助类
 * @company cn.dh.itgroup
 * @project common
 */
public class CalendarUtil {

	private static Calendar getInstance() {
		return Calendar.getInstance();
	}

	public static Calendar getCalendar(Date date) {
		Calendar cal = getInstance();
		if (!ObjectUtil.isNull(date)) {
			cal.setTime(date);
		}
		return cal;
	}

	public static int dayOfWeekInMonth(Calendar calendar) {
		return calendar.get(Calendar.DAY_OF_WEEK_IN_MONTH);
	}

	public static int weekOfYear(Calendar calendar) {
		return calendar.get(Calendar.WEEK_OF_YEAR);
	}

	public static int dayOfMonth(Calendar calendar) {
		return calendar.get(Calendar.DAY_OF_MONTH);
	}

	public static int year(Calendar calendar) {
		return calendar.get(Calendar.YEAR);
	}

	public static int month(Calendar calendar) {
		int i = calendar.get(Calendar.MONTH);
		return i + 1;
	}

	public static int dayOfWeek(Calendar calendar) {
		return calendar.get(Calendar.DAY_OF_WEEK);
	}

	public static Calendar thisSunday(Calendar calendar) {
		int dayOfWeek = dayOfWeek(calendar);
		if (dayOfWeek == 1) {
			return calendar;
		}
		int step = 8 - dayOfWeek;
		calendar.add(Calendar.DAY_OF_YEAR, step);
		return calendar;
	}

	public static Calendar thisMonday(Calendar calendar) {
		int dayOfWeek = dayOfWeek(calendar);
		if (dayOfWeek == 1) {
			dayOfWeek = 8;
		}
		int step = 2 - dayOfWeek;
		calendar.add(Calendar.DAY_OF_YEAR, step);
		return calendar;
	}

	/*
	 * public static void main(String[] args) throws ParseException { String ds
	 * = "2016-3-13"; Date date = DateUtil.parse(ds); Calendar cal =
	 * getCalendar(date); System.out.println(CalendarUtil.dayOfWeek(cal)); }
	 */

	public static Calendar thisMonthStart(Calendar calendar) {
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		calendar.add(Calendar.DAY_OF_YEAR, -(day - 1));
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		return calendar;

	}

	public static Calendar thisMonthEnd(Calendar calendar) {
		int daycount = getDayNumOfMonth(calendar);
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		int step = daycount - day;
		calendar.add(Calendar.DAY_OF_YEAR, step);
		return calendar;

	}

	/**
	 * 获取当前月有多少天
	 * 
	 * @param calendar
	 * @return
	 */
	public static int getDayNumOfMonth(Calendar calendar) {
		int day = calendar.getActualMaximum(Calendar.DATE);
		return day;
	}

	public static Calendar nextWeek(Calendar calendar) {
		calendar.add(Calendar.DAY_OF_YEAR, 7);
		return calendar;
	}

	public static Calendar nextMonth(Calendar calendar) {
		calendar.add(Calendar.MONTH, 1);
		return calendar;
	}
	
	/**
	 * 获取前一天起止时间
	 * @param day   -1:前一天起止时间  ；0：当天起止时间；1：明天起止时间，其他数值依次类推
	 * @return   
	 * @exception   
	 * @since  1.0.0
	 */
	public static Map<String,Date> getYestesDay(int day){
		Map<String, Date> yesMap = new HashMap<String,Date>();
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, day);
		String yesterday = new SimpleDateFormat( "yyyy-MM-dd").format(cal.getTime());
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String yesBegDate = yesterday + " 00:00:00";
		String yesEndDate = yesterday + " 23:59:59";
		try 
		{
			Date yesterdayBegin = sdf.parse(yesBegDate);
			Date yesterdayEnd = sdf.parse(yesEndDate);
			yesMap.put("yesterdayBegin", yesterdayBegin);
			yesMap.put("yesterdayEnd", yesterdayEnd);
		} 
		catch (ParseException e)
		{
			e.printStackTrace();
		}
		return yesMap;
	}
	
	
	
	/**
	 * 获取今天凌晨0点的记录
	 * @return
	 */
	public static Date getCurrentZero()
	{
		 Calendar calendar = Calendar.getInstance();
         calendar.setTime(new Date());
         calendar.set(Calendar.HOUR_OF_DAY, 0);
         calendar.set(Calendar.MINUTE, 0);
         calendar.set(Calendar.SECOND, 0);
         Date zero = calendar.getTime();
         return zero;
	}
	
	/**
	 * 获取几分钟之前的时间(转为时间格式)
	 * @return
	 */
	public static String getCurrentBeforeMinTime(int min)
	{
	   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   Calendar beforeTime = Calendar.getInstance();
	   beforeTime.add(Calendar.MINUTE, min);// 5分钟之前的时间
	   Date beforeD = beforeTime.getTime();
	   String time = sdf.format(beforeD);
	   return time;  
	}
	
	public static String convertDate(Date date) 
	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(date != null) 
		{
			return sdf.format(date);
		}
		return null;
	}
	
	/**
	 * 获取几分钟之前的时间 （时间戳格式）
	 * @return
	 */
	public static Date getCurrentBeforeMinTimes(int min)
	{
	   Calendar beforeTime = Calendar.getInstance();
	   beforeTime.add(Calendar.MINUTE, min);// 5分钟之前的时间
	   Date beforeD = beforeTime.getTime();
	   return beforeD;  
	}
	
	
	
	/**
	 * 日期相加
	 * @param expireCnt 后几个月的日期
	 * @return
	 */
	public static Date getExpireDate(Date currentDate,int expireCnt)
	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		GregorianCalendar gc=new GregorianCalendar();
		gc.setTime(currentDate);
		gc.add(2,expireCnt);
		Date expireDate = new Date();
		try {
			expireDate = sdf.parse(sdf.format(gc.getTime()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return expireDate;
	}
	
	
	
	/**
	 * 获取当前时间是什么时间范围（上午，中午，下午，晚上，午夜）
	 * @return   
	 * @exception   
	 * @since  1.0.0
	 */
	public static int getCurrentPeriod()
	{
		int pushPeriod = 0;
		Calendar cal = Calendar.getInstance();
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		if(hour > 7 && hour <= 10)
		{
			pushPeriod = 1; //上午
		}
		else if(hour > 10 && hour <= 14)
		{
			pushPeriod = 2; //中午
		}
		else if(hour > 14 && hour <= 18)
		{
			pushPeriod = 3; //下午
		}
		else if(hour > 18 && hour <= 23)
		{
			pushPeriod = 4; //晚上
		}
		else if(hour > 23 && hour <= 7)
		{
			pushPeriod = 5; //午夜
		}
		return pushPeriod;
	}
	
	/**
	 * 获取指定年，月的起止时间
	 * @param year 年份
	 * @param month 月份
	 * @return
	 * @throws ParseException
	 */
	public static Map<String,Date> getBegEndDate(int year,int month) throws ParseException
	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		calendar.set(year, month - 1, 1);
		String beginDate = sdf.format(calendar.getTime());
		int day = calendar.getActualMaximum(5);
		calendar.set(year, month - 1, day);
		String endDate = sdf.format(calendar.getTime());
		Date BeginTime = sdfTime.parse(beginDate + " 00:00:00");
		Date EndTime = sdfTime.parse(endDate + " 23:59:59");
		Map<String,Date> shotTime = new HashMap<String,Date>();
		shotTime.put("beginTime", BeginTime);
		shotTime.put("endTime", EndTime);
		return shotTime;
	}
	
	
	/**
	 * 获取当前时间之前或者之后几天的日期
	 * @param past 当前日期前几天，  比如：获取当前时间前15天的日期
	 * @param type  "past"：过去几天，其他为未来几天
	 * @return
	 */
	public static Date getPastDate(int past,String type) 
	{  
        Calendar calendar = Calendar.getInstance();  
        if(StringUtils.isNotEmpty(type) && StringUtils.equals("past", type)) 
        {
        	calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - past);  
        }
        else 
        {
        	calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + past);  
        }
        Date today = calendar.getTime();  
        
        //转换为string
        //SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
        String result = format.format(today);
        //System.out.println(result);
        return today;  
	}
	
	public static void main(String[] args) {
		//getYestesDay(0);
	    //getBegEndDate(2018,4);
		getPastDate(7, "past");
		
	}
	
	 
	

}
