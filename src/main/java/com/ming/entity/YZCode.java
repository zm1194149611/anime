package com.ming.entity;

public class YZCode {


	private String templateid;
	
	private String mobile;
	
	private String password;
	
	private String code;

	private Integer codeLen = 6;
	
	private Integer smstype; //1:注册   2:密码找回 3:绑定手机号

	public String getTemplateid() {
		return templateid;
	}

	public void setTemplateid(String templateid) {
		this.templateid = templateid;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Integer getCodeLen() {
		return codeLen;
	}

	public void setCodeLen(Integer codeLen) {
		this.codeLen = codeLen;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getSmstype() {
		return smstype;
	}

	public void setSmstype(Integer smstype) {
		this.smstype = smstype;
	}
	
	
}
