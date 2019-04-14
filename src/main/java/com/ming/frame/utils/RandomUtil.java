package com.ming.frame.utils;

import java.util.Random;
/**
 * @author 
 * @time 2017年11月6日
 * @desc 随机数帮助类
 * @company cn.dh.itgroup
 * @project common
 */
public class RandomUtil {

	 

	/**
	 * 获取随机正整数
	 * 
	 * @param n 随机位数
	 * @return
	 */
	public static int randomInt(Integer n) {
		return (int)((Math.random()*9+1)*Math.pow(10, n-1));
	}
	
	/**
	 * 获取范围内随机数
	 * @param max
	 * @param min
	 * @return
	 */
	public static int getRandom(int max,int min) 
	{
		 Random random = new Random();
	     int s = random.nextInt(max)%(max-min+1) + min;
	     return s;
	}
	
	
 
}
