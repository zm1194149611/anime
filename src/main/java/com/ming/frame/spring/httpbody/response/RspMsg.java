package com.ming.frame.spring.httpbody.response;

import java.io.Serializable;

/**
 * @author 
 * @time 2017年11月6日
 * @desc 响应报文
 * @company cn.dh.itgroup
 * @project core
 */
public class RspMsg implements Serializable {

	private static final long serialVersionUID = -8385976130245779956L;

	private String code; // 消息代码
	private String desc; // 消息描述
	private Object body; // 消息体
	private String token;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Object getBody() {
		return body;
	}

	public void setBody(Object body) {
		this.body = body;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

}
