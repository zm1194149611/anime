package com.ming.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ming.entity.Comic;
import com.ming.entity.FunctionConfig;
import com.ming.entity.User;
import com.ming.frame.base.pager.Pager;
import com.ming.frame.spring.session.SessionHelper;
import com.ming.frame.spring.session.SessionUser;
import com.ming.frame.utils.StringUtil;
import com.ming.service.IComicService;
import com.ming.service.IFunctionConfigService;

@Controller
@RequestMapping("comic")
public class ComicController {
	
	@Value("${file.url.prefix}")
	private String fileUrlPrefix;
	
	@Value("${file.comic.prefix}")
	private String comicUrlPrefix;
	
	@Autowired
	private IComicService comicService;
	
	@Autowired
	private IFunctionConfigService functionConfigService;
	
	@RequestMapping("index")
	public String showList(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		
		
		FunctionConfig config = new FunctionConfig();
		config.setConfigType(1);
		List<FunctionConfig> functionConfigs = functionConfigService.find(config);
		request.setAttribute("bannerList", functionConfigs);
		config.setConfigType(3);
		List<FunctionConfig> configs = functionConfigService.find(config);
		request.setAttribute("rollWordList", configs);
		return "anime/comic/showList";
	}
	
	@RequestMapping("querylist")
	public String querylist(HttpServletRequest request,HttpServletResponse response,Integer start,
			Integer size, String keySearch) throws Exception {
		
		
		
		start = start == null ? 0 : start;
		size = size == null ? 10 : size;
		
		Pager pager = new Pager();
		pager.setCurrent(start+1);
		pager.setSize(6);
		
		Comic t = new Comic();
		t.setDisable(0);
		if(!StringUtil.isEmpty(keySearch)) {
			keySearch = URLDecoder.decode(keySearch, "utf-8");
			t.setTitle(keySearch);
		}
//		List<Comic> comics = comicService.find(t);
		List<Comic> comics = comicService.pageByList(t, pager);
		for (Comic comic : comics) {
			comic.setImgUrl(fileUrlPrefix+comic.getImgUrl());
		}
		if(comics.size()<pager.getSize()) {
			request.setAttribute("hasMore", false);
		}else {
			request.setAttribute("hasMore", true);
		}
		request.setAttribute("comics", comics);
		return "anime/comic/list";
	}
	
	@RequestMapping("detail")
	public String detail(HttpServletRequest request,HttpServletResponse response,Long comicId) throws Exception {
		
//		try {
//			SessionHelper.getSessionUser().getUser();
//		}catch (Exception e) {
//			response.sendRedirect(request.getContextPath()+"/login/toLogin");
//		}
		
		Comic comic = comicService.getById(comicId);
		
		//更新访问数量
		comic.setPageView(comic.getPageView()+1);
		comic.setLastViewTime(new Date());
		comicService.update(comic);
		
		String[] split = comic.getTags().split(",");
		List<String> tagList = new ArrayList<>();
		for (String string : split) {
			tagList.add(string);
		}
		comic.setTagList(tagList);

		comic.setImgUrl(fileUrlPrefix+comic.getImgUrl());

		request.setAttribute("comic", comic);
		
		return "anime/comic/detail";
	}

}
