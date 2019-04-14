package com.ming.frame.utils;

import java.lang.reflect.Field;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/**
 * @author 
 * @time 2017年11月6日
 * @desc 字符串帮助类
 * @company cn.dh.itgroup
 * @project common
 */
public class StringUtil extends ObjectUtil {

	public static boolean isEmpty(String s) {
		return isNull(s) || "".equals(s);
	}

	public static String value(Object s) {
		if (ObjectUtil.isNull(s)) {
			return "";
		} else {
			return String.valueOf(s);
		}
	}

	public static boolean isEmail(String email) {
		if (isEmpty(email)) {
			return false;
		}
		Pattern p = Pattern.compile("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*");// 复杂匹配
		Matcher m = p.matcher(email);
		return m.matches();
	}

	public static boolean isPhoneNO(String mobiles) {
		if (isEmpty(mobiles)) {
			return false;
		}
		Pattern p = Pattern.compile("^([0\\+]\\d{2,3}(\\s)?)?1\\d{10}$");
		Matcher m = p.matcher(mobiles);
		return m.matches();
	}

	public static String[] stringSplitByCommaToArray(String str) {
		String[] strs = {};
		if (!StringUtil.isNull(str)) {
			strs = str.split(",");
		}
		return strs;
	}

	public static String arrayToStringSplitByComma(List<String> array) {
		String rt = "";
		if (!ObjectUtil.isNull(array)) {
			for (String a : array) {
				rt += "," + a;
			}
			if (!StringUtil.isEmpty(rt)) {
				rt = rt.substring(1, rt.length());
			}
		}
		return rt;
	}

	public static String arrayToStringSplitByComma(String[] array) {
		String rt = "";
		if (!ObjectUtil.isNull(array)) {
			for (String a : array) {
				rt += "," + a;
			}
			if (!StringUtil.isEmpty(rt)) {
				rt = rt.substring(1, rt.length());
			}
		}
		return rt;
	}

	public static boolean equals(String s1, String s2) {
		if (ObjectUtil.isNull(s1)) {
			if (ObjectUtil.isNull(s2)) {
				return true;
			}
			return false;
		}
		return s1.equals(s2);
	}

	public static String[] readObjectOfProperties(Object obj, String... props) {
		if (ListUtil.isEmpty(props)) {
			return null;
		}
		if (ObjectUtil.isNull(obj)) {
			return null;
		}
		String[] arrays = new String[props.length];
		Class<? extends Object> clazz = obj.getClass();
		for (int i = 0; i < props.length; i++) {
			String p = props[i];
			try {
				Field f = clazz.getDeclaredField(p);
				f.setAccessible(true);
				Object val = f.get(obj);
				if (val == null) {
					arrays[i] = "";
					continue;
				}
				String type = f.getType().toString();
				if (type.endsWith("Date")) {
					arrays[i] = DateUtil.format((Date) val, "yyyy-MM-dd HH:mm:ss");
					continue;
				}
				if (type.endsWith("Double")) {
					DecimalFormat df = new DecimalFormat("#.00");
					System.out.println(df.format(val));
					arrays[i] = df.format(val);
					continue;
				}

				arrays[i] = String.valueOf(val);
			} catch (Exception e) {
				e.printStackTrace();
				arrays[i] = null;
			}
		}
		return arrays;
	}
}
