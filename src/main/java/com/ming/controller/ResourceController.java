package com.ming.controller;

import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ming.entity.CartoonBody;
import com.ming.entity.CartoonChapter;
import com.ming.exception.BusiException;
import com.ming.exception.BusiException.BusiCode;
import com.ming.frame.exception.BaseCode;
import com.ming.frame.utils.FileUtil;
import com.ming.frame.utils.HttpUtilsTwo;
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
	
	@RequestMapping("toCartoonResource2")
	public String toCartoonResource2() {
		return "anime/user/cartoonResource2";
	}
	
	/**
	 * 获取资源2
	 * @param sourcePath 资源路径
	 * @param sourcePage 资源页数
	 * @param startNo    开始编号
	 * @param targetName 资源存放名称
	 * @param cartoonId  资源id
	 * @param targetTitle 资源存放标题
	 * @param targetNo    资源存放编号
	 * @param needLogin   是否需要登录
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getCartoonResource2")
	@ResponseBody
	public String getAnimeResource2(String sourcePath, Integer sourcePage, Integer startNo,String targetName,
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
				String urlName = "0";
				String pathName = "01";

				int i2 = i + 1;
				if (i2 < 10) {
					pathName = "0" + i2;
					urlName = i2 +"";
				} else {
					pathName = i2 + "";
					urlName = i2 + "";
				}
				String urlList = sourcePath + "/" + urlName + ".jpg";
				String path = filepathprefix + cartoonUrlPrefix + "/" + targetName + "/" + targetNo + "-" + pathName
						+ ".jpg";

				URL url = new URL(urlList);
				DataInputStream dataInputStream = new DataInputStream(url.openStream());
				FileUtil.writeFile(path, dataInputStream);


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
				String urlName = "1";
				String pathName = "01";
				if (i < 10) {
					urlName =  i + "";
					pathName = "0" + i;
				} else {
					urlName = i + "";
					pathName = i + "";
				}
				String urlList = sourcePath + "/" + urlName + ".jpg";
				String path = filepathprefix + cartoonUrlPrefix + "/" + targetName + "/" + targetNo + "-" + pathName
						+ ".jpg";

				URL url = new URL(urlList);
				DataInputStream dataInputStream = new DataInputStream(url.openStream());
				FileUtil.writeFile(path, dataInputStream);

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
	
	public static void main(String[] args) {
		String url = "https://www.tohomh123.com/yirenzhixia/";
		
		Document doc = HttpUtilsTwo.JsoupGetDoc(url);
		Elements eles = doc.select("#detail-list-select-1");
		for (Element ele : eles) {
			Elements eles2 = ele.select("li a");
			for (Element element : eles2) {
				String link = element.attr("href");
				System.out.println(link);
				String url2 = "https://www.tohomh123.com"+link;
				Document doc2 = HttpUtilsTwo.JsoupGetDoc(url2);
				
				Map<String, Object> map = new HashMap<String, Object>();
				/*取得script下面的JS变量*/		
				Elements eee = doc2.getElementsByTag("script").eq(6);				
				/*循环遍历script下面的JS变量*/		
				for (Element ee : eee) {						
					/*取得JS变量数组*/
					String[] data = ee.data().toString().split("var");						
					/*取得单个JS变量*/			
					for(String variable : data){								
						/*过滤variable为空的数据*/				
						if(variable.contains("=")){										
							/*取到满足条件的JS变量*/					
							if(variable.contains("option") || variable.contains("config")|| variable.contains("color") || variable.contains("innerColor")){
								String[]  kvp = variable.split("=");												
								/*取得JS变量存入map*/						
								if(!map.containsKey(kvp[0].trim())) {
									map.put(kvp[0].trim(), kvp[1].trim().substring(0, kvp[1].trim().length()-1).toString());
								}
														
							}				
						}			
					}		
				}		
				

				
				Elements select = doc2.select(".comiclist");
				for (Element element2 : select) {
					Elements e = element2.select("div img");
					String attr = e.get(0).attr("src");
					System.out.println(attr);
				}
			}
					
			
		}
	}
	
	/**
	 * 获取资源2
	 * @param sourcePath 资源路径
	 * @param sourcePage 资源页数
	 * @param startNo    开始编号
	 * @param targetName 资源存放名称
	 * @param cartoonId  资源id
	 * @param targetTitle 资源存放标题
	 * @param targetNo    资源存放编号
	 * @param needLogin   是否需要登录
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getCartoonResourceByName")
	@ResponseBody
	public String getCartoonResourceByName(String sourceName,String cartoonId) throws Exception {

		String url = "https://www.tohomh123.com/"+sourceName+"/";
		
		Document doc = HttpUtilsTwo.JsoupGetDoc(url);
		if(doc==null) {
			throw new BusiException(BaseCode.PARAM_REQUIRED, "网络异常");
		}
		Elements eles = doc.select(".line1");
		for (Element ele : eles) {
			
		}
		
		
		
//		// 插入章节
//		CartoonChapter cartoonChapter = new CartoonChapter();
//		cartoonChapter.setId(IDUtil.generate());
//		cartoonChapter.setCartoonId(LongUtil.valueOf(cartoonId));
//		cartoonChapter.setTitle(targetTitle);
//		cartoonChapter.setSequence(targetNo);
//		cartoonChapter.setNeedLogin(needLogin);
//		cartoonChapter.setNeedCharge(0);
//		cartoonChapter.setCreateTime(new Date());
//		cartoonChapter.setDisable(0);
//		cartoonChapter.setPageView(0);
//		cartoonChapter.setLastViewTime(null);
//		cartoonChapterService.add(cartoonChapter);
//
//		if (startNo == 0) {// 从0开始
//			for (int i = 0; i < sourcePage; i++) {
//
//				// 构建资源地址
//				String urlName = "0";
//				String pathName = "01";
//
//				int i2 = i + 1;
//				if (i2 < 10) {
//					pathName = "0" + i2;
//					urlName = i2 +"";
//				} else {
//					pathName = i2 + "";
//					urlName = i2 + "";
//				}
//				String urlList = sourcePath + "/" + urlName + ".jpg";
//				String path = filepathprefix + cartoonUrlPrefix + "/" + targetName + "/" + targetNo + "-" + pathName
//						+ ".jpg";
//
//				URL url = new URL(urlList);
//				DataInputStream dataInputStream = new DataInputStream(url.openStream());
//				FileUtil.writeFile(path, dataInputStream);
//
//
//				// 插入图片数据
//				CartoonBody cartoonBody = new CartoonBody();
//				cartoonBody.setChapterId(cartoonChapter.getId());
//				cartoonBody.setCartoonId(LongUtil.valueOf(cartoonId));
//				cartoonBody.setSequence(i2);
//				cartoonBody.setImgUrl("/" + targetName + "/" + targetNo + "-" + pathName + ".jpg");
//				cartoonBody.setCreateTime(new Date());
//
//				cartoonBodyService.add(cartoonBody);
//
//			}
//		} else {// 从1开始
//			for (int i = 1; i <= sourcePage; i++) {
//
//				// 构建资源地址
//				String urlName = "1";
//				String pathName = "01";
//				if (i < 10) {
//					urlName =  i + "";
//					pathName = "0" + i;
//				} else {
//					urlName = i + "";
//					pathName = i + "";
//				}
//				String urlList = sourcePath + "/" + urlName + ".jpg";
//				String path = filepathprefix + cartoonUrlPrefix + "/" + targetName + "/" + targetNo + "-" + pathName
//						+ ".jpg";
//
//				URL url = new URL(urlList);
//				DataInputStream dataInputStream = new DataInputStream(url.openStream());
//				FileUtil.writeFile(path, dataInputStream);
//
//				// 插入图片数据
//				CartoonBody cartoonBody = new CartoonBody();
//				cartoonBody.setChapterId(cartoonChapter.getId());
//				cartoonBody.setCartoonId(LongUtil.valueOf(cartoonId));
//				cartoonBody.setSequence(i);
//				cartoonBody.setImgUrl("/" + targetName + "/" + targetNo + "-" + pathName + ".jpg");
//				cartoonBody.setCreateTime(new Date());
//
//				cartoonBodyService.add(cartoonBody);
//
//			}
//		}

		return "";
	}

}
