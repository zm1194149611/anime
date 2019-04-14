<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach var="tutor" items="${user}">
<div class="left" onclick="location.href='${contextPath}/pubUser/tutorDetails?userId=${tutor.id}'" >
		<c:choose>
			<c:when test='${tutor.rheadimg!=null||fn:length(tutor.rheadimg)>0}'>
				<img src="${contextPath}/pics/auditImg/${tutor.rheadimg}" />
			</c:when>
			<c:otherwise>
				<img src="${contextPath}/image/sye-headImg.jpg" />
			</c:otherwise>
		</c:choose>
	</div>
        <div class="right">
            <div class="introduce" onclick="location.href='${contextPath}/pubUser/tutorDetails?userId=${tutor.id}'">
                <div class="introduce-left">
                    <span class="name">${tutor.userName}</span>
				<c:choose>
					<c:when test="${fn:indexOf(tutor.level,'1')==0}">
						<img src="${contextPath}/image/v1.png">
					</c:when>
					<c:when test="${fn:indexOf(tutor.level,'2')==0}">
						<img src="${contextPath}/image/v2.png">
					</c:when>
					<c:when test="${fn:indexOf(tutor.level,'3')==0}">
						<img src="${contextPath}/image/v3.png">
					</c:when>
					<c:when test="${fn:indexOf(tutor.level,'4')==0}">
						<img src="${contextPath}/image/v4.png">
					</c:when>
					<c:when test="${fn:indexOf(tutor.level,'5')==0}">
						<img src="${contextPath}/image/v5.png">
					</c:when>
					<c:otherwise>
						<img src="${contextPath}/image/v6.png">
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test='${tutor.certification!=null&&""!=tutor.certification}'>
						<img src="${contextPath}/image/realname.png">
					</c:when>
				</c:choose>
				<c:choose>
					<c:when
						test="${fn:indexOf(tutor.role,'1')==0||fn:indexOf(tutor.role,'0')==0}">
						<img src="${contextPath}/image/SYE.png">
					</c:when>
				</c:choose>
			</div>
			<div class="introduce-right">
			    <%-- <c:if test='${tutor.position!=null&&tutor.position!=""}'>
			        <span>${tutor.position}</span>
			    </c:if> --%>
			</div>
            </div>
            <div class="industry" onclick="location.href='${contextPath}/pubUser/tutorDetails?userId=${tutor.id}'">
                <c:choose>
                    <c:when test='${tutor.skills!=null&&tutor.skills!=""}'>
                       <c:forEach items="${fn:split(tutor.skills,',')}" var="item" varStatus="status">
                          <span><spring:message code="project.mentor.skills${item}"/></span>
                       </c:forEach>
                    </c:when>
                    <c:otherwise>
                           <span>无</span>
                    </c:otherwise>
                 </c:choose>
            </div>
            <div class="company" onclick="location.href='${contextPath}/pubUser/tutorDetails?userId=${tutor.id}'">
                  <c:if test='${tutor.companyName!=null&&tutor.companyName!=""}'>
                  <label>单位</label><br>
			        <img src="${contextPath}/image/companyName.png"><span>${tutor.companyName}</span>
			      </c:if>
            </div>
            <div class="company position" onclick="location.href='${contextPath}/pubUser/tutorDetails?userId=${tutor.id}'">
                  <c:if test='${tutor.position!=null&&tutor.position!=""}'>
                  <label>职务</label><br>
			        <img src="${contextPath}/image/data_06.png"><span>${tutor.position}</span>
			      </c:if>
            </div>
            <c:choose>
                <c:when test='${tutor.rank!=null&&tutor.rank!=""}'>
                   <label class="rank">社会职务</label><br>
                   <c:forEach items="${fn:split(tutor.rank,',')}" var="item" varStatus="status">
                       <div class="word" onclick="location.href='${contextPath}/pubUser/tutorDetails?userId=${tutor.id}'"><img src="${contextPath}/image/head.png"><p><spring:message code="${item}"/></p></div>
                   </c:forEach>
                </c:when>
                <c:otherwise>
                      <label class="rank">社会职务</label><br>
			          <div class="word" onclick="location.href='${contextPath}/pubUser/tutorDetails?userId=${tutor.id}'">
			          <img src="${contextPath}/image/head.png"><p>SYE创业导师</p>
			          </div>
			       </c:otherwise>
            </c:choose>
            <%-- <div class="interact">
                <img src="${contextPath}/image/interaction-good.png" onclick="doVoteUp('${tutor.id}')">
            </div>
            <div class="statistical">
                <p><img src="${contextPath}/image/see.png"><span>${tutor.browsePoint}</span></p>
                <p><img src="${contextPath}/image/zan.png"><span id="${tutor.id}">${tutor.popPoint}</span></p>
            </div> --%>		    
	</div>
	<ul class="icon">
		<li><img class="browse" src="${contextPath}/image/browse.png">
			<label>${tutor.browsePoint}</label></li>
		<li><img class="shareCout"
			src="${contextPath}/image/shareCount.png"> <label>${tutor.sharePoint}</label></li>
		<li><img id="vote" class="vote"
			src="${contextPath}/image/doVoteUp.png"
			onclick="doVoteUp(this,'${tutor.id}')"> <label id="${tutor.id}">${tutor.popPoint}</label>
		</li>
	</ul>
	<div class="pointPeopelList">	    
	     <%-- <p><img src="${contextPath}/image/doVoteUp.png"><a>胡爸爸</a>、<a>胡爸爸</a>、<a>胡爸爸</a>、<a>胡爸爸</a>、<a>胡爸爸</a>、<a>胡爸爸</a>、<a>胡爸爸</a>、<a>胡爸爸</a>、<a>胡爸爸</a>、<a>胡爸爸</a>、<a>胡爸爸</a>、<a>胡爸爸</a>、<a>胡爸爸</a>、<a>胡爸爸</a>、<a>胡爸爸</a><a>等<label>25</label>人觉得赞</a></p> --%>
		<p><img src="${contextPath}/image/doVoteUp.png"><label>${tutor.voteUserName }</label>觉得赞</p>
	</div>
	<div class="fill"></div>
	<%-- <div id="userVote">${tutor.voteUserName }等人觉得很赞！</div> --%>
</c:forEach>
<script type="text/javascript">showClickMore('${hasMore}');</script>