package com.ming.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.entity.Comic;
import com.ming.frame.base.dao.IMyBatisDao;
import com.ming.frame.base.pager.Pager;

@Repository
public interface ComicDao extends IMyBatisDao<Comic>{
	
	
	/**
	 * 分页查询动漫信息
	 * @param comic
	 * @param pager
	 * @return
	 */
	public List<Comic> pageByList(@Param("comic") Comic comic,@Param("pager")Pager pager);
	/**
	 * 根据分类查询列表
	 * @param Category 分类
	 * @param num   数量
	 * @return
	 */
	public List<Comic> getListByCategory(@Param("category")Integer category,@Param("num")Integer num);

}
