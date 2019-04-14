package com.ming.frame.spring.response;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.MethodParameter;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.MediaType;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.ming.frame.exception.BaseCode;
import com.ming.frame.exception.BaseException;
import com.ming.frame.exception.ECode;
import com.ming.frame.spring.httpbody.request.ReqMsg;
import com.ming.frame.spring.httpbody.response.RspMsg;
import com.ming.frame.spring.request.RequestHandlerAdvice;
import com.ming.frame.spring.session.SessionHelper;
import com.ming.frame.utils.JsonUtil;
import com.ming.frame.utils.MissBusinessConst;
import com.ming.frame.utils.StringUtil;
import com.ming.redis.RedisClient;

/**
 * @author 
 * @time 2017年11月6日
 * @desc 响应客户端植入
 * @company cn.dh.itgroup
 * @project core
 */
@ControllerAdvice
@SuppressWarnings("rawtypes")
public class ResponseHandlerAdvice implements ResponseBodyAdvice {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private RedisClient  redisClient;
 

	/**
	 * @author 
	 * @time 2017年11月6日
	 * @desc 捕获异常后将响应错误消息给客户端
	 * @company cn.dh.itgroup
	 * @project core
	 */
	@ExceptionHandler(BaseException.class)
	@ResponseBody
	public RspMsg BaseException(HttpServletRequest request, HttpServletResponse response, BaseException ex) {

	 
		RspMsg msg = new RspMsg();
		ECode code = ex.getECode();

		msg.setCode(code.getCode());
		if (!StringUtil.isEmpty(ex.getDetail())) {
			msg.setDesc(ex.getDetail());
		} else {
			msg.setDesc(code.getMessage());
		}

		logger.error("BaseException", ex);
		return msg;
	}

	@ExceptionHandler(IOException.class)
	@ResponseBody
	public RspMsg IOException(HttpServletRequest request, HttpServletResponse response, IOException ex) {
		RspMsg msg = new RspMsg();
		if (ex.getCause() instanceof BaseException) {
			BaseException de = (BaseException) ex.getCause();
			ECode code = de.getECode();
			msg.setCode(code.getCode());
			if (!StringUtil.isEmpty(de.getDetail())) {
				msg.setDesc(de.getDetail());
			} else {
				msg.setDesc(code.getMessage());
			}
			logger.error(ex.getCause().toString(), de);
		} else {
			BaseCode code = BaseCode.UNKNOW_ERROR;
			msg.setCode(code.getCode());
			msg.setDesc(ex.getMessage());
			logger.error("IOException", ex);
		}
		return msg;
	}

	@ExceptionHandler(RuntimeException.class)
	@ResponseBody
	public RspMsg BaseException(HttpServletRequest request, HttpServletResponse response, RuntimeException ex) {
	 
		RspMsg msg = new RspMsg();
		if (ex.getCause()!=null && ex.getCause().getCause() != null && ex.getCause().getCause() instanceof BaseException) {
			BaseException de = (BaseException) ex.getCause().getCause();
			ECode code = de.getECode();
			msg.setCode(code.getCode());
			msg.setDesc(code.getMessage());
			logger.error(ex.getCause().toString(), de);
		} else if (ex instanceof DuplicateKeyException) {
			ECode code = BaseCode.PARAM_DUMPLE_ERROR;
			msg.setCode(code.getCode());
			msg.setDesc("'" + getDulpleValue((DuplicateKeyException) ex) + "' 已被使用,请重新设置");
			logger.error("DuplicateKeyException", ex);
		} else {
			BaseCode code = BaseCode.UNKNOW_ERROR;
			msg.setCode(code.getCode());
			msg.setDesc(ex.getMessage());
			logger.error("RuntimeException", ex);
		}
		return msg;
	}

	@ExceptionHandler(Exception.class)
	@ResponseBody
	public RspMsg BaseException(HttpServletRequest request, HttpServletResponse response, Exception ex) {
	  
		RspMsg msg = new RspMsg();
		BaseCode code = BaseCode.UNKNOW_ERROR;
		msg.setCode(code.getCode());
		msg.setDesc(ex.getMessage());
		logger.error("Exception", ex);
		return msg;
	}

	@Override
	public Object beforeBodyWrite(Object arg0, MethodParameter arg1, MediaType arg2, Class arg3, ServerHttpRequest arg4,
			ServerHttpResponse arg5) {
		RspMsg msg = null;
		if (arg0 instanceof RspMsg) {
			msg = (RspMsg) (arg0);
			msg.setToken(SessionHelper.getToken());
			try {
				String logType = redisClient.getTemplate().opsForValue().get(MissBusinessConst.BASIC_CONFIG + MissBusinessConst.LOG_TYPE);
				if(logType != null && logType.equals("INFO")) 
				{
					logger.info("响应 body:"+JsonUtil.toJson(msg));
				}
				else 
				{
					logger.debug("响应 body:"+JsonUtil.toJson(msg));
				}
				
			} catch (JsonProcessingException e) {
				logger.error("接口参数写操作异常",e);
			}
			return msg;
		}
		msg = new RspMsg();
		ECode code = BaseCode.SUCCESS;

		msg.setBody(arg0);
		msg.setToken(SessionHelper.getToken());
		ReqMsg req = RequestHandlerAdvice.reqMsgLocal.get();
		 

		msg.setCode(code.getCode());
		msg.setDesc(code.getMessage());
		try {
			String logType = redisClient.getTemplate().opsForValue().get(MissBusinessConst.BASIC_CONFIG + MissBusinessConst.LOG_TYPE);
			if(logType != null && logType.equals("INFO")) 
			{
				logger.info("响应 body:"+JsonUtil.toJson(msg));
			}
			else 
			{
				logger.debug("响应 body:"+JsonUtil.toJson(msg));
			}
		} catch (JsonProcessingException e) {
			logger.error("接口参数写操作异常",e);
		}
		return msg;
	}

	@Override
	public boolean supports(MethodParameter arg0, Class arg1) {
		return true;
	}

	/**
	 * 数据库unique约束冲突获取提示数据
	 * 
	 * @param e
	 * @return
	 */
	private String getDulpleValue(DuplicateKeyException e) {
		String message = e.getMessage();
		int start = message.indexOf("'");
		int end = message.indexOf("'", start + 1);
		return message.substring(start + 1, end);
	}

	/**
	 * @company 道和世纪企业管理股份
	 * @Description: 获取异常信息
	 * @author: 
	 * @time: 2017年6月27日
	 * @version v1.0
	 */
	public static String getStackTrace(Throwable t) {
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);
		try {
			t.printStackTrace(pw);
			return sw.toString();
		} finally {
			pw.close();
		}
	}

}
