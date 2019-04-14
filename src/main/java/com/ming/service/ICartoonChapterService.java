package com.ming.service;

import java.util.List;

import com.ming.entity.CartoonChapter;
import com.ming.frame.base.service.IBaseService;


public interface ICartoonChapterService extends IBaseService<CartoonChapter>{

	
	public List<CartoonChapter> listByCartoonId(Long cartoonId);
}
