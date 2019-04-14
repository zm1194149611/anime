package com.ming.frame.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class IDUtil {

	
	
	public static Long generate(){
		return System.currentTimeMillis();
	}
	
	
	/**
	 * 十位时间戳
	 * @return
	 */
	public static String getWxPayTime() 
	{
		long timeStampSec = System.currentTimeMillis()/1000;
		//System.out.println(timeStampSec);
        String timestamp = String.format("%010d", timeStampSec);
		return timestamp;
	}
	
	
	
	public static void main(String[] args) {
		//System.out.println(generate());
		//System.out.println(getWxPayTime());
		//10位转换日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	    String date = sdf.format(new Date(Long.valueOf(getWxPayTime()) * 1000L));  
	    System.out.println(date);
	}
}
