<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name='apple-mobile-web-app-capable' content='yes' />
<title>SYE幸运大抽奖</title>
<link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/css/win.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
<script src="${contextPath}/js/win.js"></script>
<script type="text/javascript">
	var contextPath_js = "${contextPath}";
	var $jyb = '';
	$(function(){
		$jyb=$('#jyb');
		$jyb.width(document.body.clientWidth);
		$jyb.height(document.body.clientHeight);
		$layer=$('.layer');
		$layer.height('110%');
	});
	var exceptionMsg = "${exceptionMsg}";
	if(exceptionMsg&&exceptionMsg!='null'){
		alert('系统繁忙，请刷新或稍后重试');
	}
</script>
</head>
<body style="overflow: hidden;">
	<div class="layer" style="display: none">
		<div class="textBox" style="display: none">
			<img id="headimgurl" class="header" src="${contextPath}/image/big 3.jpg" onerror="this.src='${contextPath}/image/user_default.jpg'">
			<div class="content">
				<div>
					<h1 id="nickName">奔跑的老狐狸</h1>
					<p id="msg" >1、奔跑的老狐狸奔跑的老狐狸奔跑的老狐狸奔跑的老狐狸奔跑的老狐狸奔跑的老狐狸奔跑的老狐狸狸奔跑的老狐狸奔跑的老狐狸狸奔跑的老狐狸奔跑的老狐狸</p>
				</div>
				<span class="gBtn"><label id="goodsOk">抽取礼品</label><label
					id="goodsNo">放弃本轮抽奖</label></span>
			</div>
		</div>
		<div class="imgBox" style="display: none">
			<img id="pimg" src="">
			<p id="pName">红心王柚子</p>
			<span class="game" id="game">继续抽取幸运观众</span>
		</div>
		<div id="alertBox" class="alertBox" style="display: none">
			<div class="content">
				<div>
					<h1>没有最新留言，奖品暂停发放</h1>
					<p>谢谢大家！</p>
					<span class="gBtn"><label id="notHaveGoogs">确认</label></span>
					
				</div>
			</div>
		</div>
	</div>
	<img class="topFont" src="${contextPath}/image/syeFont.png">
	<p class="topP">
    <span>step1：抽取幸运观众</span><!--选中时className改变为selectedFont-->
    <span>step2：确认在现场</span>
    <span>step3：抽取礼品</span> 
    </p>
	<article>
	<span id="curr" class="curr">抽取幸运观众</span>
	<div>
		<ul id="nameBox" style="display: block">
			<c:if test="${!empty userList }">
				<c:forEach var="user" items="${userList}">
					<li id = "${user.id }" >${user.nickName }</li>
				</c:forEach>
			</c:if>
			<c:if test="${empty userList }">
				<li id = "${user.id }" >不给力啊，没人留言</li>
			</c:if>
			<%--<li>本行为中奖人</li> --%>
		</ul>
		<ul id="goodsBox" style="display: none">
			<c:if test="${!empty presentList }">
				<c:forEach var="present" items="${presentList}">
					<li id = "${present.id }" >${present.name }</li>
				</c:forEach>
			</c:if>
			<c:if test="${empty presentList }">
				<li id = "${present.id }" >居然没奖品,刷新试试!</li>
			</c:if>
		</ul>
	</div>
	<p id="nameBtn">开始抽奖</p>
	<p id="goodBtn" style="display: none">开始抽奖</p>
	<img src="${contextPath}/image/goods.png">
	</article>
	<div id="jyb" style="display:none;position: fixed;z-index: 999;top:0;">
		<img src="${contextPath}/image/jyb.gif" style="width:100%;height:100%;"/>
	</div>
</body>
</html>