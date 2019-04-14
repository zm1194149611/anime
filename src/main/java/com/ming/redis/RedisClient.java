package com.ming.redis;

import java.io.Serializable;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Service;

@Service
public class RedisClient {

	@Autowired
	private StringRedisTemplate redisTemplate;
	
	@Autowired
	private RedisTemplate<String,Serializable> redisObjTemplate;
	 
		
	public StringRedisTemplate getTemplate(){		 
		return redisTemplate;
	}
	
	public RedisTemplate<String,Serializable> getRedisObjTemplate(){		 
		return redisObjTemplate;
	}
	
	public ZSetOperations<String, String> getRedisStringZset() {
		return redisTemplate.opsForZSet();
	}
	
	/**
	 * 返回有序的序列化redis
	 * @return
	 */
	public ZSetOperations<String,Serializable> getRedisObjZset(){
		return redisObjTemplate.opsForZSet();
	}
	
	/**
	 * 返回有序的序列化redis
	 * @return
	 */
	public ZSetOperations<String,String> getRedisZset(){
		return redisTemplate.opsForZSet();
	}
	

	public Set<Serializable> zsetRange(String key,long start,long end) {
		return getRedisObjZset().range(key, start, end);
	}
	
	public void add(String key,Serializable value,double score) {
		getRedisObjZset().add(key, value, score);
	}
	
	public void remove(String key,Serializable value) {
		getRedisObjZset().remove(key, value);
	}
	
	public Set<String> stringRange(String key,long start,long end) {
		return getRedisStringZset().range(key, start, end);
	}
	
	public void stringAdd(String key,String value,double score) {
		getRedisStringZset().add(key, value, score);
	}
	
	public void stringRemove(String key,Object ... value) {
		getRedisStringZset().remove(key, value);
	}
	
	public double stringScore(String key,String o) {
		return getRedisStringZset().score(key, o);
	}
}
