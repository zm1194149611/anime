package com.ming.frame.utils;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 
 * @time 2017年11月6日
 * @desc Map与List转换工具类
 * @company cn.dh.itgroup
 * @project common
 */
public class MapListUtil {

	/**
	 * @author 
	 * @time 2017年11月15日
	 * @desc 将集合转换位字典
	 * @company cn.dh.itgroup
	 * @project common
	 */
	public static <T> Map<Long, T> toMap(List<T> list) throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchFieldException {
		return toMap(list, "id", Long.class);
	}

	/**
	 * @author 
	 * @time 2017年11月15日
	 * @desc  将集合转换位字典
	 * @company cn.dh.itgroup
	 * @project common
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static <T, E> Map<E, T> toMap(List<T> list, String key, Class E)
			throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchFieldException {
		Map<E, T> map = new HashMap<E, T>();
		if (!(ObjectUtil.isNull(list) || list.isEmpty())) {
			for (T t : list) {
				Class obj = t.getClass();
				E o = null;
				if (t instanceof Map) {
					Map<String, Object> m = (Map) t;
					o = (E) m.get(key);
				} else {
					Field field = ObjectUtil.getDeclaredField(obj, key);
					if (ObjectUtil.isNull(field)) {
						throw new NoSuchFieldException();
					}
					field.setAccessible(true);
					o = (E) field.get(t);
				}
				map.put(o, t);
			}
		}
		return map;
	}

	public static <T> Map<String, List<T>> toMapList(List<T> list, String key) throws SecurityException,
			IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchFieldException {
		return toMapList(list, key, String.class);
	}

	/**
	 * @author 
	 * @time 2017年11月13日
	 * @desc 把List<T>中有父子关系的list结构转换位Map<E,List<T>>的结构
	 * @company cn.dh.itgroup
	 * @project common
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static <T, E> Map<E, List<T>> toMapList(List<T> list, String key, Class E) throws SecurityException,
			IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchFieldException {
		// 定义转换数据格式
		Map<E, List<T>> map = new HashMap<E, List<T>>();
		List<T> clist = null;
		if (!(ObjectUtil.isNull(list) || list.isEmpty())) {
			for (T t : list) {
				// 获取当前的集合中的对象的类类
				Class obj = t.getClass();
				E o = null;
				if (t instanceof Map) {
					Map<String, Object> m = (Map) t;
					o = (E) m.get(key);
				} else {
					// 获取需要反射的字段
					Field field = ObjectUtil.getDeclaredField(obj, key);
					if (ObjectUtil.isNull(field)) {
						throw new NoSuchFieldException();
					}
					// 设置字段可以访问
					field.setAccessible(true);
					o = (E) field.get(t);
				}
				clist = map.get(o);
				if (ObjectUtil.isNull(clist)) {
					clist = new ArrayList<T>();
					map.put(o, clist);
				}
				clist.add(t);
			}
		}
		return map;
	}

}
