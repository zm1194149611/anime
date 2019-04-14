package com.ming.service;

import java.util.List;

import com.ming.entity.CartoonBody;
import com.ming.frame.base.pager.Pager;
import com.ming.frame.base.service.IBaseService;

public interface ICartoonBodyService extends IBaseService<CartoonBody>{
	
	/**
	 * 根据章节id查询主体列表
	 * @param chapterId
	 * @return
	 */
	public List<CartoonBody> listByChapterId(Long chapterId);

	/**
	 * 分页查询主体列表
	 * @param cartoonBody
	 * @param pager
	 * @return
	 */
	public List<CartoonBody> listByPage(CartoonBody cartoonBody,Pager pager);
	/**
	 * 查询主体数量
	 * @param cartoonBody
	 * @return
	 */
	public int getCount(CartoonBody cartoonBody);
}
