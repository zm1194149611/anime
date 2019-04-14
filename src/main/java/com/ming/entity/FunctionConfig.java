package com.ming.entity;

import java.util.Date;

import com.ming.frame.base.entity.BaseEntity;

/**
 * 
 * 后台功能配置表  
 * FunctionConfig
 * yangyang   
 * 2018年1月9日 上午12:01:15 
 * 
 * @version 1.0.0  
 *
 */
public class FunctionConfig extends BaseEntity{
	
	private static final long serialVersionUID = -4777543664946061466L;
	public String configKey;
	public String configValue;
	public String configDesc;
	private Date createDate;
	private Integer configType;
	private String configCharge;
	private String configExt1;
	private String configExt2;
	
	public String getConfigKey() {
		return configKey;
	}
	public void setConfigKey(String configKey) {
		this.configKey = configKey;
	}
	public String getConfigValue() {
		return configValue;
	}
	public void setConfigValue(String configValue) {
		this.configValue = configValue;
	}
	public String getConfigDesc() {
		return configDesc;
	}
	public void setConfigDesc(String configDesc) {
		this.configDesc = configDesc;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Integer getConfigType() {
		return configType;
	}
	public void setConfigType(Integer configType) {
		this.configType = configType;
	}
	public String getConfigCharge() {
		return configCharge;
	}
	public void setConfigCharge(String configCharge) {
		this.configCharge = configCharge;
	}
	public String getConfigExt1() {
		return configExt1;
	}
	public void setConfigExt1(String configExt1) {
		this.configExt1 = configExt1;
	}
	public String getConfigExt2() {
		return configExt2;
	}
	public void setConfigExt2(String configExt2) {
		this.configExt2 = configExt2;
	}
	
	
	
}

