package com.ming.frame.utils;

import java.util.Random;

/**
 * @author 
 * @time 2017年11月6日
 * @desc Interger计算帮助类
 * @company cn.dh.itgroup
 * @project common
 */
public class IntegerUtil extends ObjectUtil {
	
	
	public static final Integer Yes = 1;
	public static final Integer No = 0;
	

	public static Integer parseInteger(String value) {
		if (StringUtil.isEmpty(value)) {
			return null;
		}
		try {
			return Integer.parseInt(value);
		} catch (Exception e) {
			return null;
		}
	}

	public static Integer valueOf(Integer value) {
		if (ObjectUtil.isNull(value)) {
			return 0;
		}
		return value;
	}

	public static Integer valueOf(Object value) {
		if (ObjectUtil.isNull(value)) {
			return 0;
		}
		return Integer.valueOf(String.valueOf(value));
	}
	
	/**
	 * 生成一定范围内随机数
	 * @param max
	 * @param min
	 * @return
	 */
	public static Integer rand(int max,int min){
		Random rand = new Random();
		return rand.nextInt(max) + min;
	}
}
