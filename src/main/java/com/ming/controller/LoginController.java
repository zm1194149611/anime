package com.ming.controller;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ming.entity.User;
import com.ming.exception.BusiException;
import com.ming.frame.exception.BaseCode;
import com.ming.frame.spring.session.SessionHelper;
import com.ming.frame.spring.session.SessionUser;
import com.ming.frame.utils.MD5;
import com.ming.frame.utils.StringUtil;
import com.ming.redis.RedisClient;
import com.ming.service.IUserService;

@Controller
@RequestMapping("login")
public class LoginController {
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private RedisClient  redisCliend;
	
	@RequestMapping("toLogin")
	public String toLogin(HttpServletRequest request) throws Exception {
		return "anime/user/login";
	}
	
	@RequestMapping("login")
	@ResponseBody
	public String login(HttpServletRequest request,String phone,String pwd) throws Exception {
		
		User user = new User();
		user.setPhone(phone);
		User loginUser = userService.getByPhone(user);
		if(loginUser==null) {
			throw new BusiException(BaseCode.PARAM_REQUIRED, "手机号未注册！");
		}
		if(!loginUser.getPassword().equals(MD5.MD5Encode(pwd))) {
			throw new BusiException(BaseCode.PARAM_REQUIRED, "密码错误！");
		}
		if(loginUser.getDisable()==1) {
			throw new BusiException(BaseCode.PARAM_REQUIRED, "账号已被禁用！");
		}
		SessionUser sessionUser = SessionHelper.getSessionUser(true);
		sessionUser.setUser(loginUser);
		
		loginUser.setLastLoginTime(new Date());
		loginUser.setLoginNum(loginUser.getLoginNum()+1);
		userService.update(loginUser);
		
		return "anime/user/regist";
	}
	
	
	@RequestMapping("toRegist")
	public String toRegist(HttpServletRequest request) throws Exception {
		return "anime/user/regist";
	}
	
	@RequestMapping("regist")
	@ResponseBody
	public String regist(HttpServletRequest request,String phone,String code,String pwd) throws Exception {
		
		String yzm = redisCliend.getTemplate().opsForValue().get("yzcode:"+phone);
		if(StringUtil.isEmpty(yzm)) {
			throw new BusiException(BaseCode.PARAM_REQUIRED, "请先发送验证码");
		}
		
		if(!yzm.equals(code)) {
			throw new BusiException(BaseCode.PARAM_REQUIRED, "验证码错误");
		}
		
		User user = new User();
		user.setPhone(phone);
		user.setPassword(MD5.MD5Encode(pwd));
		userService.regist(user);
		
		return "anime/user/regist";
	}

}
