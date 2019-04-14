package com.ming.frame.spring.intercept;

import java.lang.reflect.Method;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.resource.DefaultServletHttpRequestHandler;

/**
 * @author ming.zhao
 * @time 2018年10月15日
 * @desc desc
 */
public class HttpHeadInterceptor implements HandlerInterceptor {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Value("${api.contextPath}")
	private String contextPath;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String url = request.getRequestURI(); 
		/*if(url.contains("page"))
		{
			try{SessionHelper.getSessionUser().getUser();}
			catch(Exception e)
			{
				return false;
			}
		}else if(!url.contains("logout") && !url.contains("login/login") && !url.contains("login/wxlogin")){
			User user=null;
			try {
				user = SessionHelper.getSessionUser().getUser();
			} catch (Exception e) {
			}
			if(user!=null) {
				Long userId=user.getId();
				Boolean isKill = redisClient.getTemplate().opsForSet().isMember(MissBusinessConst.KILL_USER_COLLECTION, userId.toString());
				if(isKill) {
					throw new BaseException(BaseCode.USER_FORBIDDEN);
				}
			}
		}*/
		request.setAttribute("contextPath", contextPath);
		if (handler instanceof HandlerMethod) {
			Method method = ((HandlerMethod) handler).getMethod();
			Class<?> type = method.getReturnType();
			if (type == String.class) {
				return true;
			}
		}
		if (handler instanceof DefaultServletHttpRequestHandler) {
			return true;
		}
		
		logger.debug("请求url:"+url);
		if(url.contains("/file/upload")||url.contains("/pay/wxPayNotify") ||url.contains("/swiftpay/swiftnotify") ||url.contains("export")||url.contains("/import")
				|| url.contains("/Registration") || url.contains("/getUserCity"))
		{
			return true;
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}
	

}
