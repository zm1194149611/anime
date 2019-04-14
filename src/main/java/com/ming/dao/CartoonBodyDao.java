package com.ming.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.entity.CartoonBody;
import com.ming.frame.base.dao.IMyBatisDao;
import com.ming.frame.base.pager.Pager;
@Repository
public interface CartoonBodyDao  extends IMyBatisDao<CartoonBody>{

	public List<CartoonBody> listByChapterId(Long chapterId);
	
	public List<CartoonBody> listByPage(@Param("cartoonBody") CartoonBody cartoonBody,@Param("pager")Pager pager);

	public int getCount(@Param("cartoonBody")CartoonBody cartoonBody);
	
}
