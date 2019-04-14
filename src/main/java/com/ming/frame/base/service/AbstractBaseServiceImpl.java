package com.ming.frame.base.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ming.frame.base.dao.IMyBatisDao;
import com.ming.frame.base.entity.BaseEntity;
import com.ming.frame.base.entity.Condition;
import com.ming.frame.base.entity.QueryResult;
import com.ming.frame.base.pager.Pager;
import com.ming.frame.utils.ObjectUtil;

/**
 * @author 
 * @time 2017年11月16日
 * @desc 业务逻辑抽象类
 * @company cn.dh.itgroup
 * @project core
 */
@Service
@Transactional(propagation=Propagation.SUPPORTS,readOnly = true, rollbackFor=Exception.class)
public abstract class AbstractBaseServiceImpl<T extends BaseEntity>
		implements IBaseService<T> {

	/**
	 * @author 
	 * @time 2017年11月16日
	 * @desc 获取当前业务逻辑依赖的数据访问层
	 * @company cn.dh.itgroup
	 * @project core
	 */
	public abstract IMyBatisDao<T> getMyBatisDao();

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor=Exception.class)
	public int add(T t) throws Exception {
		return getMyBatisDao().add(t);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor=Exception.class)
	public int update(T t) throws Exception{
		return getMyBatisDao().update(t);
	}
	
	public List<T> find(T t) throws Exception{
		return getMyBatisDao().find(t);
		
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor=Exception.class)
	public int delete(Long... ids) throws Exception {
		if(ids==null || ids.length == 0)
		{
			return 0;
		}
		return getMyBatisDao().delete(ids);
	}

	public T getById(Long id) {
		return getMyBatisDao().getById(id);
	}

	public List<T> getByIds(Long... ids) {
		if(ids==null || ids.length == 0)
		{
			return new ArrayList<>();
		}
		return getMyBatisDao().getByIds(ids);
	}
	public List<T> getAll() throws Exception
	{
		return getMyBatisDao().getAll();
		
	}

	public T lockById(Long id) {
		return getMyBatisDao().lockById(id);
	}

	
	@Override
	public int getCount(Condition<T> condition) {
		return getMyBatisDao().getCount(condition);
	}

	@SuppressWarnings("unchecked")
	@Override
	public  QueryResult<T> getWithCondition(Condition<T> condition) throws Exception {
		QueryResult<T> result = new QueryResult<>();
		if (ObjectUtil.isNull(condition)) {
			condition = new Condition<>();
			condition.setT((T) condition.getT().getClass().newInstance());
			condition.setPager(new Pager());
		}
		else
		{
			if(ObjectUtil.isNull(condition.getPager()))
			{
				condition.setPager(new Pager());
			}
		}
		result.setPager(condition.getPager());
		List<T> list = getMyBatisDao().getWithCondition(condition);
		Integer count = getMyBatisDao().getCount(condition);
		result.getPager().setTotal(count);
		result.setList(list);
		return result;
	}
	 
}
