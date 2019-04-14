package com.ming.frame.exception;

public class BaseException  extends RuntimeException{

	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7404135328474949570L;
	

	public BaseException(String message) {
		super(message);
	}

	private ECode code;

	private String  detail;

	public BaseException(ECode code) {
		super("{code:\"" + code.getCode() + "\",message:\"" + code.getMessage() + "\"}");
		this.code = code;
	}
	
	public BaseException(ECode code,String detail) {
		super("{code:\"" + code.getCode() + "\",message:\"" + detail + "\"}");
		this.detail= detail; 
		this.code = code;
	}


	public String getDetail() {
		return detail;
	}

	public ECode getECode() {
		return code;
	}
	
}
