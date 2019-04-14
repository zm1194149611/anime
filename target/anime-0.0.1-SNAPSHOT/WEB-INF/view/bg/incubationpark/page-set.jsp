<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="${contextPath}/bg/css/demo.css" rel="stylesheet" type="text/css" />
</head>
<body>
<center>
<div class="viciao">
<c:if test="${page.currentPage > 1}">
<a href="incubationpark-setUI?pageIndex=${page.currentPage - 1 }"><  上一页</a> 
</c:if>
<c:if test="${page.currentPage <= 1}">
<span class="disabled"><  上一页</span> 
</c:if>

<c:forEach var="i" begin="1" end="${page.totalPage}" step="1">
<c:if test="${i == page.currentPage}">
	<span class="current">${i }</span>
</c:if>
<c:if test="${i != page.currentPage}">
	<a href="incubationpark-setUI?pageIndex=${i}">${i }</a>
</c:if>
</c:forEach>

<c:if test="${page.currentPage < page.totalPage}">
<a href="incubationpark-setUI?pageIndex=${page.currentPage + 1 }">下一页  > </a>
</c:if>
<c:if test="${page.currentPage >= page.totalPage}">
<span class="disabled"><  下一页</span> 
</c:if>
</div>
</center>
</body>
</html>