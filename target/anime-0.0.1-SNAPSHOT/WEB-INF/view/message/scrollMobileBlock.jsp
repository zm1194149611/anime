<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div>
	<c:forEach items="${msgs}" var="msg">
	<div class="textBox">
	    <div class="textBody">
	        <c:choose>
		    	<c:when test="${empty msg.user.headImgUrl}">
			        <img class="header" src="${contextPath}/image/user_default.jpg">
		    	</c:when>
		    	<c:otherwise>
			        <img class="header" src="${msg.user.headImgUrl}" onerror="this.src='${contextPath}/image/user_default.jpg';this.onerror='';">
		    	</c:otherwise>
		    </c:choose>
	        <div class="content">
	            <div>
	                <p class="title">${msg.user.nickName}</p>
	                <p class="text">${fn:escapeXml(msg.msg.msg)}</p>
	            </div>
	            <c:if test="${!empty msg.msg.imgURL}"><img class="img" src="${contextPath}/pics/${msg.msg.imgURL}" onerror="this.style.display='none'"></c:if>
	            <p class="time"><label>${msg.checkTime}</label></p>
	        </div>
	    </div>
	</div>
	</c:forEach>
</div>
<div style="display:none;"><p id="isNext" title="${isNext}"></p><p id="newFlag" title="${newFlag}"></p></div>