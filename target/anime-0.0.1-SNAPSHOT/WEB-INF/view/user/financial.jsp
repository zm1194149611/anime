<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
	<title>财务</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<meta name='apple-mobile-web-app-capable' content='yes'/>
	<link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/css/financial.css">
	<link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${contextPath}/js/footer.js"></script>
	<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
	<script type="text/javascript">
	var contextPath = "${contextPath}";
	var userId='${userId}';
	var domain = '${domainName}';
	var isUpdateUser = '${isUpdateUser}';
    var type = "footerAddSubMenu";
	$(function(){
		footer.footerAddSubMenu();
	});
	</script>
</head>
<body>
	<div class="con">
		<div class="top"><img src="${contextPath}/image/financial.jpg"></div>
			<div class="describe">
				<p>亲爱的创业者:</p>
				<p style="text-indent:2em">你好！</p>
				<p style="text-indent:2em">四川青年创业就业基金会，借助“SYE创业四川”官方微信服务平台，为广大青年创业者提供财务咨询服务。如果你在创业过程中，有关于财务方面的问题需要援助，可以直接在线提交给我们，我们会为寻找财务专家进行解答。</p>
				<span class="example">问题举例：单据审批管理、资金使用计划、财务报表管理等</span>
			</div>
			<a href="https:/www.wenjuan.com/s/biyeem"><div class="consulting">咨询</div></a>
	</div>
</body>
</html>