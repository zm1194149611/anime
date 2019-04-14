package com.ming.frame.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 
 * @author WangYX
 *
 */
public class JsonUtil {

	public static String toJson(Object o) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(o);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static <T> T fromJson(String json, Class T) throws JsonParseException, JsonMappingException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		return (T) mapper.readValue(json, T);
	}

	@SuppressWarnings({ "unchecked" })
	public static <T> List<T> fromJsonToList(String json, Class<?> T)
			throws JsonParseException, JsonMappingException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		mapper.setSerializationInclusion(Include.NON_NULL);
		JavaType javaType = mapper.getTypeFactory().constructParametricType(ArrayList.class, T);
		List<T> list = (List<T>) mapper.readValue(json, javaType);
		return list;
	}

	@SuppressWarnings({ "unchecked" })
	public static <T> Map<String, T> fromJsonToMap(String json, Class<?> T)
			throws JsonParseException, JsonMappingException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		mapper.setSerializationInclusion(Include.NON_NULL);
		JavaType javaType = mapper.getTypeFactory().constructParametricType(HashMap.class, String.class, T);
		return ((Map<String, T>) mapper.readValue(json, javaType));
	}

}
