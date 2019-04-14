package com.ming.frame.spring;

import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

/**
 * @author 
 * @time 2017年11月6日
 * @desc spring上下文 
 * @company cn.dh.itgroup
 * @project core
 */
@Component
public class SpringApplicationContext extends SpringLoading implements ApplicationContextAware {

	private static ApplicationContext applicationContext;

	@SuppressWarnings("static-access")
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		//注入上下文对象
		this.applicationContext = applicationContext;
		//初始化加载事件
		this.loadingApplication(applicationContext);
	}
	
	public static ApplicationContext applicationContext() {
		return applicationContext;
	}

	/**
	 * @author 
	 * @time 2017年11月14日
	 * @desc 根据名字获取对象
	 * @company cn.dh.itgroup
	 * @project core
	 */
	public static Object getBean(String name) {
		return applicationContext.getBean(name);
	}

	/**
	 * @author 
	 * @time 2017年11月14日
	 * @desc 根据类获取对象
	 * @company cn.dh.itgroup
	 * @project core
	 */
	public static Object getBean(Class<?> clazz) {
		return applicationContext.getBean(clazz);
	}
	
	/**
	 * @author 
	 * @time 2017年11月14日
	 * @desc  根据注解获取Map
	 * @company cn.dh.itgroup
	 * @project core
	 */
	public static Map<String, Object> getBeansWithAnnotationController() {
		Map<String, Object> beanMap = applicationContext.getBeansWithAnnotation(Controller.class);
		for (Entry<String, Object> entry : beanMap.entrySet()) {
			System.out.println(entry.getKey() + "-" + entry.getValue());
		}
		return beanMap;
	}

}
