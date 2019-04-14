package com.ming.frame.spring.init;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 数据初始化接口
 * Author : ming.zhao
 * Date : 2018-11-04
 * Verion : 3.0
 * DESC: 系统启动初始化接口
 */
public abstract class InitService
{
	
	protected final Logger log = LoggerFactory.getLogger(getClass());

    /**
     * 初始化数据
     */
	public abstract void init() throws Exception;
	
	 
}
