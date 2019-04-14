<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="project" items="${projects}">
  <div class="content">
     <div class="contentHead" onclick="location.href='${contextPath}/ground/projectDetail?projectId=${project.id}&&showDetailHeader=${showDetailHeader}'">
         <p class="name">${project.name}</p>
         <img class="before" src="${contextPath}/image/man4.jpg"><span><spring:message code="project.zone.${project.zone}" /></span>
         <img class="before" src="${contextPath}/image/man3.jpg"><span><spring:message code="project.business.${project.business}"/></span>
         <img class="before" src="${contextPath}/image/man2.jpg"><span><spring:message code="project.status.${project.status}" /></span>
         <c:choose>
		    <c:when test="${fn:indexOf(project.passed,'true')==0&&project.issye==1}">
			    <img class="certification" src="${contextPath}/image/Certification.png">
		    </c:when>
        </c:choose>
         <c:if test="${project.passTime>0&&!project.passed}"><a href="#">修改</a></c:if>
     </div>
     <div class="contentBody">
         <img class="indexPic" src="${contextPath}/pics/${project.indexPic}" onclick="location.href='${contextPath}/ground/projectDetail?projectId=${project.id}&&showDetailHeader=${showDetailHeader}'">
         <div class="font">
             <p class="projIntroduce" onclick="location.href='${contextPath}/ground/projectDetail?projectId=${project.id}&&showDetailHeader=${showDetailHeader}'">${project.projIntroduce}</p>
              <%-- <div class="statistical">
                <p><img src="${contextPath}/image/see.png"><span>${project.likeCount}</span></p>
                <p><img src="${contextPath}/image/zan.png"><span>${project.visitCount}</span></p>
              </div> --%>
				<ul class="icon">
					<li><img class="browse" src="${contextPath}/image/browse.png">
						<label>${project.visitCount}</label></li>
					<li><img class="shareCout" src="${contextPath}/image/shareCount.png"> 
						<label>${project.shareCount}</label></li>
					<li><img id="vote" class="vote" src="${contextPath}/image/doVoteUp.png" onclick="doVote(this,'${project.id}')"> 
						<label id="${project.id}">${project.likeCount}</label></li>
				</ul>
				<div class="time">
               <img src="${contextPath}/image/man6.jpg"><span>更新时间：${fn:split(project.commitDate," ")[0]}</span>
              </div>
              
         </div> 
         <div class="pointPeopelList">	    
					<p><img src="${contextPath}/image/doVoteUp.png"><label>${project.voteUserName }</label>觉得赞</p>
				</div>      
     </div>
 </div>
</c:forEach>
<script type="text/javascript">showClickMore('${hasMore}');</script>