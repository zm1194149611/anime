package com.ming.frame.spring.session;

import java.io.Serializable;

import com.ming.entity.User;
import com.ming.frame.exception.BaseCode;
import com.ming.frame.exception.BaseException;

public class SessionUser implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7355720831381423981L;
	
	private User user;

	public User getUser() {
		if(user == null)
		{
			throw new BaseException(BaseCode.USER_NOT_LOGIN);
		}
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
