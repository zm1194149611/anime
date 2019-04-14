package com.ming.service;

import com.ming.entity.User;
import com.ming.frame.base.service.IBaseService;


public interface IUserService extends IBaseService<User>{

	public User regist(User user);
	
	public User getByPhone(User user);
	
	
}
