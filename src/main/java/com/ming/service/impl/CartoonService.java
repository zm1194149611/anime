package com.ming.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.dao.CartoonDao;
import com.ming.entity.Cartoon;
import com.ming.frame.base.entity.Condition;
import com.ming.frame.base.entity.QueryResult;
import com.ming.service.ICartoonService;

@Service
public class CartoonService implements ICartoonService {

	@Autowired
	private CartoonDao cartoonDao;
	
	@Override
	public int add(Cartoon t) throws Exception {
		return cartoonDao.add(t);
	}

	@Override
	public int update(Cartoon t) throws Exception {
		return cartoonDao.update(t);
	}

	@Override
	public List<Cartoon> find(Cartoon t) throws Exception {
		return cartoonDao.find(t);
	}

	@Override
	public Cartoon getById(Long pk) throws Exception {
		return cartoonDao.getById(pk);
	}

	@Override
	public List<Cartoon> getAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Cartoon> getByIds(Long... pks) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Cartoon lockById(Long id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(Long... pks) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getCount(Condition<Cartoon> condition) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public QueryResult<Cartoon> getWithCondition(Condition<Cartoon> condition) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
