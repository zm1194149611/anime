package com.ming.frame.utils;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 
 * @time 2017年11月6日
 * @desc Double精度计算帮助类
 * @company cn.dh.itgroup
 * @project common
 */
public class DoubleUtil extends ObjectUtil {

	private static Map<String, DecimalFormat> mapformat = new HashMap<String, DecimalFormat>();

	public static double parseDouble(String value) {
		if (StringUtil.isEmpty(value)) {
			return 0;
		}
		return Double.parseDouble(value);
	}

	public static double valueOf(Double value) {
		if (ObjectUtil.isNull(value)) {
			return 0;
		}
		return value;
	}
	

	private static DecimalFormat mapFormat(String str) {
		DecimalFormat sdf = mapformat.get(str);
		if (ObjectUtil.isNull(sdf)) {
			sdf = new DecimalFormat(str);
			mapformat.put(str, sdf);
		}
		return sdf;
	}

	public static String format(Double value) {
		return format(valueOf(value), "#.00");
	}

	public static String format(Double value, String format) {
		DecimalFormat df = mapFormat(format);
		return df.format(valueOf(value));
	}

	public static Double formatAmount(Double d) {
		String s = format(valueOf(d), "0.00");
		return Double.valueOf(s);
	}

	/**
	 * 比较两个double相等
	 * 
	 * @param a
	 * @param b
	 * @return
	 */
	public static boolean equal(double a, double b) {
		if (a - b < 0.01 && b - a < 0.01) {
			return true;
		}
		return false;
	}

	public static boolean amountEqual(double a, double b) {
		if (a - b < 0.01 && b - a < 0.01) {
			return true;
		}
		return false;
	}

	/**
	 * 进行加法运算
	 * 
	 * @param d1
	 * @param d2
	 * @return
	 */
	public static double add(double d1, double d2) {
		BigDecimal b1 = new BigDecimal(Double.toString(d1));
		BigDecimal b2 = new BigDecimal(Double.toString(d2));
		return b1.add(b2).doubleValue();
	}

	/**
	 * 进行减法运算
	 * 
	 * @param d1
	 * @param d2
	 * @return
	 */
	public static double sub(double d1, double d2) {
		BigDecimal b1 = new BigDecimal(Double.toString(d1));
		BigDecimal b2 = new BigDecimal(Double.toString(d2));
		return b1.subtract(b2).doubleValue();
	}

	/**
	 * 进行乘法运算 进行四舍五入
	 * 
	 * @param d1
	 * @param d2
	 * @param scale 有效数字
	 * @return
	 */
	public static double mul(double d1, double d2, int scale) {
		BigDecimal b1 = new BigDecimal(Double.toString(d1));
		BigDecimal b2 = new BigDecimal(Double.toString(d2));
		return b1.multiply(b2).setScale(scale, BigDecimal.ROUND_HALF_UP).doubleValue();
	}
	
	
	
	/**
	 * 进行乘法运算 ,小数都舍弃
	 * @param d1
	 * @param d2
	 * @param scale
	 * @return
	 */
	public static double mul4(double d1, double d2, int scale) {
		BigDecimal b1 = new BigDecimal(Double.toString(d1));
		BigDecimal b2 = new BigDecimal(Double.toString(d2));
		return b1.multiply(b2).setScale(scale, BigDecimal.ROUND_HALF_DOWN).doubleValue();
	}
	
	/**
	 * 进行乘法运算 进行四舍五入
	 * @param d1
	 * @param d2
	 * @param scale
	 * @return
	 */
	public static double mul2(BigDecimal d1, BigDecimal d2, int scale) {
		return d1.multiply(d2).setScale(scale, BigDecimal.ROUND_HALF_UP).doubleValue();
	}
	
	/**
	 * 进行乘法运算 ,有小数直接舍弃，取整
	 * @param d1
	 * @param d2
	 * @param scale
	 * @return
	 */
	public static double mul3(BigDecimal d1, BigDecimal d2, int scale) {
		return d1.multiply(d2).setScale(scale, BigDecimal.ROUND_HALF_DOWN).doubleValue();
	}
	
	

	/**
	 * 进行除法运算 进行四舍五入
	 * 
	 * @param d1
	 * @param d2
	 * @param scale
	 * @return
	 */
	public static double div(double d1, double d2, int scale) {
		BigDecimal b1 = new BigDecimal(Double.toString(d1));
		BigDecimal b2 = new BigDecimal(Double.toString(d2));
		return b1.divide(b2).setScale(scale, BigDecimal.ROUND_HALF_UP).doubleValue();
	}
	
	public static BigDecimal div2(double d1, double d2, int scale) {
		BigDecimal b1 = new BigDecimal(Double.toString(d1));
		BigDecimal b2 = new BigDecimal(Double.toString(d2));
		return b1.divide(b2,scale,BigDecimal.ROUND_HALF_DOWN);
	}
	
	/**
	 * 
	 * devideFormat
	 * 数据处理工具 
	 * @param sourceData 源数据，被除数
	 * @param devideData 除数
	 * @param significant 有效数字位数
	 * @return   
	 * @exception   
	 * @since  1.0.0
	 */
	public static BigDecimal devideFormat(double sourceData,double devideData,String significant)
	{
		double d = sourceData/devideData;
		DecimalFormat Chargeformat = new DecimalFormat(significant);  //保留几位有效数字
		BigDecimal formatResult = new BigDecimal(Chargeformat.format(d));
		return formatResult;
	}
	

}
