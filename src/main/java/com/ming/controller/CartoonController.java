package com.ming.controller;

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

import com.ming.entity.Cartoon;
import com.ming.entity.CartoonBody;
import com.ming.entity.CartoonChapter;
import com.ming.entity.FunctionConfig;
import com.ming.entity.User;
import com.ming.frame.base.pager.Pager;
import com.ming.frame.spring.session.SessionHelper;
import com.ming.frame.utils.StringUtil;
import com.ming.service.ICartoonBodyService;
import com.ming.service.ICartoonChapterService;
import com.ming.service.ICartoonService;
import com.ming.service.IFunctionConfigService;

@Controller
@RequestMapping("cartoon")
public class CartoonController {
	
	@Autowired
	private ICartoonService cartoonService;
	
	@Autowired
	private ICartoonChapterService cartoonChapterService;
	
	@Autowired
	private ICartoonBodyService cartoonBodyService;
	
	@Autowired
	private IFunctionConfigService functionConfigService;
	
	@Value("${file.url.prefix}")
	private String fileUrlPrefix;
	
	@Value("${file.cartoon.prefix}")
	private String cartoonUrlPrefix;
	
	@RequestMapping("index")
	public String showList(HttpServletRequest request) throws Exception {
		
		FunctionConfig config = new FunctionConfig();
		config.setConfigType(2);
		List<FunctionConfig> functionConfigs = functionConfigService.find(config);
		request.setAttribute("bannerList", functionConfigs);
		config.setConfigType(3);
		List<FunctionConfig> configs = functionConfigService.find(config);
		request.setAttribute("rollWordList", configs);
		return "anime/cartoon/showList";
	}
	
	@RequestMapping("querylist")
	public String querylist(HttpServletRequest request,Integer start,
			Integer size, String keySearch) throws Exception {
		
		start = start == null ? 0 : start;
		size = size == null ? 10 : size;
		
		Cartoon t = new Cartoon();
		t.setDisable(0);
		if(!StringUtil.isEmpty(keySearch)) {
			keySearch = URLDecoder.decode(keySearch, "utf-8");
			t.setTitle(keySearch);
		}
		List<Cartoon> cartoons = cartoonService.find(t);
		for (Cartoon cartoon : cartoons) {
			cartoon.setImgUrl(fileUrlPrefix+cartoonUrlPrefix+cartoon.getImgUrl());
		}
		request.setAttribute("cartoons", cartoons);
		return "anime/cartoon/list";
	}
	
	@RequestMapping("detail")
	public String detail(HttpServletRequest request,HttpServletResponse response,Long cartoonId) throws Exception {
		
		
		Cartoon cartoon = cartoonService.getById(cartoonId);
		cartoon.setPageView(cartoon.getPageView()+1);
		cartoon.setLastViewTime(new Date());
		cartoonService.update(cartoon);
		
		cartoon.setImgUrl(fileUrlPrefix+cartoonUrlPrefix+cartoon.getImgUrl());
		
		List<CartoonChapter> cartoonChapters = cartoonChapterService.listByCartoonId(cartoonId);
		
		String[] split = cartoon.getTags().split(",");
		List<String> tagList = new ArrayList<>();
		for (String string : split) {
			tagList.add(string);
		}
		cartoon.setTagList(tagList);
		request.setAttribute("cartoon", cartoon);
		request.setAttribute("cartoonChapters", cartoonChapters);
		
		return "anime/cartoon/detail";
	}
	
	@RequestMapping("getCartoonBody")
	public String getCartoonBody(HttpServletRequest request,HttpServletResponse response,Long chapterId,Integer current) throws Exception {
		
		CartoonChapter cartoonChapter = cartoonChapterService.getById(chapterId);
//		List<CartoonBody> cartoonBodys = cartoonBodyService.listByChapterId(chapterId);
		
		if(cartoonChapter.getNeedLogin()==1) {
			User user = null;
			try {
				user = SessionHelper.getSessionUser().getUser();
			}catch (Exception e) {
				response.sendRedirect(request.getContextPath()+"/login/toLogin");
			}
			
		}
		
		if(current==null) {//第一次进入一话的详情也
			cartoonChapter.setPageView(cartoonChapter.getPageView()+1);
			cartoonChapter.setLastViewTime(new Date());
			cartoonChapterService.update(cartoonChapter);
		}
		
		
		
		CartoonBody cartoonBody = new CartoonBody();
		cartoonBody.setChapterId(chapterId);
		
		Pager pager = new Pager();
		if(current==null) {
			pager.setCurrent(1);
		}else {
			pager.setCurrent(current);
		}
		pager.setSize(1);
		
		
		List<CartoonBody> cartoonBodys = cartoonBodyService.listByPage(cartoonBody, pager);
		for (CartoonBody body : cartoonBodys) {
			body.setImgUrl(fileUrlPrefix+cartoonUrlPrefix+body.getImgUrl());
		}
		int cnt = cartoonBodyService.getCount(cartoonBody);
//		int count = 0;
//		if(cnt%2!=0) {
//			count = cartoonBodyService.getCount(cartoonBody)/2+1;
//		}else {
//			count = cartoonBodyService.getCount(cartoonBody)/2;
//		}
		request.setAttribute("cartoonChapter", cartoonChapter);
		request.setAttribute("count", cnt);
		request.setAttribute("cartoonBodys", cartoonBodys);
		request.setAttribute("page", pager);
		
		return "anime/cartoon/cartoonBody";
	}
	
}
