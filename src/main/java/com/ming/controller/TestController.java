package com.ming.controller;

import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ming.frame.utils.HttpUtils;

@Controller
@RequestMapping("test")
public class TestController {
	
	@RequestMapping("getAnimeResource")
	public String getAnimeResource() {
		
		for (int i = 0; i < 15; i++) {
			String urlName = "00";
			String pathName = "01";
			if(i<10) {
				urlName = "0"+i;
				pathName = "0"+(i+1);
			}else {
				urlName = i+"";
				pathName = ""+(i+1);
			}
			
			String url = "https://mh2.wan1979.com/upload/yirenzhixia/428/00"+urlName+".jpg";
			String path = "E:/test/401-"+pathName+".jpg";
			downloadPicture(url,path);
		}
		
		
//		String url = "https://mh2.wan1979.com/upload/yirenzhixia/428/0000.jpg";
//		String path = "E:/test/0000.jpg";
//		downloadPicture(url,path);
//		try {
//			result = HttpUtils.doGet(url);
//			System.out.println(result);
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//		}
		return "";
	}
	
	//链接url下载图片
    private void downloadPicture(String urlList,String path) {
        URL url = null;
        try {
            url = new URL(urlList);
            DataInputStream dataInputStream = new DataInputStream(url.openStream());

            FileOutputStream fileOutputStream = new FileOutputStream(new File(path));
            ByteArrayOutputStream output = new ByteArrayOutputStream();

            byte[] buffer = new byte[1024];
            int length;

            while ((length = dataInputStream.read(buffer)) > 0) {
                output.write(buffer, 0, length);
            }
            fileOutputStream.write(output.toByteArray());
            dataInputStream.close();
            fileOutputStream.close();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }




}
