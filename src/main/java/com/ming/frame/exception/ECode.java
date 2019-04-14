package com.ming.frame.exception;

/**
 * @author 
 * @time 2017年11月6日
 * @desc 异常信息接口
 * @company cn.dh.itgroup
 * @project common
 */
public interface ECode {

	String getMessage(); // 自定义异常信息

	String getCode(); // 异常编码
}
