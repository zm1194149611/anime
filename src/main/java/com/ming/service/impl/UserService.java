package com.ming.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.dao.UserDao;
import com.ming.entity.User;
import com.ming.frame.base.dao.IMyBatisDao;
import com.ming.frame.base.pager.Pager;
import com.ming.frame.base.service.AbstractBaseServiceImpl;
import com.ming.frame.utils.IDUtil;
import com.ming.redis.RedisClient;
import com.ming.service.IUserService;


@Service
public class UserService extends AbstractBaseServiceImpl<User> implements IUserService
{
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private RedisClient redisClient;

	@Override
	public IMyBatisDao<User> getMyBatisDao() {
		return userDao;
	}

	@Override
	public User regist(User user) {
		
		user.setId(IDUtil.generate());
		user.setDisable(0);
		user.setCreateTime(new Date());
		user.setLastLoginTime(new Date());
		user.setLoginNum(0);
		
		userDao.add(user);
		return user;
	}

	@Override
	public User getByPhone(User user) {
		return userDao.getByPhone(user);
	}

	
	
}
