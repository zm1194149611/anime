package com.ming.frame.base.entity;

import java.util.List;

import com.ming.frame.base.pager.Pager;

/**
 * @author 
 * @time 2017年11月6日
 * @desc 获取查询结果集【每页数据包括当前页信息和页所拥有的实体列表信息】
 * @company cn.dh.itgroup
 * @project mybatis
 */
public class QueryResult<T> {

	private List<T> list; // 返回实体数据集合
	private Pager pager; // 返回分页数据

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

}
