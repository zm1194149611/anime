package com.ming.frame.base.dao;

import java.util.List;

import com.ming.frame.base.entity.Condition;
import com.ming.frame.base.entity.Identifiable;

/**
 * @author 
 * @time 2017年11月6日
 * @desc 数据操作接口
 * @company cn.dh.itgroup
 * @project mybatis
 */
public interface IMyBatisDao<T extends Identifiable> {

	/**
	 * 保存数据
	 * 
	 * @param t
	 *            要持久化的对象
	 */
	public int add(T t);

	/**
	 * 更新数据
	 * 
	 * @param t
	 *            持久化对象
	 */
	public int update(T t);

	/**
	 * 根据条件搜索
	 * 
	 * @param t
	 * @return
	 */
	public List<T> find(T t);

	/**
	 * 获取主键对应的记录
	 * 
	 * @param pk
	 *            主键值
	 * @return
	 */
	public T getById(Long pk);

	/**
	 * 获取主键对应的记录列表
	 * 
	 * @param pk
	 *            主键值
	 * @return
	 */
	public List<T> getByIds(Long... pks);

	/**
	 * 获取所有数据
	 * 
	 * @param pk
	 *            主键值
	 * @return
	 */
	public List<T> getAll() throws Exception;

	/**
	 * 根据对象标识获取记录,并锁住该条记录
	 * 
	 * @param pk
	 *            记录标识
	 * @return 实体对象,如果不存在返回null
	 */
	public T lockById(Long id);

	/**
	 * 根据提供的ID,删除多个对象
	 * 
	 * @param pks
	 */
	public int delete(Long... pks);

	/**
	 * 根据样列，获取此实体符合条件的记录总数
	 * 
	 * @return 记录数量
	 */
	public int getCount(Condition<T> condition);

	/**
	 * 根据条件获取数据结合
	 * 
	 * @param condition
	 * @param pager
	 * @return
	 */
	public List<T> getWithCondition(Condition<T> condition);

}
