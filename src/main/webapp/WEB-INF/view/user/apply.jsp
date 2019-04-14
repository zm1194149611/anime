<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html leng="en">
<head>
	<title>项目申请</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<meta name='apple-mobile-web-app-capable' content='yes'/>
	<link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/css/apply.css">
	
	<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
	<script type="text/javascript" src="${contextPath}/js/footer.js"></script>
	<script type="text/javascript">
	var contextPath = '${contextPath}';
	var userId='${userId}';
	var domain = '${domainName}';
	var isUpdateUser = '${isUpdateUser}';
    var type = "footerAddSubMenu";
	function consulting(){
		Box.alert("还在开发中……");
	}
	$(function(){
		footer.footerAddSubMenu();
	});
	</script>
</head>
<body>
	<div class="con">
		<section class="work">
			<!-- 创业申请需要的条件 -->
			<div class="conditions">
			
				<p class="apply_work"><img class="shu" src="${contextPath}/image/footprint-shu.png">&nbsp;创业申请所需的条件</p>
				<div class="conditions_de">
					<p>如果你是下面类型的人群，成为SYE的创业者，你可以得到3-10万元免息、免担保的创业启动资金贷款，能得到一对一导师的培训和辅导并在其引导下进入工商网络，继而成功创业。</p>
					<ul>
						<li>18-40岁的青年人</li>
						<li>有创业梦想和创业激情</li>
						<li>有很好的商业点子</li>
						<li>筹措不到创业启动资金</li>
						<li>缺乏商业经验</li>
						<li>创业一年以内</li>
					</ul>
				</div>
			</div>
			<!-- 流程 -->
			<div class="process">
			
				<p class="apply_work"><img class="shu" src="${contextPath}/image/footprint-shu.png">&nbsp;申报流程图</p>
				<div class="process_img"><img src="${contextPath}/image/process.jpg"></div>
				
			</div>
			<!-- 地址 -->
			<div class="address">
			
				<p class="apply_work"><img class="shu" src="${contextPath}/image/footprint-shu.png">&nbsp;详细地址</p>
				<div class="area">
					<p class="area_work">${companyInfo[0].companyName}</p>
					<ul class="addre">
						<li>地址：${companyInfo[0].address}</li>
						<li>电子邮箱: ${companyInfo[0].email}</li>
						<li>联系电话: ${companyInfo[0].telephone}</li>
						<li>联系人: ${companyInfo[0].linkMan}</li>
					</ul>
				</div>
			</div>
		</section>
	</div>
</body>
</html>