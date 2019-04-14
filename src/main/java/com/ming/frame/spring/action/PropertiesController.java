package com.ming.frame.spring.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("spring/properties")

public class PropertiesController {

	
	@Value("${env}")
	private String env ;
	@RequestMapping("env")
	public Map<String,Object>  env() throws IOException{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("env", env);
		return map;
	}
	
	 
}
