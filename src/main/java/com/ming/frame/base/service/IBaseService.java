package com.ming.frame.base.service;

import java.util.List;

import com.ming.frame.base.entity.BaseEntity;
import com.ming.frame.base.entity.Condition;
import com.ming.frame.base.entity.QueryResult;

/**
 * @author 
 * @time 2017年11月16日
 * @desc 业务逻辑层抽象接口
 * @company cn.dh.itgroup
 * @project core
 */
public interface IBaseService<T extends BaseEntity> {

	/**
	 * 保存数据
	 * 
	 * @param t
	 *            要持久化的对象
	 */
	public int add(T t) throws Exception;

	/**
	 * 更新数据
	 * 
	 * @param t
	 *            持久化对象
	 */
	public int update(T t) throws Exception;

	/**
	 * 根据条件搜索
	 * 
	 * @param t
	 * @return
	 * @throws Exception
	 */
	public List<T> find(T t) throws Exception;

	/**
	 * 获取主键对应的记录
	 * 
	 * @param pk
	 *            主键值
	 * @return
	 */
	public T getById(Long pk) throws Exception;

	/**
	 * 获取主键对应的记录
	 * 
	 * @param pk
	 *            主键值
	 * @return
	 */
	public List<T> getAll() throws Exception;

	/**
	 * 获取主键对应的记录
	 * 
	 * @param pk
	 *            主键值
	 * @return
	 */
	public List<T> getByIds(Long... pks) throws Exception;

	/**
	 * 根据对象标识获取记录,并锁住该条记录
	 * 
	 * @param pk
	 *            记录标识
	 * @return 实体对象,如果不存在返回null
	 */
	public T lockById(Long id) throws Exception;

	/**
	 * 根据提供的ID,删除多个对象
	 * 
	 * @param pks
	 */
	public int delete(Long... pks) throws Exception;

	/**
	 * 根据样列，获取此实体符合条件的记录总数
	 * 
	 * @return 记录数量
	 */
	public int getCount(Condition<T> condition) throws Exception;

	/**
	 * 根据条件获取
	 * 
	 * @param condition
	 * @param pager
	 * @return
	 */
	public QueryResult<T> getWithCondition(Condition<T> condition) throws Exception;

}
