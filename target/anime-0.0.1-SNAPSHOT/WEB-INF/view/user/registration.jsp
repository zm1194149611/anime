<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name='apple-mobile-web-app-capable' content='yes' />
<meta content="telephone=no" name="format-detection">
<c:if test="${flag==true}">
			<title>签到</title>
		</c:if>
		<c:if test="${flag==false}">
			<title>签退</title>
		</c:if>
<link href="${contextPath}/css/registration.css" rel="stylesheet"
	type="text/css">
<link href="${contextPath}/css/public.css" rel="stylesheet"
	type="text/css">
<script src="${contextPath}/js/registration.js" type="text/javascript"></script>
<script src="${contextPath}/js/jquery.js"></script>
<script src="${contextPath}/js/box.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js"></script>
<script type="text/javascript">
	var contextPath = '${contextPath}';
</script>
</head>
<body>
	<header>
		<img class="head-bk" src="${contextPath}/image/registration-head.png">
		<img class="head-img" id="me" src="${headImg}">
	</header>

	<input id="openId" value="${openId}" type="hidden" />
	<input id="userId" value="${userId}" type="hidden" />
	<article>
		<p class="name">${userName}</p>
		<div class="people-introduce">
			<img class="number-img"
				src="${contextPath}/image/registration-number.png"> <span
				class="number">${tutorNum}</span> <img class="where-img"
				src="${contextPath}/image/registration-where.png"> <span
				class="where"><c:if test='${fn:length(zone)>0}'>
					<spring:message code="project.zone.zone${zone}" />
				</c:if></span>
		</div>

		<c:if test="${flag==true}">
			<div class="registration-button" id="registration">
				<span>签&nbsp&nbsp&nbsp&nbsp&nbsp到</span>
			</div>
		</c:if>
		<c:if test="${flag==false}">
			<div class="registration-button" id="singOut">
				<span>签&nbsp&nbsp&nbsp&nbsp&nbsp退</span>
			</div>
		</c:if>
	</article>
	<ul class="time">
		<li id="startTime"><label>签到时间</label> <span id="sp1"></span></li>
		<li id="endTime"><label>签退时间</label> <span id="sp2"></span></li>
		<li id="totalTime"><label>本次服务</label> <span id="sp3"></span></li>
	</ul>
	<script type="text/javascript">
	 <%java.util.Map<String,String> shareInfo = (java.util.Map<String,String>)request.getAttribute("info");
    shareInfo = shareInfo==null?new java.util.HashMap<String,String>():shareInfo;%>
		var wxConfig = {
				   debug: false, 
				   appId: '<%=shareInfo.get("appId")%>', 
				   timestamp:<%=shareInfo.get("timestamp")%>, 
				   nonceStr: '<%=shareInfo.get("nonceStr")%>', 
				   signature: '<%=shareInfo.get("signature")%>',
			jsApiList : ['closeWindow','scanQRCode' ]
		};
	</script>
</body>
</html>