package com.ming.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.entity.CartoonChapter;
import com.ming.frame.base.dao.IMyBatisDao;
@Repository
public interface CartoonChapterDao extends IMyBatisDao<CartoonChapter>{
	
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
	public CartoonChapter getPreObjectByCartoonId(@Param("cartoonId")Long cartoonId,@Param("chapterNo")Integer chapterNo);
	/**
	 * 根据章节话数查询下一话
	 * @param cartoonId
	 * @param chapterNo 当前话数
	 * @return
	 */
	public CartoonChapter getNextObjectByCartoonId(@Param("cartoonId")Long cartoonId,@Param("chapterNo")Integer chapterNo);

}
