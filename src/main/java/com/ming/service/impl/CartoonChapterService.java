package com.ming.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.dao.CartoonChapterDao;
import com.ming.entity.CartoonChapter;
import com.ming.frame.base.entity.Condition;
import com.ming.frame.base.entity.QueryResult;
import com.ming.service.ICartoonChapterService;

@Service
public class CartoonChapterService implements ICartoonChapterService {

	@Autowired
	private CartoonChapterDao cartoonChapterDao;
	
	@Override
	public int add(CartoonChapter t) throws Exception {
		return cartoonChapterDao.add(t);
	}

	@Override
	public int update(CartoonChapter t) throws Exception {
		return cartoonChapterDao.update(t);
	}

	@Override
	public List<CartoonChapter> find(CartoonChapter t) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CartoonChapter getById(Long pk) throws Exception {
		return cartoonChapterDao.getById(pk);
	}

	@Override
	public List<CartoonChapter> getAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CartoonChapter> getByIds(Long... pks) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CartoonChapter lockById(Long id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(Long... pks) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getCount(Condition<CartoonChapter> condition) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public QueryResult<CartoonChapter> getWithCondition(Condition<CartoonChapter> condition) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CartoonChapter> listByCartoonId(Long cartoonId) {
		return cartoonChapterDao.listByCartoonId(cartoonId);
	}

	@Override
	public CartoonChapter getLastObjectByCartoonId(Long cartoonId) {
		return cartoonChapterDao.getLastObjectByCartoonId(cartoonId);
	}

	@Override
	public CartoonChapter getPreObjectByCartoonId(Long cartoonId,Integer chapterNo) {
		return cartoonChapterDao.getPreObjectByCartoonId(cartoonId,chapterNo);
	}

	@Override
	public CartoonChapter getNextObjectByCartoonId(Long cartoonId,Integer chapterNo) {
		return cartoonChapterDao.getNextObjectByCartoonId(cartoonId,chapterNo);
	}

}
