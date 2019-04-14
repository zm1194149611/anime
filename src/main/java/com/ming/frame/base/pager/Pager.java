package com.ming.frame.base.pager;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * @author 
 * @time 2017年11月6日
 * @desc 分页信息
 * @company cn.dh.itgroup
 * @project mybatis
 */
public class Pager {
	private Integer current = 1; // 页码
	private Integer total; // 页总数
	
	private Long lastId;//最后一条数据ID
	private Integer size = 18; // 页大小

	public Integer getCurrent() {
		if(current == null)
		{
			return 1;
		}
		return current;
	}

	public void setCurrent(Integer current) {
		this.current = current;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Integer getSize() {
		if(size == null)
		{
			return 20;
		}
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	@JsonIgnore
	public Integer getStart() {
		// 获取开始的索引
		return (this.current - 1) * getSize();
	}

	public Long getLastId() {
		return lastId;
	}

	public void setLastId(Long lastId) {
		this.lastId = lastId;
	}

}
