package com.ming.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.entity.User;
import com.ming.frame.base.dao.IMyBatisDao;
import com.ming.frame.base.pager.Pager;


@Repository
public interface UserDao extends IMyBatisDao<User> {

	public User getByPhone(User user);

	
	
}
