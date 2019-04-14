package com.ming.quartz;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ming.frame.utils.DateUtil;

public class TestMain {
	public static void main(String[] args) {
		runTask();
		//getDate();
		//processBigDecimal();
		//getCurrentDate();
	}
	
	private static void getDate()
	{
		Map<String, Date> yesMap = new HashMap<String,Date>();
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
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
	}
	
	private static void runTask()
	{
		//quartz 测试
		ApplicationContext ctx = new  ClassPathXmlApplicationContext("classpath:/config/spring/spring-quartz.xml");
	}
	
	private static void processBigDecimal()
	{
		BigDecimal big = new BigDecimal(300.00);
		//big = big.add(new BigDecimal(5));
		System.out.println(big.compareTo(BigDecimal.ZERO));
	}
	
	private static void getCurrentDate()
	{
		System.currentTimeMillis();
		Date cur = new Date();
		Calendar cal = Calendar.getInstance();
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		System.out.println(hour);
	}
	

}
