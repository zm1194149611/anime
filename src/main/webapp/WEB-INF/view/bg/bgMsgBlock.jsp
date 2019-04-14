<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${empty msgs}">暂无数据...</c:if>
<div id="msgAuditing">
<c:forEach items="${msgs}" var="msg" varStatus="status">
	<li><div>${start+status.index+1}.</div>
	    <img class="image" src="${contextPath}/pics/${msg.msg.imgURL}" onerror="this.src='${contextPath}/image/msg_default.jpg'">
	    <div class="messageFont">
	        <p>
	            <span>留言时间：<label>${msg.time}</label></span>
	            <span>审核状态：<label>${msg.msg.flag=="1"?"已通过":(msg.msg.flag=="-1"?"已删除":(msg.msg.flag=="0"?"未审核":"未知的状态"))}</label></span>
	            <span>审核时间：<label>${msg.checkTime}</label></span>
	        </p>
	        <p class="block1">
	            <span>姓名：<label>${msg.user.userName}</label></span>
	            <span>昵称：<label class="emphasis-focus">${msg.user.nickName}</label></span>
	            <span>手机号：<label>${msg.user.telphoneNumber}</label></span>
	        </p>
	        <p class="messageText">
	            <span>留言内容：</span>
	            <label class="emphasis-focus">${fn:escapeXml(msg.msg.msg)}</label>
	        </p>
	        <p><span class="Btn ok" onclick="doCheck('${msg.msg.id}',true);">审核通过</span><span class="Btn no" onclick="doCheck('${msg.msg.id}',false);">删除留言</span></p>
	    </div>
	</li>
</c:forEach>
</div>
