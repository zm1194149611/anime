<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta name='apple-mobile-web-app-capable' content='yes'/>
<title>第${cartoonChapter.sequence }话</title>
<link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/financial.css?key=3">
<link href="${contextPath}/css/person_data.css" rel="stylesheet" type="text/css">
<%-- <link href="${contextPath}/css/tutorList.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/proList.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/pointPeopelList.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/js/adswitch.js" type="text/javascript"></script>
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css"> --%>
<style type="text/css">
   .bottom_btn{
    margin: 10px auto 0;
    width: 90%;
    height: 40px;
    text-align: center;
}
.bottom_btn a{
    display: inline-block;
    height: 40px;
    width: 40%;
    line-height: 40px;
    text-decoration: none;
    background: #34a853;
    color: #ffffff;
}
.bottom_btn a:last-of-type{
    margin-left: 5%;
    background: #d2292e;
}
    
</style>
</head>
<body>
<div  class="bottom_btn">
    <a href="${contextPath}/cartoon/index" id="">首页</a>
    <a href="${contextPath}/cartoon/detail?cartoonId=${cartoonChapter.cartoonId}" id="">目录</a>
</div>
<div class="con" style="margin-top: 6px;">
	<div class="top">
		资源收集不易，网站也需要资金维护，希望各位小伙伴观看资源后，能将公众号里每日推送的文章的第一、第二篇点开，拉到底端，增加一下文章的阅读量，若能好心帮小编点一下公众号文章底部的广告，小编将感激不尽！有喜欢的漫画，也可以在公众号内留言，小编将尽量帮大家收集！
	</div>
	<div class="top">
		<c:forEach var="cartoonBody" items="${cartoonBodys}">
    	<img src="${cartoonBody.imgUrl }"/>
		</c:forEach>
	</div>
	
</div>
<%-- <c:forEach var="cartoonBody" items="${cartoonBodys}">
    <div >
    	<img src="${cartoonBody.imgUrl }"/>
    </div>
</c:forEach> --%>
<!-- 分页实现 -->
<div style="margin-top: 20px;margin-left:20px;"><span class="showMore">共${count}页 ${page.current}/${count}页</span>
	<c:if test="${page.current>1 }">
		<a class="foo" href="${contextPath}/cartoon/getCartoonBody?chapterId=${cartoonChapter.id}&current=1">首页</a>
		<a class="foo" href="${contextPath}/cartoon/getCartoonBody?chapterId=${cartoonChapter.id}&current=${page.current-1}">上一页</a>
	</c:if>
	<c:if test="${page.current<count }">				
		<a class="foo" href="${contextPath}/cartoon/getCartoonBody?chapterId=${cartoonChapter.id}&current=${page.current+1}">下一页</a>
		<a class="foo" href="${contextPath}/cartoon/getCartoonBody?chapterId=${cartoonChapter.id}&current=${count}">尾页</a>
	</c:if>
	<span class="foo">第
	<select onchange="goToPage(this.value)">
		<c:forEach begin="1" end="${count}" varStatus="i">
			<option <c:if test="${page.current==i.count}">selected="selected"</c:if> value="${i.count}">${i.count}</option>
		</c:forEach>
	</select>页</span>
</div>
</body>
<script type="text/javascript">
/*动态选择分页页面*/
function goToPage(current){
	document.location.href="${contextPath}/cartoon/getCartoonBody?chapterId=${cartoonChapter.id}&current="+current;
}
</script>
</html>