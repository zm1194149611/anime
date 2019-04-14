<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head lang="en">
<%-- <%@ include file="${contextPath}/taglibs.jsp"%>
<%@include file="${contextPath}/jspf/wechatInit.jspf"%> --%>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name='apple-mobile-web-app-capable' content='yes' />
<title>我的互动</title>
	<link href="${contextPath}/css/wordList.css" rel="stylesheet" type="text/css">	
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/js/base.js" type="text/javascript"></script>
    <script src="${contextPath}/js/box.js" type="text/javascript"></script>
    <script src="${contextPath}/js/scroll/TouchLine.js"></script>
    <script src="${contextPath}/js/jquery-2.1.4.min.js"></script>
    <script src="${contextPath}/js/footer.js" type="text/javascript"></script>
    <script src="${contextPath}/js/app.js" type="text/javascript"></script> 
<script type="text/javascript" charset="utf-8">
var isUpdateUser = '${user.interactionUpdate}';
var type = "footerAddTalk";
var contextPath = '${contextPath}';
var userId='${user.id}';
$(function() {
	footer.footerAddTalk(userId);
});
</script>
</head>
<body>
<input id="userId" type="hidden" name="userId" value="${user.id}">
<header>
    <img src="${contextPath}/image/wordList-test.png"> 
    <img  class="write" id="write" src="${contextPath}/image/wordList-add.png">
</header>
<c:forEach varStatus="s" items="${pages.pages}" var="question">
<a style="text-decoration:none" href="${contextPath}/communication/syeQuestionDetail?questionId=${question.questionId}&userId=${user.id}">
<section>
    <div class="wordList-time">
        <p>${question.standbyThree.substring(5)}</p>
    </div>
    <div class="wordList-details">
        <p class="wordList-word">${question.questionContent}</p>
        <div class="wordList-Img">
        <c:if test="${question.imgOne !='' && question.imgOne !=null}">
        <img class="wordList-wordImg" src="${question.imgOne}" onclick="previewImg('${question.imgOne}','${question.imgTwo}','${question.imgThree}','${question.imgFour}')">
         </c:if>
         <c:if test="${question.imgTwo !='' && question.imgTwo !=null}">
        <img class="wordList-wordImg" src="${question.imgTwo}" onclick="previewImg('${question.imgOne}','${question.imgTwo}','${question.imgThree}','${question.imgFour}')">
         </c:if>
         <c:if test="${question.imgThree !='' && question.imgThree !=null}">
        <img class="wordList-wordImg" src="${question.imgThree}" onclick="previewImg('${question.imgOne}','${question.imgTwo}','${question.imgThree}','${question.imgFour}')">
         </c:if>
         <c:if test="${question.imgFour !='' && question.imgFour !=null}">
        <img class="wordList-wordImg" src="${question.imgFour}" onclick="previewImg('${question.imgOne}','${squestion.imgTwo}','${question.imgThree}','${question.imgFour}')">
         </c:if>
        </div>
        <div class="wordList-info">
	        <c:if test="${question.thumbUpCount == '' || question.thumbUpCount == null}">
	        <span>(<label>0</label>)</span>
	        </c:if>
	        <a href="javascript:void(0);" onclick="deleteActivity(this,'${question.questionId}','${user.id }')" class="deleteActivity" id="deleteActivity">删除</a>
	        <c:if test="${question.thumbUpCount != null && question.thumbUpCount != ''}">
	        <span>(<label>${question.thumbUpCount}</label>)</span>
	        </c:if>           
            <img src="${contextPath}/image/wordList-good.png">
            <c:if test="${question.questionReply == null || question.questionReply == '0'}">
            <span>(<label>0</label>)</span>
            </c:if>
            <c:if test="${question.questionReply != null}">
            <span>(<label>${question.questionReply.size()}</label>)</span>
            </c:if>
            
            <img src="${contextPath}/image/wordList-word.png">
        </div>
        <div class='wordList-like'>
			<p>
				<c:if test="${question.syeReplyThumbUp.size() >0 && question.syeReplyThumbUp.size() <10}">
					<img src="${contextPath}/image/doVoteUp.png">
						<c:forEach varStatus="s" items="${question.syeReplyThumbUp}" var="syeReplyThumbUp">
							<c:if test="${s.index+1<question.syeReplyThumbUp.size()}">
								<a href="javascript:void()" onclick="goToVoterPage('${syeReplyThumbUp.standbyOne}');return false">${syeReplyThumbUp.standbyTwo}、</a>
							</c:if>
							<c:if test="${s.index+1==question.syeReplyThumbUp.size()}">
								<a href="javascript:void()" onclick="goToVoterPage('${syeReplyThumbUp.standbyOne}');return false">${syeReplyThumbUp.standbyTwo}</a>
							</c:if>
						</c:forEach>
					<a href="${contextPath}/communication/thumbUpDetailList?questionId=${question.questionId}&userId=${user.id}">觉得很赞</a>
				</c:if>
				<c:if test="${question.syeReplyThumbUp.size() ==10}">
					<c:forEach varStatus="s" items="${question.syeReplyThumbUp}" var="syeReplyThumbUp">
						<c:if test="${s.index+1<question.syeReplyThumbUp.size()}">
							<a href="javascript:void()" onclick="goToVoterPage('${syeReplyThumbUp.standbyOne}');return false">${syeReplyThumbUp.standbyTwo}、</a>
						</c:if>
						<c:if test="${s.index+1==10}">
							<a href="javascript:void()" onclick="goToVoterPage('${syeReplyThumbUp.standbyOne}');return false">${syeReplyThumbUp.standbyTwo}</a>
						</c:if>
					</c:forEach>
					<a href="${contextPath}/communication/thumbUpDetailList?questionId=${question.questionId}&userId=${user.id}">等${question.thumbUpCount}人觉得很赞</a>
				</c:if>
			</p>
		</div>
    </div> 
    <div class="fill"></div>
</section>
      </a> 
</c:forEach>
<div class="foot-fill"></div>   
</body>
<script>
window.onload=function(){	
	var userId=document.getElementById('userId').value;
	picNew();
	timeHide();
    var write=document.getElementById('write');
    write.onclick= function () {
    	$.ajax({
    		url:"${contextPath}/communication/judgeUser",
    		data:{"id":userId},
            type:"post",
            dataType:"json",
            success:function(data){       	          	
            	if(data==null){
            		Box.prompt("您还没登录，请先登录！","${contextPath}/pub/login");
            		return;
            	}
            	if(data.certification==""){             		
            		Box.prompt("请完善信息！","${contextPath}/user/homecenter?userId="+userId);
            	}else{
            		window.open("${contextPath}/communication/writeByUser?userId="+userId,"_self");
            	}
            },
            error:function(){
            }
        });	       
    }  
};

function picNew(){
    var picS = document.getElementsByClassName("wordList-Img");
    if(picS.length == 0)return false;
    for(i=0 ; i<=picS.length-1;i++){
    	var pic = document.getElementsByClassName("wordList-Img")[i];
    	var img = pic.getElementsByTagName("img");
        var num = img.length;
        if(num==1){
        	className(pic,"one");
        }else{
        	className(pic,"other")
        }
    }
    function className(pic,classNum){
        var str = "wordList-Img "+classNum;
        pic.setAttribute("class",str);
    }
}

function previewImg(img1,img2,img3,img4) {
	var imgsArray = [];
	if(img1&&img1.length>1){
		imgsArray.push(img1);
	}
	if(img2&&img2.length>1){
		imgsArray.push(img2);
	}
	if(img3&&img3.length>1){
		imgsArray.push(img3);
	}
	if(img4&&img4.length>1){
		imgsArray.push(img4);
	}
	if(imgsArray.length<1){
		return;
	}
	wx.previewImage({
	    current: imgsArray[0], // 当前显示图片的http链接
	    urls: imgsArray // 需要预览的图片http链接列表
	});
};

function timeHide(){
    var wordtime = document.getElementsByClassName("wordList-time");
    if(wordtime.length == 0)return false;
    for(i=1 ; i<wordtime.length-1;i++){
		if(wordtime[i-1].firstChild.nextSibling.innerHTML==wordtime[i].firstChild.nextSibling.innerHTML){
			wordtime[i].firstChild.nextSibling.style.display='none';
		}
    }
}
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
/* 跳转个人问题展示界面  */
function peopleByActivity(mark,userId,certification){
	var url ="";
	if(mark == "write"){
		url += '${contextPath}/communication/writeByUser?userId='+userId;
	}
	if(userId == null || userId ==""){
		Box.prompt("您还没登录，请先登录！","${contextPath}/pub/login");
		return;
	}
	if(certification == ""){
		Box.prompt("请完善信息！","${contextPath}/user/homecenter?userId="+userId);
	}else{
		window.open(url,"_self");
	}
}
//删除自己的话题
function deleteActivity(vote,id,userId){
	Box.confirm("是否删除该话题！",0,function(){
		$.ajax({
			url:'${contextPath}/communication/deleteActivity',
			type:"get",
			dataType:'json',
			data:{questionId:id,userId:userId},
			success:function(data){
				if(data){
					$(vote).parent().parent().parent().remove();
				} else{
					
					Box.autoClose('删除失败！');
				}
			},
			error:function(data){
				Box.autoClose('系统错误10000！');				}						
		});
		
	});
}
</script>
</html>