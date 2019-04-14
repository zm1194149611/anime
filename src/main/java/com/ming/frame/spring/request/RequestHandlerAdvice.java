package com.ming.frame.spring.request;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Type;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.MethodParameter;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.RequestBodyAdvice;

import com.ming.frame.exception.BaseCode;
import com.ming.frame.exception.BaseException;
import com.ming.frame.spring.httpbody.request.ReqMsg;
import com.ming.frame.utils.JsonUtil;

/**
 * @author 
 * @time 2017年11月6日
 * @desc 请求客户端植入
 * @company cn.dh.itgroup
 * @project core
 */
@ControllerAdvice
public class RequestHandlerAdvice implements RequestBodyAdvice {
	
	
	Logger logger = LoggerFactory.getLogger(RequestHandlerAdvice.class);

	@Value("${api.secure:false}")
	private Boolean apiSecure; // 是否开启接口安全校验
 

	@Value("${project.prepath:miss}")
	private String projectPrePath;
 

	@Autowired
	private HttpServletRequest request;
 

	@Autowired
	private RequestBodyAuthCheck authCheck;

	public static final ThreadLocal<ReqMsg> reqMsgLocal = new ThreadLocal<>();
	
	public static final ThreadLocal<String> ipLocal = new ThreadLocal<>();

	@Override
	public boolean supports(MethodParameter methodParameter, Type targetType,
			Class<? extends HttpMessageConverter<?>> converterType) {
		return true;
	}

	@Override
	public Object handleEmptyBody(Object body, HttpInputMessage inputMessage, MethodParameter parameter,
			Type targetType, Class<? extends HttpMessageConverter<?>> converterType) {
		return null;
	}

	@Override
	public HttpInputMessage beforeBodyRead(HttpInputMessage inputMessage, MethodParameter parameter, Type targetType,
			Class<? extends HttpMessageConverter<?>> converterType) throws IOException {

		@SuppressWarnings("unused")
		HttpHeaders headers = inputMessage.getHeaders();
		inputMessage.getHeaders().add("entity", "1");
		String url = request.getRequestURI();
		url = url.replace(projectPrePath, "");
		String ip = getRemortIP(request);
		// 获取请求体信息
		ipLocal.set(ip);
		InputStream is = inputMessage.getBody();
		StringBuffer sb = new StringBuffer();
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new InputStreamReader(is));
			String lineTXT = null;
			while ((lineTXT = reader.readLine()) != null) {
				// 追加一个空格防止SQL拼接出现两个字符连在一起
				sb.append(lineTXT.toString());
			}			//设置log request
		} catch (Exception e) {
			logger.error("请求体处理异常",e);
		} finally {
			is.close();
			reader.close();
		}

		ReqMsg msg = null;
		try {
			// 将接受的消息转换成JSON格式
			msg = JsonUtil.fromJson(sb.toString(), ReqMsg.class);
			logger.info("http 请求body: "+sb.toString());
			if (!apiSecure && msg.getBody() == null) {
				throw new Exception();
			}
		} catch (Exception e) {
			// 判断是否开启api secure 如开启,则对象转换错误直接抛异常
			//如果url包含page后台应用，云信IM推送消息，则不做异常验证处理
			if (apiSecure && url.indexOf("page") == -1 && url.indexOf("receiveYxMsg") == -1 && url.indexOf("identified") == -1 ) {
				throw new IOException(new BaseException(BaseCode.PARAM_NOT_CORRECT));
			} else {
				// 否则 返回元对象
				InputStream isbody = new ByteArrayInputStream(sb.toString().getBytes());
				return new MyHttpInputMessage(inputMessage, isbody);
			}
		}

		// 请求body 权限过滤
		try {
			authCheck.authCheck(request, msg);
		} catch (Exception e) {
			throw new IOException(e);
		}

		// 返回body
		reqMsgLocal.set(msg);
		String body = null;
		 
		if (body == null) {
			body = JsonUtil.toJson(msg.getBody());
		}
		//获取body 用于后续 requestbody 对象映射
		InputStream isbody = new ByteArrayInputStream(body.getBytes());
		return new MyHttpInputMessage(inputMessage, isbody);
	}

	@Override
	public Object afterBodyRead(Object body, HttpInputMessage inputMessage, MethodParameter parameter, Type targetType,
			Class<? extends HttpMessageConverter<?>> converterType) {
		return body;
	}

	class MyHttpInputMessage implements HttpInputMessage {
		private HttpHeaders headers;

		private InputStream body;

		public MyHttpInputMessage(HttpInputMessage inputMessage, InputStream body) {
			this.headers = inputMessage.getHeaders();
			this.body = body;
		}

		@Override
		public InputStream getBody() throws IOException {
			return body;
		}

		@Override
		public HttpHeaders getHeaders() {
			return headers;
		}
	}

	public String getRemortIP(HttpServletRequest request) {
		if (request.getHeader("x-forwarded-for") == null) {
			return request.getRemoteAddr();
		}
		return request.getHeader("x-forwarded-for");
	}

}
