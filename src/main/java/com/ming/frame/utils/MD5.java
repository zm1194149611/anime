package com.ming.frame.utils;

import java.security.MessageDigest;

import org.apache.log4j.Logger;

/**
 * @author 
 * @time 2017年11月6日
 * @desc MD5加密类
 * @company cn.dh.itgroup
 * @project common
 */
public class MD5 {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(MD5.class);

	private final static String[] hexDigits = {

			"0", "1", "2", "3", "4", "5", "6", "7",

			"8", "9", "a", "b", "c", "d", "e", "f" };

	/**
	 * 将字节转化为16进制字符串
	 * 
	 * @param b
	 *            字节数组
	 * @return 16进制字符串
	 */

	private static String byteArrayToHexString(byte[] b) {

		StringBuffer resultSb = new StringBuffer();

		for (int i = 0; i < b.length; i++) {

			resultSb.append(byteToHexString(b[i]));

		}

		return resultSb.toString();

	}

	/**
	 * 将字节转化为16进制字符
	 * 
	 * @param b
	 *            字节
	 * @return 字节对应的16进制字符
	 */
	private static String byteToHexString(byte b) {

		int n = b;
		if (n < 0)
			n = 256 + n;
		int d1 = n / 16;
		int d2 = n % 16;
		return hexDigits[d1] + hexDigits[d2];
	}

	/**
	 * 对内容进行MD5加密
	 * 
	 * @param origin
	 *            要加密的数据
	 * @return MD5加密后的内容
	 */
	public static String MD5Encode(String origin) {

		String resultString = null;
		try {
			resultString = new String(origin);
			MessageDigest md = MessageDigest.getInstance("MD5");
			resultString = byteArrayToHexString(md.digest(resultString.getBytes()));

		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			throw new RuntimeException(e);
		}

		return resultString;

	}

}