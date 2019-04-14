package com.ming.frame.spring.httpbody.request;

import java.io.Serializable;

import com.ming.frame.utils.SHA1;
import com.ming.frame.utils.StringUtil;

/**
 * @author 
 * @time 2017年11月6日
 * @desc 请求报文
 * @company cn.dh.itgroup
 * @project core
 */
public class ReqMsg implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8385976130245779956L;

	private String sign; // 签名
	private String token; // token
	private String rand; //随机数
	private Long timestap; // 时间戳
	private Object body; // 消息体

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Long getTimestap() {
		return timestap;
	}

	public void setTimestap(Long timestap) {
		this.timestap = timestap;
	}

	public Object getBody() {
		return body;
	}

	public void setBody(Object body) {
		this.body = body;
	}
 
	public String getRand() {
		return rand;
	}

	public void setRand(String rand) {
		this.rand = rand;
	}

	public String sign() {
		String tmp = StringUtil.value(rand) + StringUtil.value(timestap);
		// 加密后的结果
		String sign = new SHA1().getDigestOfString(tmp.getBytes());
		this.sign = sign;
		return sign;
	}

}
