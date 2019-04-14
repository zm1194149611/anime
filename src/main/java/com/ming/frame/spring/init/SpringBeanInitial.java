package com.ming.frame.spring.init;

import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.ming.frame.spring.SpringApplicationContext;

/**
 * @author 
 * @time 2018-11-04
 * @desc spring加载对象
 */
@Component
public class SpringBeanInitial extends InitService {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public void init() throws Exception {
		Thread.sleep(1000);
		Map<String, Object> map = new TreeMap<>();
		map.putAll(SpringApplicationContext.applicationContext().getBeansWithAnnotation(Component.class));
		for (Entry<String, Object> entry : map.entrySet()) {
			logger.debug("spring-load --------- : " + entry.getKey() + " -- " + entry.getValue().toString());
		}
	}

}
