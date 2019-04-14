<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <meta name='format-detection' content='telephone=no'/>
    <title><spring:message code="project.header.header${showDetailHeader}"/></title>
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/pro_details.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/pro-footPrint.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/pointPeopelList.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/pointPeopelDetails.css" rel="stylesheet" type="text/css">
    <%-- <link href="${contextPath}/css/tutorList.css" rel="stylesheet" type="text/css"> --%>
    <c:set var="projectId" value="${project.id }"/>
     <script src="${contextPath}/js/jquery.js"></script>
    <!--弹出层JS-->
    <script src="${contextPath}/js/box.js"></script>
    <script src="${contextPath}/js/phone.js"></script>
    <!--!end 弹出层JS-->
    <script src="${contextPath}/js/proDetails.js"></script>
    <script src="${contextPath}/js/footer.js" type="text/javascript"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript">
    var openId = '${openId}';
    var support='';
    var contextPath = '${contextPath}';
    var userId='${userId}';
    var domain = '${domainName}';
    var isUpdateUser = '${isUpdateUser}';
    var type = "footerAddSubMenu";
    $(function(){
    	support = document.getElementById("support");
    	footer.footerAddSubMenu();
    });
  	function supportFun()
  	{
	    var supportNum = parseInt(support.innerHTML);
	    support.innerHTML = supportNum+1;
	}
   function ChangeColorByDoVote(changed)
   {
	   var supporting = document.getElementById("supporting");
	   var supportBtn = document.getElementById("supportBtn");
	   if(changed=="1")
	   {  
          supporting.className = "supportingNone";/*投票之后换颜色*/
          supportBtn.style.backgroundColor = "#aaaaaa";/*投票之后换颜色*/
	   }
	  
   }
   
  	function voke(){
  		var data={openId:'${openId}'};
    	$.ajax({
    		url:'${contextPath}/ground/checkSubscribe',
    		type:'post',
    		dataType:'json',
    		data:data,
    		success:function(data){
				if(data.exceptionCode){
					Box.autoClose(data.exceptionMsg);
				}else{
					if(data.result){
						doVote();
					}else{
						/*Box.alert("您尚未关注SYE公众号，点击确定进入关注页面",function(){
						   location.href="http://mp.weixin.qq.com/s?__biz=MzA3MTU2MjI3MA==&mid=400243833&idx=1&sn=62a1da8f6baf593322028138e3f528f6&scene=18&scene=23&srcid=1229umybasdOEtK4wXKG2u2Q#wechat_redirect"
						});*/
						Box.alert("您尚未关注SYE公众号，点击确定进入关注页面");
						location.href="http://mp.weixin.qq.com/s?__biz=MzA3MTU2MjI3MA==&mid=401284503&idx=1&sn=e629ad7caa8fdd5237f8926c116c7120&scene=0&previewkey=J0inPRqrDDJSIRu43UxJ4sNS9bJajjJKzz%2F0By7ITJA%3D#wechat_redirect";
					}
				}
    		},
    		error:function(data){
    			Box.autoClose('提交失败，请检查网络');
    		}
    	});
    	
  	}
  	
    function doVote(){
    	var data={projectId:'${projectId}',openId:openId};
    	if(userId.indexOf("999-")!=-1)
		{
			Box.prompt("您还未登录，请先登录！");
			return ;
		}
    	$.ajax({
    		url:'${contextPath}/vote/doVote',
    		type:'post',
    		dataType:'json',
    		data:data,
    		success:function(data){
    		
				if(data.exceptionCode){
					Box.autoClose(data.exceptionMsg);
				}else{
					supportFun();
					$("#addVoter").remove();
  	 	          $("#oldVoter").html(data.result);
					Box.autoClose("投票成功！每天都可以投票噢！");
			        ChangeColorByDoVote("1");
				}
    		},
    		error:function(data){
    			Box.autoClose('提交失败，请检查网络');
    		}
    	});
    }
    function doUpVote(obj,id)
	{
		var url = "${contextPath}/user/doTrackVote"; 
		if(userId.indexOf("999-")!=-1)
		{
			Box.prompt("您还未登录，请先登录！");
			return ;
		}
		 $.ajax( {
	 	        type : "post",  
	 	        url : url,  
	 	        data:{trackId:id},
	 	        dataType:"json",  
	 	        success : function(data) {  
	 	            if(data.exceptionCode){
	 	            	Box.autoClose(data.exceptionMsg);
	 	            	return ;
	 	            }
	 	            else
	 	            {
	 	             loadList(true);
	 	             Box.autoClose("点赞成功！");
	 	            }
	 	        },
	 	        error:function(data){
	 	        	Box.autoClose("保存失败，请检查网络");
	 	        }
	 		}); 
	}
    function picNew(){
        var picS = document.getElementsByClassName("picNew");
        if(picS.length == 0)return false;
        for(var j=0;j<picS.length;j++){
            var ul = picS[j].getElementsByTagName("ul")[0];
            var lis = ul.getElementsByTagName("li");
            var num = lis.length;

            function className(classNum){
                var str = "picNew "+classNum;
                picS[j].setAttribute("class",str);
            }

            switch (num){
                case 0:return false;
                case 1:className("one") ;break;
                case 2:className("tow") ;break;
                case 3:className("three") ;break;
                default :return false;
            }
        }
    }
    function loadList(isAppend,name,value){
		var url = "${contextPath}/ground/queryPrjTrackList?projectId=${projectId}"; 
		$.get(url,function(data,status){
		    $("div article").html(data);
		});
	}  	
    window.onload=function(){ 
    	ChangeColorByDoVote('${DoVoteColor}'); 
    	picNew();
        suppor();
        loadList(true);
   } 
    
    </script>
    <!-- --------------------以下是添加内容----------------- -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/app.js"></script>
    <script type="text/javascript">
    <%
    java.util.Map<String,String> shareInfo = (java.util.Map<String,String>)request.getAttribute("info");
    shareInfo = shareInfo==null?new java.util.HashMap<String,String>():shareInfo;
	    
    %>
		App.data.wechat.apis = ['onMenuShareAppMessage','previewImage','onMenuShareTimeline'];
		App.data.wechat.API_NAMEs = {'onMenuShareAppMessage':'分享给朋友','previewImage':'预览图片','onMenuShareTimeline':'分享到朋友圈'};
		$(function(){
			wx.ready(function(){
				wx.onMenuShareAppMessage({
				    title: '<%=shareInfo.get("title")%>',
				    desc: '<%=shareInfo.get("desc")%>', 
				    link: '<%=shareInfo.get("link")%>', 
				    imgUrl: '<%=shareInfo.get("imgUrl")%>',
				    type: 'link', 
				    dataUrl: '', 
				    success: function () { 
				    	shareOk();
				    },
				    cancel: function () { 
				    }
				});
				wx.onMenuShareTimeline({
				    title: '<%=shareInfo.get("title")%>',
				    link: '<%=shareInfo.get("link")%>', 
				    imgUrl: '<%=shareInfo.get("imgUrl")%>',
				    type: 'link', 
				    success: function () {
				    	shareOk();
				    },
				    cancel: function () { 
				    }
				});
			});
		});
		var projPicStrs = '${strProStr}';
		var teamPicStrs = '${strTeamStr}';
		var picLinkPrefix = '${contextPath}/pics/'; 
		var previewImgs = {};
		$(function(){
			var projPics = [];
			if(projPicStrs){
				var projPicSufs = projPicStrs.split(',');
				if(projPicSufs&&projPicSufs.length>0){
					for(var i=0;i<projPicSufs.length;i++){
						projPics.push(picLinkPrefix + projPicSufs[i]);
					}
				}
			}
			var teamPics = [];
			if(teamPicStrs){
				var teamPicSufs = teamPicStrs.split(',');
				if(teamPicSufs&&teamPicSufs.length>0){
					for(var i=0;i<teamPicSufs.length;i++){
						teamPics.push(picLinkPrefix + teamPicSufs[i]);
					}
				}
			}
			previewImgs.proj = projPics;
			previewImgs.team = teamPics;
		});
		function previewImgOne(picFlag) {
			var pics = previewImgs[picFlag];
			if(!pics||pics.length<1){
				return;
			}
			wx.previewImage({
			    current: pics[0], // 当前显示图片的http链接
			    urls: pics // 需要预览的图片http链接列表
			});
		};
		function shareOk()
		{
			var data={projectId:'${projectId}'};
	    	$.ajax({
	    		url:'${contextPath}/ground/sharePrjOk',
	    		type:'post',
	    		dataType:'json',
	    		data:data,
	    		success:function(data){
					if(data.exceptionCode){
						Box.autoClose(data.exceptionMsg);
					}else{
					   Box.autoClose("分享成功")		  
					   $("#share").html(parseInt($("#share").html())+1)
					}
	    		},
	    		error:function(data){
	    			Box.autoClose('提交失败，请检查网络');
	    		}
	    	});
		}
	</script>
	<%@include file="../jspf/wechatInit.jspf"%>
	<!-- --------------以上是添加内容------------------ -->
    <script type="text/javascript">
    function previewImgs(parentDom) {
    	var imgs = $(parentDom).children('img');
    	var pics = [];
    	if(!imgs||imgs==''||imgs.length<1){
    		return;
    	}
    	for(var i=0;i<imgs.length;i++){
    		pics.push(imgs[i].src);
    	}
		wx.previewImage({
		    current: pics[0], // 当前显示图片的http链接
		    urls: pics // 需要预览的图片http链接列表
		});
	};
	/*跳转到点赞人的页面*/
	function goToVoterPageByOpenId(openId){
		$.ajax({
			url:"${contextPath}/pubUser/getVoterRoleByOpenId",
			type:"post",
			dataType:'json',
			data:{"openId":openId},
			success:function(data){
				if(data.exceptionCode){
					Box.autoClose(data.exceptionMsg);
				}else{
					if(data.result=="you"){
						Box.autoClose("该用户还未成为导师或创业者");
						return;
						
					}else if(data.result=="chuang"){
						$.ajax({
							url:"${contextPath}/pubUser/getVoterProjectByOpenId",
							type:"post",
							dataType:'json',
							data:{"openId":openId},
							success:function(data){
								if(data.result=="0"){
									Box.autoClose("该创业者暂时没有创业项目");
									return;
								}else{
									location.href="${contextPath}/ground/projectDetail?projectId="+data.result;
								}
							}
						});
					}else{
						location.href="${contextPath}/pubUser/tutorDetails?userId="+data.result;
					}
				}
			}
		})
		
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
									location.href="${contextPath}/ground/projectDetail?projectId="+data.result;
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
	/*预览项目足迹图片by zm*/
	function previewImg(i,imgs){
		var imgArray = [];
		if(imgs.substring(imgs.length-1)==","){
			imgs = imgs.substring(0,imgs.length-1);
		}
		imgArray = imgs.split(",");
		if(imgArray.length<1){
			return;
		}
		$.each(imgArray,function(index){
			imgArray[index] = "${contextPath}/pics/"+imgArray[index];
		})
		wx.previewImage({
		    current: imgArray[i], // 当前显示图片的http链接
		    urls: imgArray // 需要预览的图片http链接列表
		});
	}
    </script>
	<style>
	#supportBtn img{
	    border:0 !important;
	}
	.pointPeopelDetails{
	   width: 90% !important;
	   padding: 0 5% !important;
	}
	@media (max-height:600px){
	.pointPeopelDetails{
	    margin-top: 14px !important;
	}
}
@media (min-height:600px){
	.pointPeopelDetails{
	    margin-top: 18px !important;
	}
}
	</style>
</head>
<body>
<header>
    <div class="blackLayer">
        <img id="proPic" src="${contextPath}/pics/${project.logo}">
        <p id="proName">${project.name}</p>
        <p class="proMan">负责人：<label>${project.resPerson}</label></p>
        <p class="proData">
            <span>支持数：<label id="support">${project.likeCount}</label></span>
            <span>浏览量：<label id="scan">${project.visitCount}</label></span>
            <span>分享数：<label id="share">${project.shareCount}</label></span>
        </p>
        
        <p>
            <span id="supporting" onclick="voke();ChangeColorByDoVote()"><img src="${contextPath}/image/pro_%20details3.png">投票</span>
            <span id="contact"><img src="${contextPath}/image/pro_%20details4.jpg">电话</span>
        </p>
    </div>
</header>
<article>
	<div class="float">
	    <div class="fixedBtn" id="supportBtn" onclick="voke();ChangeColorByDoVote()">
	        <img src="${contextPath}/image/pro_%20details5.png">
	    </div>
    </div>
    <div class="pointPeopelDetails">
        <p><img src="${contextPath}/image/doVoteUp.png">
        <span id="oldVoter">
        <c:forEach items="${voteUsers.list }" var="vote" varStatus="i">
        	<c:if test="${fn:length(voteUsers.list)>i.count }">
        	<a href="javascript:;" onclick="goToVoterPageByOpenId('${vote.openId}')">${vote.nickName }</a>、
        	</c:if>
        	<c:if test="${fn:length(voteUsers.list)<=i.count}">
        	<a href="javascript:;" onclick="goToVoterPageByOpenId('${vote.openId}')">${vote.nickName }</a>
        	</c:if>
        </c:forEach>
        </span>
        <c:if test="${voteUsers.totalSize>10 }">
        	<span id="addVoter"><a href="${contextPath }/pubUser/voteUserList?id=${project.id }&type='prj'">等${voteUsers.totalSize }人</a>觉得赞</span>
        </c:if>
        <c:if test="${voteUsers.totalSize<=10&&voteUsers.totalSize>0 }">
        	<span id="addVoter">觉得赞</span>
        </c:if>
        </p>
    </div>
    <div class="font bgLine">
	    <p class="titleImg">
		    <img src="${contextPath}/image/footprint-shu.png">
		    <span>项目标签</span>
	    </p>
    	<p class="proMessage"><!-- 添加了名称 -->
            
            <span class="proMessage_industry"><label><spring:message code="project.business.${project.business}"/></label></span>
            <span class="proMessage_area"><label><spring:message code="project.zone.${project.zone}" /></label></span>
            <span class="proMessage_state"><label><spring:message code="project.status.${project.status}" /></label></span>
        </p>
    </div>
    <div class="font bgLine">
<%--         <c:choose> --%>
<%-- 		    <c:when test="${fn:indexOf(project.passed,'true')==0}"> --%>
<%-- 			    <img class="certification" src="${contextPath}/image/Certification.png"> --%>
<%-- 		    </c:when> --%>
<%--         </c:choose> --%>
        <p class="titleImg">
		    <img src="${contextPath}/image/footprint-shu.png">
		    <span>项目简介</span>
	    </p>
        <p class="textContent" id="projIntroduce">
            ${project.projIntroduce}
        </p>
        <div class="picNew">
            <ul>
                <c:forEach items="${strPro}" var="sr">
            	<li><a href="javascript:previewImgOne('proj');"><img src="${contextPath}/pics/${sr}"></a></li>
            	</c:forEach>
            </ul>
        </div>
        
    </div>
    <div class="font bgLine">
        <p class="titleImg">
            <img src="${contextPath}/image/footprint-shu.png">
            <span>经营状况</span>
        </p>
        <p class="textContent" id="operation">
            ${project.operation}
        </p>
    </div>
    <div class="font bgLine">
        <p class="titleImg">
            <img src="${contextPath}/image/footprint-shu.png">
            <span>团队介绍</span>
        </p>
        <p class="textContent" id="teamIntroduce">
           ${project.teamIntroduce}
        </p>
        
        <div class="picNew">
            <ul>
                <c:forEach items="${strTeam}" var="sr">
            	<li><a href="javascript:previewImgOne('team');"><img src="${contextPath}/pics/${sr}"></a></li>
            	</c:forEach>
            </ul>
        </div>
    </div>
    <div class="font bgLine">
        <p class="titleImg">
            <img src="${contextPath}/image/footprint-shu.png">
            <span>发展规划</span>
        </p>
        <p class="textContent" id="plan">
           ${project.plan}
        </p>
    </div>
    <div class="font bgLine">
        <p class="titleImg">
            <img src="${contextPath}/image/footprint-shu.png">
            <span>辅导导师</span>
        </p>
        <c:if test="${tutor==null}">
            <p class="myTutor">该创业者还没有导师</p>
        </c:if>
        <c:if test="${tutor!=null}">
         <section id="tutor-section">
					<div class="left1">
						<a href="${contextPath}/user/tutorDetails?userId=${tutor.id}">
							<c:choose>
								<c:when
									test='${tutor.rheadimg!=null||fn:length(tutor.rheadimg)>0}'>
									<img src="${contextPath}/pics/auditImg/${tutor.rheadimg}" />
								</c:when>
								<c:otherwise>
									<img src="${contextPath}/image/sye-headImg.jpg" />
								</c:otherwise>
							</c:choose>
						</a>
					</div>
					<div class="right1">
                <div class="introduce">
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
									<c:when
										test='${tutor.certification!=null&&""!=tutor.certification}'>
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
                </div>
                <div class="industry">
                    <c:choose>
                        <c:when test='${tutor.skills!=null||fn:length(tutor.skills)>0}'>
                           <c:forEach items="${fn:split(tutor.skills,',')}" var="item" varStatus="status">
                              <span><spring:message code="project.mentor.skills${item}"/></span>
                           </c:forEach>
                        </c:when>
                        <c:otherwise>
                              <span>无</span>
                        </c:otherwise>
                     </c:choose>
                </div>
                <c:if test='${tutor.rank!=null||fn:length(tutor.rank)>0}'>
                     <c:forEach items="${fn:split(tutor.rank,',')}" var="item" varStatus="status">
                           <div class="word"><img src="${contextPath}/image/head.png"><p><spring:message code="${item}"/></p></div>
                     </c:forEach>
                </c:if>
                <div class="interact">
                    <img src="${contextPath}/image/interaction-good.png">
                </div>
                <div class="statistical">
                    <p><img src="${contextPath}/image/see.png"><span>35</span></p>
                    <p><img src="${contextPath}/image/zan.png"><span>1550</span></p>
                </div>
            </div>
        </c:if>
        </div>
       </section>
    <div class="font bgLine">
        <p class="titleImg">
            <img src="${contextPath}/image/footprint-shu.png">
            <span>项目足迹</span>
            <c:if test='${tutor.id==userId || project.userId==userId}'>
                <a href="${contextPath}/ground/addprjTrack?projectId=${projectId}"><span>添加</span></a>
            </c:if>
        </p>
        <article class="pro-footprint"></article>
    </div>  
</article>
	<div class="font bgLine">
		<div class="code">
			<p>扶持一个青年，成就一个未来企业家</p>
			<img src="${contextPath}/image/sye-code.jpg">
			<span>点击二维码  识别加关注</span>
		</div>
    </div>
<div class="footer-fill"></div>
</body>
</html>
