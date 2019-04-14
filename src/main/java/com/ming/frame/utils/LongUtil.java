package com.ming.frame.utils;


/**
 * @author 
 * @time 2017年11月6日
 * @desc Double精度计算帮助类
 * @company cn.dh.itgroup
 * @project common
 */
public class LongUtil extends ObjectUtil {


 

	public static Long valueOf(Object value) {
		try{
			return Long.valueOf(StringUtil.value(value));	
		}
		catch(Exception e)
		{
			return 0L;
		}
	}
	 
}
