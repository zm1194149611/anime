package com.ming.frame.spring.session;

import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.ming.frame.spring.SpringApplicationContext;
import com.ming.frame.utils.ObjectUtil;
import com.ming.redis.RedisClient;

/**
 * @author 
 * @time 2017年11月6日
 * @desc 会话
 * @company cn.dh.itgroup
 * @project core
 */
public class SessionHelper {

	private final static String USERSESSIONSTR = "__UserObjectInSession__";
	private static Logger log = LoggerFactory.getLogger(SessionHelper.class);


	
	/**
	 * @author 
	 * @time 2017年11月15日
	 * @desc 获取当前请求的session
	 * @company cn.dh.itgroup
	 * @project core
	 */
	public static HttpSession getSession() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		return request.getSession();
	}

	public static SessionUser getSessionUser(){
		return getSessionUser(false);
	}
	/**
	 * @author 
	 * @time 2017年11月15日
	 * @desc 获取当前登录用户信息
	 * @company cn.dh.itgroup
	 * @project core
	 */
	public static SessionUser getSessionUser(boolean relogin) {
		HttpSession session = getSession();
		SessionUser sessionUser = (SessionUser) session.getAttribute(USERSESSIONSTR);
		if (ObjectUtil.isNull(sessionUser)||relogin) {
			sessionUser = new SessionUser();
			setToken(UUID.randomUUID().toString());
			session.setAttribute(USERSESSIONSTR, sessionUser);
		}
		return sessionUser;
	}
	
	
	public static String getToken() {
		HttpSession session = getSession();
		return (String) session.getAttribute("__token__");
	}

	public static void setToken(String token) {
		HttpSession session = getSession();
		session.setAttribute("__token__", token);
	}


	/**
	 * @author 
	 * @time 2017年11月15日
	 * @desc 用户登出
	 * @company cn.dh.itgroup
	 * @project core
	 */
	public static void logout() {
		HttpSession session = getSession();
		SessionUser sessionUser = (SessionUser) session.getAttribute(USERSESSIONSTR);
		if (!ObjectUtil.isNull(sessionUser)) {
			log.info("用户session注销：" + sessionUser.getUser().getId());
			session.setAttribute(USERSESSIONSTR, null);
		}
	}
	
	
	
	public static final OnLineUser onLineUser = new SessionHelper().new OnLineUser();
	
	public class OnLineUser {
		public final static  String  onLineUser = "ON_LINE_USER";
		
		private RedisClient client(){
			return (RedisClient)SpringApplicationContext.getBean(RedisClient.class);
		};
		public void add(Long id){
			client().getTemplate().opsForSet().add(onLineUser, id.toString());
		}
		public void remove(Long id)
		{
			client().getTemplate().opsForSet().remove(onLineUser, id.toString());
		}
		public boolean contains(Long id)
		{
			return client().getTemplate().opsForSet().isMember(onLineUser, id.toString());
		}
		public Set<String> all(){
			return  client().getTemplate().opsForSet().members(onLineUser);
		}
	}
	
	
	
	public static final OnLineBusyAnchor onLineBusyAnchor = new SessionHelper().new OnLineBusyAnchor();
	
	public class OnLineBusyAnchor {
		public final static  String  onLineBusyAnchor = "ON_LINE_BUSY_ANCHOR";
		
		private RedisClient client(){
			return (RedisClient)SpringApplicationContext.getBean(RedisClient.class);
		} ;
		public void add(Long id){
			client().getTemplate().opsForSet().add(onLineBusyAnchor, id.toString());
		}
		public void remove(Long id)
		{
			client().getTemplate().opsForSet().remove(onLineBusyAnchor, id.toString());
		}
		public boolean contains(Long id)
		{
			return client().getTemplate().opsForSet().isMember(onLineBusyAnchor, id.toString());
		}
		public Set<String> all(){
			return  client().getTemplate().opsForSet().members(onLineBusyAnchor);
		}
	}
	
	 
 

}
