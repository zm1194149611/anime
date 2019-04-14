package com.ming.controller;

import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ming.entity.CartoonBody;
import com.ming.entity.CartoonChapter;
import com.ming.frame.utils.FileUtil;
import com.ming.frame.utils.IDUtil;
import com.ming.frame.utils.LongUtil;
import com.ming.service.ICartoonBodyService;
import com.ming.service.ICartoonChapterService;

@Controller
@RequestMapping("resource")
public class ResourceController {

	@Value("${file.url.prefix}")
	private String fileUrlPrefix;

	@Value("${file.storage.prefix}")
	private String filepathprefix;

	@Value("${file.cartoon.prefix}")
	private String cartoonUrlPrefix;

	@Autowired
	private ICartoonBodyService cartoonBodyService;

	@Autowired
	private ICartoonChapterService cartoonChapterService;

	@RequestMapping("toCartoonResource")
	public String toCartoonResource() {
		return "anime/user/cartoonResource";
	}

	@RequestMapping("getCartoonResource")
	@ResponseBody
	public String getAnimeResource(String sourcePath, Integer sourcePage, Integer startNo, Integer zeroNum,String targetName,
			String cartoonId, String targetTitle, Integer targetNo, Integer needLogin) throws Exception {

		// 插入章节
		CartoonChapter cartoonChapter = new CartoonChapter();
		cartoonChapter.setId(IDUtil.generate());
		cartoonChapter.setCartoonId(LongUtil.valueOf(cartoonId));
		cartoonChapter.setTitle(targetTitle);
		cartoonChapter.setSequence(targetNo);
		cartoonChapter.setNeedLogin(needLogin);
		cartoonChapter.setNeedCharge(0);
		cartoonChapter.setCreateTime(new Date());
		cartoonChapter.setDisable(0);
		cartoonChapter.setPageView(0);
		cartoonChapter.setLastViewTime(null);
		cartoonChapterService.add(cartoonChapter);

		if (startNo == 0) {// 从0开始
			for (int i = 0; i < sourcePage; i++) {

				// 构建资源地址
				String urlName = "00";
				String pathName = "01";
				if (i < 10) {
					urlName = "0" + i;
				} else {
					urlName = i + "";
					if(zeroNum==3) {//3个0
						urlName = "0" + i;
					}
				}

				int i2 = i + 1;
				if (i2 < 10) {
					pathName = "0" + i2;
				} else {
					pathName = i2 + "";
				}
				String urlList = sourcePath + "/00" + urlName + ".jpg";
				String path = filepathprefix + cartoonUrlPrefix + "/" + targetName + "/" + targetNo + "-" + pathName
						+ ".jpg";

				URL url = new URL(urlList);
				DataInputStream dataInputStream = new DataInputStream(url.openStream());
				FileUtil.writeFile(path, dataInputStream);

				// 下载到本地服务器
				// downloadPicture(url,path);

				// 插入图片数据
				CartoonBody cartoonBody = new CartoonBody();
				cartoonBody.setChapterId(cartoonChapter.getId());
				cartoonBody.setCartoonId(LongUtil.valueOf(cartoonId));
				cartoonBody.setSequence(i2);
				cartoonBody.setImgUrl("/" + targetName + "/" + targetNo + "-" + pathName + ".jpg");
				cartoonBody.setCreateTime(new Date());

				cartoonBodyService.add(cartoonBody);

			}
		} else {// 从1开始
			for (int i = 1; i <= sourcePage; i++) {

				// 构建资源地址
				String urlName = "01";
				String pathName = "01";
				if (i < 10) {
					urlName = "0" + i;
					pathName = "0" + i;
				} else {
					urlName = i + "";
					pathName = i + "";
					if(zeroNum==3) {
						urlName = "0"+i;
					}
				}
				String urlList = sourcePath + "/00" + urlName + ".jpg";
				String path = filepathprefix + cartoonUrlPrefix + "/" + targetName + "/" + targetNo + "-" + pathName
						+ ".jpg";

				URL url = new URL(urlList);
				DataInputStream dataInputStream = new DataInputStream(url.openStream());
				FileUtil.writeFile(path, dataInputStream);

				// 下载到本地服务器
				// downloadPicture(url,path);

				// 插入图片数据
				CartoonBody cartoonBody = new CartoonBody();
				cartoonBody.setChapterId(cartoonChapter.getId());
				cartoonBody.setCartoonId(LongUtil.valueOf(cartoonId));
				cartoonBody.setSequence(i);
				cartoonBody.setImgUrl("/" + targetName + "/" + targetNo + "-" + pathName + ".jpg");
				cartoonBody.setCreateTime(new Date());

				cartoonBodyService.add(cartoonBody);

			}
		}

		// for (int i = 0; i < 15; i++) {
		// String urlName = "00";
		// String pathName = "01";
		// if(i<10) {
		// urlName = "0"+i;
		// pathName = "0"+(i+1);
		// }else {
		// urlName = i+"";
		// pathName = ""+(i+1);
		// }
		//
		// String url =
		// "https://mh2.wan1979.com/upload/yirenzhixia/428/00"+urlName+".jpg";
		// String path = "E:/test/401-"+pathName+".jpg";
		// downloadPicture(url,path);
		// }

		// String url = "https://mh2.wan1979.com/upload/yirenzhixia/428/0000.jpg";
		// String path = "E:/test/0000.jpg";
		// downloadPicture(url,path);
		// try {
		// result = HttpUtils.doGet(url);
		// System.out.println(result);
		// } catch (Exception e) {
		// e.printStackTrace();
		// } finally {
		// }
		return "";
	}

	// 链接url下载图片
	private void downloadPicture(String urlList, String path) {
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
