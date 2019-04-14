package com.ming.yunpian.service;


/**
 * 云片短信接口服务
 * IYPService
 * yangyang   
 * 2018年1月7日 下午10:34:06 
 * @version 1.0.0  
 *
 */
public interface IYPService 
{
	
	public void sendYzCode(String mobile,String yzCode);
    public void sendCommonNotice(String mobile,String text);

}
