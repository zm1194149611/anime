<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:forEach var="comic" items="${comics}">
  <div class="content" onclick="location.href='${contextPath}/comic/detail?comicId=${comic.id}'">
     <div class="contentHead" >
         <p class="name">${comic.title }</p>
         <img class="before" src="${contextPath}/image/man2.jpg"><span>${comic.tags} </span>
         <c:choose>
		    <c:when test="${fn:indexOf(project.passed,'true')==0&&project.issye==1}">
			    <img class="certification" src="${contextPath}/image/Certification.png">
		    </c:when>
        </c:choose>
     </div>
     <div class="contentBody">
         <img class="indexPic" src="${comic.imgUrl}" >
         <div class="font">
             <!-- <p class="projIntroduce" > -->
             <p class="projIntroduce" >
             	${comic.introduce} 
             </p>
             <%--  <div class="statistical">
                <p><img src="${contextPath}/image/see.png"><span>${project.likeCount}</span></p>
                <p><img src="${contextPath}/image/zan.png"><span>${project.visitCount}</span></p>
              </div> --%>
				
			<div class="time">
               <%-- <img src="${contextPath}/image/man6.jpg"><span>更新时间：${fn:split(project.commitDate," ")[0]}</span> --%>
               <span>&nbsp;&nbsp;作者：${comic.author} </span>
            </div>
              
         </div> 
         <div class="pointPeopelList">	    
			<p>热度 ：<label>${comic.pageView }</label></p>
		</div>    
     </div>
 </div>
</c:forEach>
<script type="text/javascript">showClickMore('${hasMore}');</script>