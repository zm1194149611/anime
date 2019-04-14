package com.ming.frame.spring.init;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ming.frame.spring.SpringApplicationContext;
import com.ming.frame.utils.ObjectUtil;

/**
 * 系统初始化线程
 * @author 
 * @time 2018-11-04
 */
public class InitThread implements Runnable {
	private final Logger log = LoggerFactory.getLogger(getClass());

	@Override
	public void run() {
		//获取需要实现初始化接口的所有的实体类
		Map<String, InitService> map = SpringApplicationContext.applicationContext().getBeansOfType(InitService.class);
		if (!ObjectUtil.isNull(map)) {
			for (Map.Entry<String, InitService> entry : map.entrySet()) {
				try {
					log.debug(entry.getValue().getClass() + "开始初始化!");
					entry.getValue().init();
					log.debug(entry.getValue().getClass() + "初始化完成!");
				} catch (Exception e) {
					log.error(entry.getValue().getClass() + "初始化出错");
					e.printStackTrace();
				}
			}
		}
	}
}
