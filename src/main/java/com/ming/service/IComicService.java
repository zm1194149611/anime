package com.ming.service;

import java.util.List;

import com.ming.entity.Comic;
import com.ming.frame.base.pager.Pager;
import com.ming.frame.base.service.IBaseService;

public interface IComicService extends IBaseService<Comic>{
	
	/**
	 * 分页查询动漫信息
	 * @param comic
	 * @param pager
	 * @return
	 */
	public List<Comic> pageByList(Comic comic,Pager pager);
	/**
	 * 根据分类查询列表
	 * @param Category 分类
	 * @param num   数量
	 * @return
	 */
	public List<Comic> getListByCategory(Integer category,Integer num);

}
