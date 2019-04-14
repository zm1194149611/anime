package com.ming.frame.base.entity;

/**
 * @author 
 * @time 2017年11月6日
 * @desc 系统实体唯一标识
 * @company cn.dh.itgroup
 * @project mybatis
 */
public interface Identifiable {

	public Long getId();

	public void setId(Long id);

}