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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 孵化园管理 <span class="c-gray en">&gt;</span> 图片展示 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> <a href="javascript:;" onclick="addPicture('添加图片','picture-add?incubationParkId=${incubationPark.softParkId}','','610')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe6df;</i> 新增</a> <a href="javascript:;" onclick="datadel('${incubationPark.softParkId }')" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 删除选中</a> </span> <span class="r">共有数据：<strong id="count">${fn:length(images)}</strong> 条</span> </div>
	<div class="portfolio-content">
		<ul class="cl portfolio-area">
		<c:forEach var="image" items="${images}">
			<li class="item">
				<div class="portfoliobox">
					<input class="checkbox" name="imageDelete" type="checkbox" value="${image}">
					<div class="picbox"><a href="<%=basePath %>pics/incubationpark/${image}" data-lightbox="gallery" data-title="孵化园预览"><img src="<%=basePath %>pics/incubationpark/${image}"></a></div>
					<div class="textbox">孵化园预览 </div>
					<br/>
					<div>
					<c:if test="${incubationPark.softParkImgUrl == image }">
						<a type="imageShow" isCover="yes" onclick="setToCover(this,'${image}','${incubationPark.softParkId}');" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6df;</i> 
						
						封面展示
						</a>
					</c:if>
					<c:if test="${incubationPark.softParkImgUrl != image }">
						<a type="imageShow" isCover="no" name="${image}" onclick="setToCover(this,'${image}','${incubationPark.softParkId}');" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe6df;</i> 
						
						设置为封面
						</a>
					</c:if>
						</div>
					
				</div>
			</li>
			</c:forEach>
		</ul>
	</div>
</div>
<script type="text/javascript" src="${contextPath}/bg/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/lib/layer/1.9.3/layer.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/lib/lightbox2/2.8.1/js/lightbox-plus-jquery.min.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/js/H-ui.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/js/H-ui.admin.js"></script> 
<script type="text/javascript">
$(function(){
	$.Huihover(".portfolio-area li");
});
/*设置封面*/
function setToCover(thisImage,image,incubationParkId){
	//alert('ff:'+$(thisImage)==);
	if($(thisImage).attr("isCover")=="yes"){
		return false;
	}
	var incubationParkIdInt = parseInt(incubationParkId);
	$.ajax({
		url:"setCover",
		data:{"image":image,"incubationParkId":incubationParkIdInt},
		type:"post",
		success:function(result){
			var imageList = $("a[type='imageShow']");
			for(i=0;i<imageList.length;i++){
				$(imageList[i]).attr("isCover","no");
			}
			
			$(thisImage).attr("isCover","yes");
			resetUI();
			layer.msg('操作成功!',{icon:1,time:1000});
		}
	}); 
}

function resetUI(){
	var imageList = $("a[type='imageShow']");
	for(i=0;i<imageList.length;i++){
		if($(imageList[i]).attr("isCover")=="yes"){
			$(imageList[i]).text("封面展示");
			$(imageList[i]).attr("class","btn btn-danger radius");
		}else if($(imageList[i]).attr("isCover") == "no"){
			$(imageList[i]).text("设置为封面");
			$(imageList[i]).attr("class","btn btn-primary radius");
			$(imageList[i]).attr("isCover","false");
		}
		
	}
}

/*添加图片*/
function addPicture(title,url,w,h){
	layer_show(title,url,w,h);
}

/*删除图片*/
function datadel(incubationParkId){
	var cover = $("a[class='btn btn-danger radius']").parent().siblings("input").first();
	if ($(cover).is(':checked')){
		layer.msg('不能删除封面!',{icon:2,time:1000});
		return false;
	}
	layer.confirm("确定要删除吗?",function(){
		//不能删除封面
		var imageDeletes = $("input[name='imageDelete']");
		var imageDelete = "";
		var index = 0;
		//alert(imageDeletes.length);
		for(var i = 0;i < imageDeletes.length;i++){
			if(!imageDeletes[i].checked){
				index++;
				if(imageDelete == ""){
					imageDelete += $(imageDeletes[i]).attr("value");
				}else{
					imageDelete += (","+$(imageDeletes[i]).attr("value"));
					
				}
			}
		}
		if(index == imageDeletes.length){
			layer.msg('没有选择图片!',{icon:2,time:1000});
			return false;
			
		}
		var incubationParkIdInt = parseInt(incubationParkId);
		//alert(incubationParkIdInt);
		//alert(imageDelete);
		$.ajax({
			url:"imageDelete",
			type:"post",
			data:{"incubationParkId":incubationParkIdInt,"imageDelete":imageDelete},
			success:function(result){
				var ind = 0;
				//删除已选择的节点
				for(var i=0;i < imageDeletes.length;i++){
					if($(imageDeletes[i]).is(':checked')){
						ind++;
						$(imageDeletes[i]).parent().parent().remove();
					}
				}
				var strong = $("#count").text();
				$("#count").text(parseInt(strong)-ind);
				layer.msg('操作成功!',{icon:1,time:1000});
			}
		});
		
	});
	
}
</script>
</body>
</html>