package com.ming.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.dao.CartoonBodyDao;
import com.ming.entity.CartoonBody;
import com.ming.frame.base.entity.Condition;
import com.ming.frame.base.entity.QueryResult;
import com.ming.frame.base.pager.Pager;
import com.ming.service.ICartoonBodyService;
@Service
public class CartoonBodyService implements ICartoonBodyService {

	@Autowired
	private CartoonBodyDao cartoonBodyDao;
	
	@Override
	public int add(CartoonBody t) throws Exception {
		return cartoonBodyDao.add(t);
	}

	@Override
	public int update(CartoonBody t) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CartoonBody> find(CartoonBody t) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CartoonBody getById(Long pk) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CartoonBody> getAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CartoonBody> getByIds(Long... pks) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CartoonBody lockById(Long id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(Long... pks) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getCount(Condition<CartoonBody> condition) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public QueryResult<CartoonBody> getWithCondition(Condition<CartoonBody> condition) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CartoonBody> listByChapterId(Long chapterId) {
		return cartoonBodyDao.listByChapterId(chapterId);
	}

	@Override
	public List<CartoonBody> listByPage(CartoonBody cartoonBody, Pager pager) {
		return cartoonBodyDao.listByPage(cartoonBody, pager);
	}

	@Override
	public int getCount(CartoonBody cartoonBody) {
		return cartoonBodyDao.getCount(cartoonBody);
	}

}
