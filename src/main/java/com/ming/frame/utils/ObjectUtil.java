package com.ming.frame.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.ArrayUtils;
/**
 * @author 
 * @time 2017年11月6日
 * @desc 对象转换类
 * @company cn.dh.itgroup
 * @project common
 */
public class ObjectUtil {

	public static boolean isNull(Object o) {
		return o == null;
	}

	public static boolean isNotNull(Object o) {
		return o != null;
	}

	public static Object mapToObject(Map<String, Object> map, Class<?> beanClass) throws Exception {
		if (map == null)
			return null;

		Object obj = beanClass.newInstance();

		Field[] fields = obj.getClass().getDeclaredFields();
		for (Field field : fields) {
			int mod = field.getModifiers();
			if (Modifier.isStatic(mod) || Modifier.isFinal(mod)) {
				continue;
			}

			field.setAccessible(true);
			field.set(obj, map.get(field.getName()));
		}

		return obj;
	}

	public static Map<String, Object> objectToMap(Object obj) throws Exception {
		if (obj == null) {
			return null;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		Field[] declaredFields = obj.getClass().getDeclaredFields();
		for (Field field : declaredFields) {
			field.setAccessible(true);
			map.put(field.getName(), field.get(obj));
		}
		return map;
	}

	/**
	 * getFileds获取所有public 属性<br/>
	 * getDeclaredFields 获取所有声明的属性<br/>
	 * 
	 * @param bean
	 * @return 将某个类及其继承属性全部添加到Map中
	 */
	public static Map<String, Object> beanToMap(Object bean) {
		Map<String, Object> result = new HashMap<String, Object>();
		if (bean == null) {
			return result;
		}

		// Field[] fields = ;
		// List<Field> fieldsList = Arrays.asList(fields);
		// fieldsList.addAll(Arrays.asList();

		Field[] fields = ArrayUtils.addAll(bean.getClass().getDeclaredFields(),
				bean.getClass().getSuperclass().getDeclaredFields());
		if (fields == null || fields.length == 0) {
			return result;
		}

		for (Field field : fields) {
			// 重置属性可见(而且一般属性都是私有的)，否则操作无效
			boolean accessible = field.isAccessible();
			if (!accessible) {
				field.setAccessible(true);
			}

			// 获取属性名称及值存入Map
			String key = field.getName();
			try {
				result.put(key, field.get(bean));
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}

			// 还原属性标识
			field.setAccessible(accessible);
		}
		return result;
	}
	
	
	 public static Field getDeclaredField(Class<?> clazz, String fieldName){  
	        Field field = null ;  
	          
	          
	        for(; clazz != Object.class ; clazz = clazz.getSuperclass()) {  
	            try {  
	                field = clazz.getDeclaredField(fieldName) ;  
	                return field ;  
	            } catch (Exception e) {  
	            }   
	        }
	        return null;  
	    }     
}
