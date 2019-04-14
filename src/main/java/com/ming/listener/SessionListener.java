package com.ming.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;

import com.ming.frame.spring.session.SessionHelper;
import com.ming.frame.spring.session.SessionUser;

public class SessionListener implements HttpSessionListener{

	
	Logger log = org.slf4j.LoggerFactory.getLogger(SessionListener.class);
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
		SessionUser sessionUser = (SessionUser) se.getSession().getAttribute("__UserObjectInSession__");
		log.info("开始销毁session....." + sessionUser);
		try {
			if(sessionUser != null) 
			{
				log.info("清除session： " + sessionUser.getUser().getId());
				Long userId = sessionUser.getUser().getId();
				SessionHelper.onLineUser.remove(userId);
				SessionHelper.onLineBusyAnchor.remove(userId);
			}
		} catch (Exception e) {
			log.error("session destory error",e);
		} 
		
		
	}
	

}
