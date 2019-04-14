package com.ming.frame.utils;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author 
 * @time 2017年11月6日
 * @desc 列表转换工具类
 * @company cn.dh.itgroup
 * @project common
 */
public class ListUtil extends ObjectUtil {

	public static <T> List<Integer> keyArray(List<T> list) throws SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException, NoSuchFieldException {
		return keyArray(list, "id", Integer.class);
	}

	public static <T> List<String> keyArray(List<T> list, String key) throws SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException, NoSuchFieldException {

		return keyArray(list, key, String.class);
	}

	@SuppressWarnings("unchecked")
	public static <T, E> List<E> keyArray(List<T> list, String key, Class<E> E) throws SecurityException,
			IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchFieldException {
		List<E> array = new ArrayList<>();
		if (!isEmpty(list)) {
			for (T t : list) {
				Class<? extends Object> obj = t.getClass();
				Field field = ObjectUtil.getDeclaredField(obj, key);
				if (ObjectUtil.isNull(field)) {
					throw new NoSuchFieldException();
				}
				field.setAccessible(true);
				E o = (E) field.get(t);
				if(o == null)
				{
					continue;
				}
				if(o instanceof String && "".equals(o))
				{
					continue;
				}
				array.add(o);
			}
		}
		return array;
	}

	public static <T> List<T> keyArray(Map<T, Object> map) throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		if (isNotNull(map)) {
			return new ArrayList<T>(map.keySet());
		}
		return new ArrayList<T>();
	}

	public static List<String> keyArrayMap(List<Map<String, Object>> list, String key) {
		List<String> array = new ArrayList<String>();
		if (!isEmpty(list)) {
			for (Map<String, Object> t : list) {

				String o = String.valueOf(t.get(key));
				array.add(o);
			}
		}
		return array;
	}

	public static <T> List<String> propertyArray(List<Map<String, Object>> list, String property) {
		List<String> array = new ArrayList<String>();
		if (!isEmpty(list)) {
			for (Map<String, Object> map : list) {
				String o = String.valueOf(map.get(property));
				array.add(o);
			}
		}
		return array;
	}

	public static <T> boolean isEmpty(List<T> list) {
		if (list == null || list.isEmpty()) {
			return true;
		}
		return false;
	}

	public static <T> boolean isEmpty(T[] list) {
		if (list == null || list.length == 0) {
			return true;
		}
		return false;
	}

	public static <T> int size(List<T> list) {
		if (isEmpty(list))
			return 0;
		else
			return list.size();
	}

	/**
	 * 分割list
	 * 
	 * @param list
	 *            原列表对象
	 * @param step
	 *            分割条数
	 * @return
	 */
	public static <T> List<List<T>> subList(List<T> list, int step) {
		List<List<T>> arList = new ArrayList<List<T>>();
		if (!ListUtil.isEmpty(list)) {
			int size = list.size();
			int mod = size / step;
			int toIndex = step;
			List<T> l = null;
			for (int i = 0; i <= mod; i++) {
				if (i == mod) {
					toIndex = size % step;
				}
				l = list.subList(i * step, i * step + toIndex);
				if (!isEmpty(l))
					arList.add(l);
			}
		}
		return arList;
	}
}
