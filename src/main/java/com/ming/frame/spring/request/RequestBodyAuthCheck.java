package com.ming.frame.spring.request;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.ming.entity.User;
import com.ming.frame.exception.BaseCode;
import com.ming.frame.exception.BaseException;
import com.ming.frame.spring.httpbody.request.ReqMsg;
import com.ming.frame.spring.session.SessionHelper;
import com.ming.frame.spring.session.SessionUser;
import com.ming.frame.utils.IDUtil;
import com.ming.frame.utils.MissBusinessConst;
import com.ming.redis.RedisClient;

/**
 * @author ming.zhao
 * @time 2018年10月15日
 * @desc 请求体校验
 * @company cn.dh.itgroup
 * @project core
 */
@Component
public class RequestBodyAuthCheck {

	@Value("${project.prepath:miss}")
	private String projectPrePath;
	
	@Autowired
	private RedisClient redisClient;
	
	Logger logger = LoggerFactory.getLogger(RequestBodyAuthCheck.class);

	/**
	 * @author 
	 * @time 2017年11月15日
	 * @desc 请求体是否符合要求
	 * @company cn.dh.itgroup
	 * @project core
	 */
	public void authCheck(HttpServletRequest request, ReqMsg msg) throws Exception {
		// 获取当前登录用户
		SessionUser luser = SessionHelper.getSessionUser();
		// 获取当前请求的URL地址
		String url = request.getRequestURI();
		url = url.replace(projectPrePath, "");

		// 验证请求时间,是否超时
		Long time = msg.getTimestap();
		if (Math.abs(System.currentTimeMillis() - time) > 10 * 60 * 1000) {
			throw new BaseException(BaseCode.TIME_OUT_LIMIT);
		}
		
		if(url.contains("login")) 
		{
			SessionHelper.setToken(UUID.randomUUID().toString());
		}
		else 
		{
			if (!SessionHelper.getToken().equals(msg.getToken()) && !url.contains("code/send")) {
				throw new BaseException(BaseCode.TOKEN_NOT_CORRECT);
			}
		}
		
		//验证token
		/*if(!url.contains("login"))
		{
			if (!SessionHelper.getToken().equals(msg.getToken())) {
				throw new BaseException(BaseCode.TOKEN_NOT_CORRECT);
			}
		}*/
		// 重新设置token
		//SessionHelper.setToken(UUID.randomUUID().toString());
		
		// 签名验证
		if (!checkSignature(msg)) {
			throw new BaseException(BaseCode.SIGN_NOT_MATCH);
		}
		
		
	}
  

	/**
	 * @author 
	 * @time 2017年11月15日
	 * @desc 消息验证
	 * @company cn.dh.itgroup
	 * @project core
	 */
	private boolean checkSignature(ReqMsg msg) {
		String sign = msg.getSign(); // 消息验签
		String sha = msg.sign();
		if (sha.equalsIgnoreCase(sign)) {
			return true;
		} else {
			return false;
		}
	}

}
