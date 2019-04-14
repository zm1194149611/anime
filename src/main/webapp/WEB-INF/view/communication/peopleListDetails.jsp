<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name='apple-mobile-web-app-capable' content='yes' />
<title>点赞人列表</title>
	<link href="${contextPath}/css/peopleListDetails.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/js/base.js" type="text/javascript"></script>
    <script src="${contextPath}/js/box.js" type="text/javascript"></script>
    <script src="${contextPath}/js/jquery-2.1.4.min.js"></script>
    <script src="${contextPath}/js/scroll/TouchLine.js"></script>
    <script src="${contextPath}/js/footer.js" type="text/javascript"></script>
    <script src="${contextPath}/js/app.js" type="text/javascript"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript" charset="utf-8">
var isUpdateUser = '${user.interactionUpdate}';
var type = "footerAddTalk";
var contextPath = '${contextPath}';
var userId='${userId}';
window.onload=function(){		
	var userId=document.getElementById('userId').value;	
	footer.footerAddTalk(userId);
}; 
</script>
</head>
<body>
<input id="userId" type="hidden" name="userId" value="${userId}">
	<c:forEach varStatus="s" items="${pages.pages.list}"
		var="syeReplyThumbUp">
		<section>
		<a href="javascript:void()" onclick="goToVoterPage('${syeReplyThumbUp.standbyOne}')">
		<div class="peopleList">
			<div class="peopleList-left">
				<c:if test="${syeReplyThumbUp.user.headImgUrl =='' || syeReplyThumbUp.user.headImgUrl ==null}">
					<img class="peopleList-peopleImg" src="${contextPath}/image/sye-headImg.png">
					
				</c:if>
				<c:if test="${syeReplyThumbUp.user.headImgUrl !='' && syeReplyThumbUp.user.headImgUrl !=null}">
					<img class="peopleList-peopleImg" src="${syeReplyThumbUp.user.headImgUrl}">
				</c:if>
				<c:if test="${syeReplyThumbUp.user.role==0}">
					<img class="peopleList-peopleDao"
						src="${contextPath}/image/mycenter-chuang.png">
				</c:if>
				<c:if test="${syeReplyThumbUp.user.role==1}">
					<img class="peopleList-peopleDao"
						src="${contextPath}/image/mycenter-dao.png">
				</c:if>
				<c:if test="${syeReplyThumbUp.user.role==3}">
					<img class="peopleList-peopleDao"
						src="${contextPath}/image/mycenter-chuangH.png">
				</c:if>
				<c:if test="${syeReplyThumbUp.user.role==4}">
					<img class="peopleList-peopleDao"
						src="${contextPath}/image/mycenter-daoH.png">
				</c:if>
			</div>
			<div class="peopleList-right">
				<c:if test="${syeReplyThumbUp.user.nickName =='' || syeReplyThumbUp.user.nickName ==null}">
					<span>SYE创业四川</span>
				</c:if>
				<c:if test="${syeReplyThumbUp.user.nickName !=''}">
					<span>${syeReplyThumbUp.user.nickName}</span>
				</c:if>
				<c:if test="${syeReplyThumbUp.user.level =='1'}">
					<img src="${contextPath}/image/v1.png">
				</c:if>
				<c:if test="${syeReplyThumbUp.user.level =='2'}">
					<img src="${contextPath}/image/v2.png">
				</c:if>
				<c:if test="${syeReplyThumbUp.user.level =='3'}">
					<img src="${contextPath}/image/v3.png">
				</c:if>
				<c:if test="${syeReplyThumbUp.user.level =='4'}">
					<img src="${contextPath}/image/v4.png">
				</c:if>
				<c:if test="${syeReplyThumbUp.user.level =='5'}">
					<img src="${contextPath}/image/v5.png">
				</c:if>
				<c:if test="${syeReplyThumbUp.user.level =='6'}">
					<img src="${contextPath}/image/v6.png">
				</c:if> 

				<c:if test="${syeReplyThumbUp.user.role =='0' || syeReplyThumbUp.user.role =='1' }">
					<img src="${contextPath}/image/SYE.png">
				</c:if>

				<c:if test="${syeReplyThumbUp.user.certification !=''}">
					<img src="${contextPath}/image/realname.png">
				</c:if>
			</div>
			<img class="peopleList-arrow"
				src="${contextPath}/image/mycenter-arrows.png">
		</div>
		</a>
		</section>
	</c:forEach>
	<div class="foot-fill"></div> 
</body>
<script>
/*跳转到点赞人的页面*/
		function goToVoterPage(userId){
	$.ajax({
		//判断用户角色
		url:"${contextPath}/pubUser/getVoterRoleByUserId",
		type:"post",
		dataType:'json',
		data:{"userId":userId},
		success:function(data){
			if(data.exceptionCode){
				Box.autoClose(data.exceptionMsg);
			}else{
				//如果是游客
				if(data.result=="you"){
					Box.autoClose("该用户还未成为导师或创业者");
					return;
					
				}else if(data.result=="chuang"){//如果是创业者					
					$.ajax({
						//判断创业者是否有项目，如果有项目取最新一个项目
						url:"${contextPath}/pubUser/getVoterProjectByUserId",
						type:"post",
						dataType:'json',
						data:{"userId":userId},
						success:function(data){
							//为0表示没有项目
							if(data.result=="0"){
								Box.autoClose("该创业者暂时没有创业项目");
								return;
							}else{
								location.href="${contextPath}/ground/projectDetail?projectId="+data.result+"&userId="+userId;
							}
						}
					});
				}else{//如果是导师
					location.href="${contextPath}/pubUser/tutorDetails?userId="+data.result;
				}
			}
		}
	})
}
</script>
</html>