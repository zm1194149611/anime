<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <script type="text/javascript">
 $(function(){
		$(".wrap-line").each(function(){
		    $(this).html($(this).html().replace(/\n/g,'<br/>'+'&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'));
		});
	});
 </script>
<c:forEach var="track" items="${PrjTracks}">
	<section>
		<div class="left">
			<span class="year">${track.year}</span> <span class="month">${track.date}</span>
		</div>
		<div class="right">
			<div class="footprint-left">
				<img class="yuan" src="${contextPath}/image/footprint-yuan.png">
				<img class="dian" src="${contextPath}/image/footprint-dian.png">
			</div>
			<div class="footprint-right">
				<div class="right-head">
					<div class="head-left">
						<c:choose>
							<c:when test='${track.headImgUrl!=null && track.headImgUrl!=""}'>
								<img class="my" src="${track.headImgUrl}">
							</c:when>
							<c:otherwise>
								<img class="my" src="${contextPath}/image/sye-headImg.jpg" />
							</c:otherwise>
						</c:choose>
						<c:if test="${fn:indexOf(track.role,'1')==0}">
							<img class="dao" src="${contextPath}/image/mycenter-dao.png">
						</c:if>
						<c:if test="${fn:indexOf(track.role,'0')==0}">
							<img class="dao" src="${contextPath}/image/mycenter-chuang.png">
						</c:if>
						<c:if test="${fn:indexOf(track.role,'3')==0}">
							<img class="dao" src="${contextPath}/image/mycenter-chuangH.png">
						</c:if>
						<c:if test="${fn:indexOf(track.role,'4')==0}">
							<img class="dao" src="${contextPath}/image/mycenter-daoH.png">
						</c:if>
					</div>
					<div class="head-right">
						<c:choose>
							<c:when test="${fn:indexOf(track.level,'1')==0}">
								<img src="${contextPath}/image/v1.png">
							</c:when>
							<c:when test="${fn:indexOf(track.level,'2')==0}">
								<img src="${contextPath}/image/v2.png">
							</c:when>
							<c:when test="${fn:indexOf(track.level,'3')==0}">
								<img src="${contextPath}/image/v3.png">
							</c:when>
							<c:when test="${fn:indexOf(track.level,'4')==0}">
								<img src="${contextPath}/image/v4.png">
							</c:when>
							<c:when test="${fn:indexOf(track.level,'5')==0}">
								<img src="${contextPath}/image/v5.png">
							</c:when>
							<c:otherwise>
								<img src="${contextPath}/image/v6.png">
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test='${track.certification!=null&&""!=track.certification}'>
								<img src="${contextPath}/image/realname.png">
							</c:when>
						</c:choose>
						<c:choose>
							<c:when
								test="${fn:indexOf(track.role,'1')==0||fn:indexOf(track.role,'0')==0}">
								<img src="${contextPath}/image/SYE.png">
							</c:when>
						</c:choose>
					</div>
				</div>
				<div class="right-world">
					<span class="wrap-line">${track.trackTopic}</span>
				</div>
				<c:if test='${track.trackImg!=null&&fn:length(track.trackImg)>0}'>
				<div class="right-picture" >
					<c:forEach var="img" items="${fn:split(track.trackImg,',')}" varStatus="s">
						<img onclick="previewImg(${s.index},'${track.trackImg }');" src="${contextPath }/pics/${img}">
					</c:forEach>
				</div>
				</c:if>
				<%-- <div class="zan">
					<label>${track.trackUpvote}</label><span>人觉得很赞</span> 
					<img src="${contextPath}/image/footprint-zan.png" onclick="doUpVote(this,${track.id})">
				</div> --%>
				<div class="pointPeopelList">	    
					<p><img  onclick="doUpVote(this,${track.id})" src="${contextPath}/image/doVoteUp.png"><label>${track.voteUserName }</label>觉得赞</p>
				</div>
			</div>
			<div class="fill"></div>
		</div>
	</section>
</c:forEach>