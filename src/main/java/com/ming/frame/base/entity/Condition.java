package com.ming.frame.base.entity;

import com.ming.frame.base.pager.Pager;

/**
 * @author 
 * @time 2017年11月6日
 * @desc 实体查询条件key-value 如:User 查找 name="" 当前页为第1页 每页显示10条 此时: T=User 查询条件为
 *       t.name="" and pager.current=1 and pager.size=10的实体条件封装类
 * @company cn.dh.itgroup
 * @project mybatis
 */
public class Condition<T> {

	private T t; // 实体查找条件类
	private Pager pager; // 分页条件

	public T getT() {
		return t;
	}

	public void setT(T t) {
		this.t = t;
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}
}
