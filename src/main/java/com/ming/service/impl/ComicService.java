package com.ming.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.dao.ComicDao;
import com.ming.entity.Comic;
import com.ming.frame.base.entity.Condition;
import com.ming.frame.base.entity.QueryResult;
import com.ming.frame.base.pager.Pager;
import com.ming.service.IComicService;

@Service
public class ComicService implements IComicService{
	
	@Autowired
	private ComicDao comicDao;

	@Override
	public int add(Comic t) throws Exception {
		return comicDao.add(t);
	}

	@Override
	public int update(Comic t) throws Exception {
		return comicDao.update(t);
	}

	@Override
	public List<Comic> find(Comic t) throws Exception {
		return comicDao.find(t);
	}

	@Override
	public Comic getById(Long pk) throws Exception {
		return comicDao.getById(pk);
	}

	@Override
	public List<Comic> getAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Comic> getByIds(Long... pks) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Comic lockById(Long id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(Long... pks) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getCount(Condition<Comic> condition) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public QueryResult<Comic> getWithCondition(Condition<Comic> condition) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Comic> pageByList(Comic comic, Pager pager) {
		return comicDao.pageByList(comic, pager);
	}

	@Override
	public List<Comic> getListByCategory(Integer category, Integer num) {
		return comicDao.getListByCategory(category,num);
	}

}
