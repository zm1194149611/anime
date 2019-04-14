<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>排行榜</title>
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/rank.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
    <!--弹出层JS-->
    <script type="text/javascript" src="${contextPath}/js/box.js"></script>
    <!--!end 弹出层JS-->
    <script type="text/javascript" src="${contextPath}/js/form.js"></script>
    <script type="text/javascript" src="${contextPath}/js/footer.js"></script>
    
    <!------------------以下为添加内容---------------- -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/app.js"></script>
    <script type="text/javascript">
   <%
   java.util.Map<String,String> shareInfo = (java.util.Map<String,String>)request.getAttribute("info");
   shareInfo = shareInfo==null?new java.util.HashMap<String,String>():shareInfo;
   %>
   App.data.wechat.apis = ['onMenuShareAppMessage'];
	App.data.wechat.API_NAMEs = {'onMenuShareAppMessage':'分享给朋友'};
	var contextPath = '${contextPath}';
	var userId='${userId}';
	var domain = '${domainName}';
	var isUpdateUser = '${isUpdateUser}';
    var type = "footerAddSubMenu";
	$(function(){
		//alert("choose");
		footer.footerAddSubMenu();
		wx.ready(function(){
		wx.onMenuShareAppMessage({
		    title: '<%=shareInfo.get("title")%>', // 分享标题
		    desc: '<%=shareInfo.get("desc")%>', // 分享描述
		    link: '<%=shareInfo.get("link")%>', // 分享链接
		    imgUrl: '<%=shareInfo.get("imgUrl")%>', // 分享图标
		    type: 'link', // 分享类型,music、video或link，不填默认为link
		    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
		    success: function () { 
		        // 用户确认分享后执行的回调函数
		        //alert("success");
		    },
		    cancel: function () { 
		        // 用户取消分享后执行的回调函数
		    	//alert("success");
		    }
		});
		});
	});
    </script>
    <%@include file="../jspf/wechatInit.jspf"%>
    <!-- ------------------以上为添加内容--------------------------------------- -->
</head>
<body>
<header>
    <img class="boder" src="${contextPath}/image/messageAdd1.png">
    <div>
        <img src="${contextPath}/image/rank%20(2).png">
         <p>项目排行TOP10</p>
    </div>
    <img class="boder" src="${contextPath}/image/messageAdd.png">
</header>
<article>
    <img class="boder" src="${contextPath}/image/messageAdd1.png">
    <div class="content">
        <div class="bao">
            <ul class="contentUl">
                <c:forEach var="rank" items="${ranks}">
                	<li class="son" onclick="location.href='${contextPath}/ground/projectDetail?projectId=${rank.projectId}&&showDetailHeader=2'">
                	<c:choose>
						<c:when test="${rank.rank == 1}">
						<div class="left">
							<div class="numBig">
							<span class="T">${rank.rank}</span>
								<img src="${contextPath}/image/rank%20(1).png">
							</div>
						</div>
						</c:when>
						<c:when test="${rank.rank == 2 }">
						<div class="left">
							<div class="numBig">
							<span class="T">${rank.rank}</span>
								<img src="${contextPath}/image/rank%20(3).png">
							</div>
						</div>
						</c:when>
						<c:when test="${rank.rank == 3}">
						<div class="left">
							<div class="numBig">
							<span class="T">${rank.rank}</span>
								<img src="${contextPath}/image/rank%20(4).png">
							</div>
							</div>
						</c:when>
						<c:otherwise>
						<div class="left">
							<div class="numBig">
								 <span class="normal">${rank.rank}</span>
							</div>
						</div>
						</c:otherwise>
					</c:choose>
					<a href="http://sye/ground/projectDetail?projectId=${rank.project.id}"><span style="visibility:hidden" /></a>
                    <div class="font">
                        <p class="home">
                           ${rank.project.name}
                        </p>
                        <p class="classify">
                            <label><spring:message code="project.zone.${rank.project.zone}"/></label>
                            <label><spring:message code="project.business.${rank.project.business}"/></label>
                            <label><spring:message code="project.status.${rank.project.status}"/></label>
                            <img src="${contextPath}/image/rankNext.png">
                        </p>
                        <p class="data">
                            <label style="color:#ffae00;font-size:10px">支持：</label><span><label>${rank.sum}</label>人</span>
                            <label style="color:#ffae00;font-size:10px">负责人：</label><span><label>${rank.project.resPerson}</label></span>
                        </p>
                    </div>
                </li>
               </c:forEach>
            </ul>
        </div>
    </div>
    <img class="boder" src="${contextPath}/image/messageAdd.png">
</article>
<section class="foot-fill"></section>
</body>
</html>