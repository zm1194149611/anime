<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${votes.list }" var="vote">
	<div class="peopleList" onclick="goToVoterPage('${vote.user_id}')">
	    <div class="peopleList-left">
	        <c:set var="headImgUrl" value="${vote.headImgUrl}"/>
        	<c:if test='${vote.headImgUrl==null||""==vote.headImgUrl}'>
	  		<c:set var="headImgUrl" value="${contextPath}/image/sye-headImg.jpg"/>
        	</c:if>
          	<img class="peopleList-peopleImg" src='${headImgUrl}'/>
        	<c:if test="${fn:indexOf(vote.role,'1')==0}">
        	<img class="peopleList-peopleDao" src="${contextPath}/image/mycenter-dao.png">
	    	</c:if>
	    	<c:if test="${fn:indexOf(vote.role,'0')==0}">
        	<img class="peopleList-peopleDao" src="${contextPath}/image/mycenter-chuang.png">
	    	</c:if>
	     	<c:if test="${fn:indexOf(vote.role,'3')==0}">
        	<img class="peopleList-peopleDao" src="${contextPath}/image/mycenter-chuangH.png">
	    	</c:if>
	     	<c:if test="${fn:indexOf(vote.role,'4')==0}">
        	<img class="peopleList-peopleDao" src="${contextPath}/image/mycenter-daoH.png">
	    	</c:if>
	    </div>
	    <div class="peopleList-right">
	        <span>${vote.nickName }</span>
	        <c:choose>
             <c:when test="${fn:indexOf(vote.level,'1')==0}">
                 <img src="${contextPath}/image/v1.png">
             </c:when>
             <c:when test="${fn:indexOf(vote.level,'2')==0}">
                 <img src="${contextPath}/image/v2.png">
             </c:when>
             <c:when test="${fn:indexOf(vote.level,'3')==0}">
                 <img src="${contextPath}/image/v3.png">
             </c:when>
             <c:when test="${fn:indexOf(vote.level,'4')==0}">
                 <img src="${contextPath}/image/v4.png">
             </c:when>
             <c:when test="${fn:indexOf(vote.level,'5')==0}">
                 <img src="${contextPath}/image/v5.png">
             </c:when>
             <c:otherwise>
                 <img src="${contextPath}/image/v6.png">
             </c:otherwise>
        	</c:choose>
	        	<c:choose>
            	<c:when test='${vote.certification!=null&&""!=vote.certification}'>
                	<img src="${contextPath}/image/realname.png">
            	</c:when>
	        </c:choose>
	        <c:choose>
	            <c:when test="${fn:indexOf(vote.role,'1')==0||fn:indexOf(vote.role,'0')==0}">
	                <img src="${contextPath}/image/SYE.png">
	             </c:when>
	        </c:choose>
	    </div>
	    <img class="peopleList-arrow" src="${contextPath }/image/mycenter-arrows.png">
	</div>
</c:forEach>