package com.ming.frame.utils;

import java.io.File;
import java.io.InputStream;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.model.GetObjectRequest;
import com.qcloud.cos.model.ObjectMetadata;
import com.qcloud.cos.model.PutObjectResult;
import com.qcloud.cos.region.Region;

/**
 * 对象上传工具类
 * 2018-06-01
 * @author zhaoming
 *
 */
public class CosFileUtil {
	
	private static final Logger log = LoggerFactory.getLogger(CosFileUtil.class);
	
	
	private static String SECRET_ID = "AKIDb9TXMwLLDqJXWHm10jBMHwNaXEfqLPpy";//云id
	private static String SECRET_KEY = "2uYyABxVoshHcjaCYeT6SYOxGI4aqpY1";//云key
	private static String BUCKET_REGION = "ap-guangzhou";//存储桶区域
	private static String BUCKET_NAME = "miaojian-1256216769";//存储桶名称：{name}-{appid}
	
	/**
	 * 上传文件
	 * @param path  
	 * @param is 文件流
	 * @return
	 */
	public static String uploadFile(String path, InputStream ins) {
		String url = "";
		COSClient cosClient = null;
		try {
			//获取客户端
			cosClient = getClient();
			int length = ins.available();
			//文件元
			ObjectMetadata objectMetadata = new ObjectMetadata();
			// 设置输入流长度为 500
			objectMetadata.setContentLength(length);
			// 设置 Content type, 默认是 application/octet-stream
			objectMetadata.setContentType("image/jpeg");
			// 指定要上传到 COS 上的路径
			String key = path;
			cosClient.putObject(BUCKET_NAME, key, ins, objectMetadata);
		} catch (Exception e) {
			log.error("COS文件上传失败："+e);
		} finally {
			//关闭客户端
			if(cosClient!=null) {
				closeClient(cosClient);
			}
		}
		return url;
	}
	
	/**
	 * 下载文件
	 * @param key cos文件路径
	 * @return
	 */
	public static File downloadFile(String key) {
		String url = "";
		// 指定要下载到的本地路径
		String[] split = key.split(".");
		String subfix = split[1];
		String filePath ="src/test/resources/"+ UUID.randomUUID().toString()+"."+subfix;
		File downFile = new File(filePath);
		//获取客户端
		COSClient cosClient = null;
		try {
			cosClient = getClient();
			// 指定要下载的文件所在的 bucket 和路径
			GetObjectRequest getObjectRequest = new GetObjectRequest(BUCKET_NAME, key);
			ObjectMetadata downObjectMeta = cosClient.getObject(getObjectRequest, downFile);
			//解析result,得出url地址
		} catch (Exception e) {
			log.error("COS文件下载失败："+e);
		} finally {
			//关闭客户端
			if(cosClient!=null) {
				closeClient(cosClient);
			}
		}
		return downFile;
	}
	
	/**
	 * 删除文件
	 * @param key cos文件路径
	 * @return
	 */
	public static void deleteFile(String key) {
		//获取客户端
		COSClient cosClient = null;
		try {
			cosClient = getClient();
			// 指定要删除的 bucket 和路径
			cosClient.deleteObject(BUCKET_NAME, key);
		} catch (Exception e) {
			log.error("COS文件删除失败："+e);
		} finally {
			//关闭客户端
			if(cosClient!=null) {
				closeClient(cosClient);
			}
		}
		return;
	}
	
	
	/**
	 * 获取客户端
	 * @return
	 */
	private static COSClient getClient() {
		// 1 初始化用户身份信息(secretId, secretKey)
		COSCredentials cred = new BasicCOSCredentials(SECRET_ID, SECRET_KEY);
		// 2 设置bucket的区域, COS地域的简称请参照 https://cloud.tencent.com/document/product/436/6224
		ClientConfig clientConfig = new ClientConfig(new Region(BUCKET_REGION));
		// 3 生成cos客户端
		COSClient cosClient = new COSClient(cred, clientConfig);
		return cosClient;
	}
	
	/**
	 * 关闭客户端
	 * @param cosClient
	 */
	private static void closeClient(COSClient cosClient) {
		cosClient.shutdown();
	}

}
