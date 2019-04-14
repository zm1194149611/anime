package com.ming.frame.exception;

public enum BaseCode implements ECode{
	SUCCESS("000000","成功"),
	
	USER_NOT_LOGIN("000001","用户尚未登录或登录已失效"),
	
	IAP_VERIFY_FAIL("21005","iOS内购收据服务器当前不可用"),

	DEVICE_REQUIRED("900000","device required"),
	TIME_OUT_LIMIT("900001","请求体时间不匹配"),
	SIGN_NOT_MATCH("900002","请求体签名不匹配"),
	
	PARAM_NOT_CORRECT("900003","请求参数不正确"),
	PARAM_DUMPLE_ERROR("900004","数据重复"),
	PARAM_NO_REGIST_ERROR("900007","账号未注册"),
	PARAM_REQUIRED("900005","请求参数不全"),
	TOKEN_NOT_CORRECT("900006","token不匹配"),
	PARAM_PAY_TYPE_ERROR("900008","支付通道不正确"),
	USER_FORBIDDEN("900009","账号被禁用"),
	UNKNOW_ERROR("999999","未知错误")
	
	
	
	;
	
	
	
	
	
	
	
	String message;
	String code;
	BaseCode(String code,String message){
		this.code = code;
		this.message = message;
	}
	

	@Override
	public String getMessage() {
		 
		return message;
	}

	@Override
	public String getCode() {
		return code;
	}

}
