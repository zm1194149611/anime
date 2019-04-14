package com.ming.frame.utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.NoHttpResponseException;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;

/**
 * http请求工具�?
 * 
 * @author zhaoming
 *
 */
public class HttpUtils {

	private static HttpClient client = HttpClients.custom().build();
	
	/**
	 * get方式访问
	 * 
	 * @param url
	 * @param params
	 * @return
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	public static String doGet(String url)  {
		HttpGet get = null;
		String result = "";
		try {
			RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(5000).setConnectTimeout(5000).build();
			get = new HttpGet(url);	
			get.addHeader("Connection", "close");
			System.out.println(""+get);
			get.setConfig(requestConfig);
			HttpResponse response = client.execute(get);
			result = EntityUtils.toString(response.getEntity(), "UTF-8");
			System.out.println("GET:"+result);
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			get.releaseConnection();
		}  
		return result;
	}
	
	public static String doGet(String url,Map<String, String> params)  {
		HttpGet get = null;
		String result = "";
		StringBuffer urlSB = appendGetParams(url, params);
		try {
			RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(5000).setConnectTimeout(5000).build();
			get = new HttpGet(urlSB.toString());	
			get.addHeader("Connection", "close");
			System.out.println(""+get);
			get.setConfig(requestConfig);
			HttpResponse response = client.execute(get);
			result = EntityUtils.toString(response.getEntity(), "UTF-8");
			System.out.println("GET:"+result);
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			get.releaseConnection();
		}  
		return result;
	}

	/**
	 * post方式访问
	 * 
	 * @param url
	 * @param params
	 * @return
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	public static String doPost(String url, Map<String, String> params){
		HttpPost post = null;
		String result ="";
		HttpResponse response=null;
		try {
			post = new HttpPost(url);
			post.addHeader("Connection", "close");
			RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(5000).setConnectTimeout(5000).build();
			post.setConfig(requestConfig);
			List<NameValuePair> paramPairs = new ArrayList<NameValuePair>();
			for (Entry<String, String> entry : params.entrySet()) {
				paramPairs.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
			}
			UrlEncodedFormEntity formEntity = new UrlEncodedFormEntity(paramPairs, "UTF-8");
			post.setEntity(formEntity);
			response = client.execute(post);
			System.out.println("response:"+response);
			HttpEntity entity = response.getEntity();
			System.out.println("entity:"+entity);
			result = EntityUtils.toString(entity, "UTF-8");
			System.out.println(result);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
			/*try {
				response = client.execute(post);
				result = EntityUtils.toString(response.getEntity(), "UTF-8");
			} catch (ClientProtocolException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}*/
		}finally{
			post.releaseConnection();
		}
		return result;
	}
	public static String doPost(String url, Map<String, String> params,String encoding){
		HttpPost post = null;
		String result ="";
		HttpResponse response=null;
		try {
			post = new HttpPost(url);
			post.addHeader("Connection", "close");
			RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(5000).setConnectTimeout(5000).build();
			post.setConfig(requestConfig);
			List<NameValuePair> paramPairs = new ArrayList<NameValuePair>();
			for (Entry<String, String> entry : params.entrySet()) {
				paramPairs.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
			}
			UrlEncodedFormEntity formEntity = new UrlEncodedFormEntity(paramPairs, encoding);
			post.setEntity(formEntity);
			response = client.execute(post);
			System.out.println("response得到�?"+response);
			HttpEntity entity = response.getEntity();
			System.out.println("entity得到�?"+entity);
			result = EntityUtils.toString(entity, "UTF-8");
			System.out.println(result);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			post.releaseConnection();
		}
		return result;
	}
	/**
	 * 组装url和params
	 * 
	 * @param url
	 * @param params
	 * @return
	 */
	public static StringBuffer appendGetParams(String url, Map<String, String> params) {
		StringBuffer urlSB = new StringBuffer(url);
		if (params == null || params.isEmpty()) {
			return urlSB;
		}
		if (url.contains("?")) {
			urlSB.append("&");
		} else {
			urlSB.append("?");
		}
		for (Entry<String, String> param : params.entrySet()) {
			urlSB.append(param.getKey());
			urlSB.append("=");
			urlSB.append(param.getValue());
			urlSB.append("&");
		}
		urlSB.deleteCharAt(urlSB.length() - 1);
		return urlSB;
	}
	
	
	
	
	
	
	

}
