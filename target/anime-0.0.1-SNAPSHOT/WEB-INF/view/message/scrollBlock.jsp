<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="batch">
	<c:forEach items="${msgs}" var="msg">
		<div class="textBox">
		    <img class="header" src="${msg.user.headImgUrl}" onerror="this.src='${contextPath}/image/user_default.jpg'">
		    <div class="content">
		        <div>
		            <h1>${msg.user.userName}</h1>
		            <p>${msg.msg.msg}</p>
		            <c:if test="${!empty msg.msg.imgURL}"><img class="img" src="${contextPath}/pics/${msg.msg.imgURL}"></c:if>
		        </div>
		    </div>
		</div>
	</c:forEach>
</div>