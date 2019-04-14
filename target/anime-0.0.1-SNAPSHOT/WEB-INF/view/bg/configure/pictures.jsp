<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<% String path= request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		%>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		
		<link href="${contextPath}/bg/css/H-ui.min.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/lib/lightbox2/2.8.1/css/lightbox.css" rel="stylesheet" type="text/css" >
		
		<title>图片展示</title>
	</head>
	
	<body>
	<!-- <nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 
		<span class="c-gray en">&gt;</span> 配置管理 
		<span class="c-gray en">&gt;</span> 图片展示 
	</nav> -->
	<div class="pd-20">
		<div class="cl pd-5 bg-1 bk-gray mt-20"> 
			<span class="l"> 
				<a onclick="addPicture('添加图片','banner-add?syeBannerId=${syeBanner.syeBannerId}&start=${start}','','610')" 
				class="btn btn-primary radius"><i class="Hui-iconfont">&#xe6df;</i> 修改</a> 
			</span>
			</div>
		<div class="portfolio-content">
			<ul class="cl portfolio-area">
				<li class="item">
					<div class="portfoliobox">
						<%-- <input class="checkbox" name="imageDelete" type="checkbox" value="${image}"> --%>
						<div class="picbox"><a href="<%=basePath %>pics/${image}" data-lightbox="gallery" data-title="Banner预览"><img src="<%=basePath %>pics/${image}"></a></div>
						<div class="textbox">Banner预览 </div>
						<br/>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<script type="text/javascript" src="${contextPath}/bg/lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/lib/layer/1.9.3/layer.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/lib/lightbox2/2.8.1/js/lightbox-plus-jquery.min.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/js/H-ui.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/js/H-ui.admin.js"></script> 
	<script type="text/javascript">	
	/*添加图片*/
	function addPicture(title,url,w,h){
		layer_show(title,url,w,h);
	}
	</script>
	</body>
</html>