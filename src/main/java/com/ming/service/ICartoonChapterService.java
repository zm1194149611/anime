package com.ming.service;

import java.util.List;

import com.ming.entity.CartoonChapter;
import com.ming.frame.base.service.IBaseService;


public interface ICartoonChapterService extends IBaseService<CartoonChapter>{

	/**
	 * 根据漫画id查询列表
	 * @param cartoonId
	 * @return
	 */
	public List<CartoonChapter> listByCartoonId(Long cartoonId);
	/**
	 * 根据漫画id查询最新一话
	 * @param cartoonId
	 * @return
	 */
	public CartoonChapter getLastObjectByCartoonId(Long cartoonId);
	
	/**
	 * 根据章节话数查询上一话
	 * @param cartoonId
	 * @param chapterNo 当前话数
	 * @return
	 */
	public CartoonChapter getPreObjectByCartoonId(Long cartoonId,Integer chapterNo);
	/**
	 * 根据章节话数查询下一话
	 * @param cartoonId
	 * @param chapterNo 当前话数
	 * @return
	 */
	public CartoonChapter getNextObjectByCartoonId(Long cartoonId,Integer chapterNo);
}
