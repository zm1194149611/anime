package com.ming.controller;

import java.util.List;
import java.util.concurrent.TimeUnit;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ming.entity.User;
import com.ming.entity.YZCode;
import com.ming.exception.BusiException;
import com.ming.exception.BusiException.BusiCode;
import com.ming.frame.exception.BaseCode;
import com.ming.frame.exception.BaseException;
import com.ming.frame.spring.session.SessionHelper;
import com.ming.frame.utils.MD5;
import com.ming.frame.utils.MissBusinessConst;
import com.ming.frame.utils.RandomUtil;
import com.ming.frame.utils.StringUtil;
import com.ming.redis.RedisClient;
import com.ming.service.IUserService;
import com.ming.yunpian.service.IYPService;




/**
 * 
 * 用户账户基本信息  
 * AccountController
 * yangyang   
 * 2017年12月2日 下午9:25:35 
 * @version 1.0.0  
 *
 */
@RestController
@RequestMapping("/code")
public class YZCodeController {
	
	
	@Autowired
	private RedisClient  redisCliend;
	
	@Autowired
	private IUserService userService;
	
	
	@Autowired
	private IYPService ypService;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/send")
	@ResponseBody
	public void add(String phone,String type) throws Exception {
		User u = new User();
		u.setPhone(phone);
		
		if("0".equals(type)) {//注册
			//注册业务:校验手机号是否已注册
			User user = userService.getByPhone(u);
			if(user!=null) 
			{
				
				throw new BusiException(BaseCode.PARAM_DUMPLE_ERROR,u.getPhone() + "已被注册");
				
			}
		}
		
		Integer yzc = RandomUtil.randomInt(6);
		
		String code = redisCliend.getTemplate().opsForValue().get("yzcode:"+phone);
		if(StringUtil.isEmpty(code))
		{
			//验证类一个小时内只能发送三次验证码
			ypService.sendYzCode(phone, yzc.toString());
			redisCliend.getTemplate().opsForValue().set("yzcode:"+phone, yzc.toString());
			redisCliend.getTemplate().expire("yzcode:"+phone, 5*60, TimeUnit.SECONDS); //设置验证码过期时间为5min ，验证码属于冷数据，需执行定期从redis中删除
		}
		
	}


}
