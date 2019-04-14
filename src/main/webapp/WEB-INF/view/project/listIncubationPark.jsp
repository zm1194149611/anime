<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach var="parks" items="${park}">
        <div class="list">
			<div class="area">${parks.softName}</div>
			<div class="baseMessage">
				<span class="station">工位：<label>${parks.freeCount}</label>/${parks.totalCount}</span>
				<span class="price">单价：<label>${parks.stationPrice}</label>/月</span>
				<span class="in">SYE入驻项目：<label>${parks.projectCount}</label>个</span>
				<div style="clear:both"></div>
			</div>
<!-- 			图片、园区介绍 -->
			<div class="area_con">
			<div class="area_con_left">
				<c:if test='${parks.softParkImgUrl!=null&&parks.softParkImgUrl!=""}'>
					<img onclick="location.href='${contextPath}/ground/ParkDetails?softParkId=${parks.softParkId}'"
						src="${contextPath}/pics/incubationpark/${parks.softParkImgUrl}" id="area_left">
				</c:if>
			</div>
			<div class="area_con_right" onclick="location.href='${contextPath}/ground/ParkDetails?softParkId=${parks.softParkId}'">
					<div class="jobs">
						<c:forEach items="${parks.listIndustryLabel}" var="item" varStatus="status">
                            <span><spring:message code="${item.industryLabelName}"/></span>
                        </c:forEach>
					</div>
					<div class="introduction">${parks.softParkIntroduce}</div>
				</div>
				<div style="clear:both"></div>
			</div>
		<ul class="icon">
			<li><img class="browse" src="${contextPath}/image/browse.png">
				<label>${parks.browseCount}</label></li>
			<li><img class="shareCout"
				src="${contextPath}/image/shareCount.png"> <label>${parks.totalShareCount}</label></li>
			<li><img id="vote" class="vote" 
				src="${contextPath}/image/doVoteUp.png" onclick="doVoteUp(this,'${parks.softParkId}')"> <label id="${parks.softParkId}">${parks.totalVoteUpCount}</label></li>
		</ul>
		<div class="pointPeopelList">	    
			<p><img src="${contextPath}/image/doVoteUp.png"><label>${parks.voteUserName }</label>觉得赞</p>
		</div>
		<%-- <div class="behavior">
				<div class="comments">
<!-- 				<div class="share"> -->
					<a href="#" class="share_btn"><img src="${contextPath}/image/share.png"></a>
<!-- 				</div> -->
				
					<a href="#" class="share_btn"><img src="${contextPath}/image/interaction-world.png"></a>
					<a href="#" class="share_btn"><img src="${contextPath}/image/interaction-good.png" onclick="doVoteUp('${parks.softParkId}')"></a>
				</div>
			</div>
			<div style="clear:both"></div>
<!-- 			浏览、赞人数 -->
			<div class="statistical">
				<div><img src="${contextPath}/image/see.png"><span>${parks.browseCount}</span></div>
				<div><img src="${contextPath}/image/zan.png"><span id="${parks.softParkId}">${parks.totalVoteUpCount}</span></div>
			</div> --%>
		</div>
</c:forEach>
<script type="text/javascript" src="${contextPath}/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
showClickMore('${hasMore}');

$(function(){
	var doc=$(document);
	$(".area_con_left").click(function(){ 
// 		$(this).attr("class","area_left");  
		
		$(".area_con_left1").css({
			display:"block",
	        width:doc.width(),
	        height:doc.height(),
	        backgroundColor:"white",
	        position:"absolute",
	        top:0,
	        left:0
	    });
		
// 		$("#area_left1").css({
//             width:"100%",
// 			height:"200px"
//        });
	});
	
    function loginPrompt(){
    	Box.prompt("您还没登陆，请先登录！")
    }
});
</script>