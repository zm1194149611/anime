package com.ming.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ming.entity.CartoonChapter;
import com.ming.frame.base.dao.IMyBatisDao;
@Repository
public interface CartoonChapterDao extends IMyBatisDao<CartoonChapter>{
	
	public List<CartoonChapter> listByCartoonId(Long cartoonId);

}
