package com.ming.frame.spring;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;

import com.ming.frame.spring.init.InitThread;

/**
 * @author 
 * @time 2017年11月6日
 * @desc 系统初始化加载类【使用spring初始化加载原理】
 * @company cn.dh.itgroup
 * @project core
 */
public class SpringLoading {

	Logger logger = LoggerFactory.getLogger(SpringLoading.class);

	/**
	 * @author 
	 * @time 2017年11月6日
	 * @desc 初始化加载线程
	 * @company cn.dh.itgroup
	 * @project core
	 */
	protected void loadingApplication(ApplicationContext applicationContext) {

		logger.info("Application Loading Start");
		// 启动初始化线程
		new Thread(new InitThread()).start();
		logger.info("Application Loading End");

	}

}
