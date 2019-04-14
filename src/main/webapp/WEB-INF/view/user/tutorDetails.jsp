<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>导师详情</title>
    <link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/tutorDetails.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/pro-footPrint.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/pointPeopelList.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/pointPeopelDetails.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/js/box.js" type="text/javascript"></script>
    <script src="${contextPath}/js/jquery.js" type="text/javascript"></script>
    <script src="${contextPath}/js/footer.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8">
    var contextPath = '${contextPath}';
    var userId='${userId}';
    var domain = '${domainName}';
    var isUpdateUser = '${isUpdateUser}';
    var type = "footerAddSubMenu";
        var ballX1=0;
        var directX1=1;
        function ballMove1(a,b){
            var kuang=document.getElementById(a);
            var qiu=document.getElementById(b);
            ballX1=ballX1+directX1;
            qiu.style.left=ballX1+'px';
            if(ballX1+qiu.offsetWidth>=kuang.offsetWidth){
                directX1=-1;
            }
            if(ballX1<=0){
                directX1=1;
            }
        }
        var ballX2=0;
        var ballY2=0;
        var directX2=1;
        var directY2=1;
        function ballMove2(a,b){
            var kuang=document.getElementById(a);
            var qiu=document.getElementById(b);
            ballX2=ballX2+directX2;
            ballY2=ballY2+directY2;
            qiu.style.left=ballX2+'px';
            qiu.style.bottom=ballY2+'px';
            if(ballX2+qiu.offsetWidth>=kuang.offsetWidth ||ballX2<=0){
                directX2=-directX2;
            }
            if(ballY2+qiu.offsetHeight>=kuang.offsetHeight || ballY2<=0){
                directY2=-directY2;
            }
        }
        var ballX3=0;
        var ballY3=0;
        var directX3=1;
        var directY3=1;
        function ballMove3(a,b){
            var kuang=document.getElementById(a);
            var qiu=document.getElementById(b);
            ballX3=ballX3+directX3;
            ballY3=ballY3+directY3;
            qiu.style.bottom=ballY3+'px';
            qiu.style.right=ballX3+'px';
            if(ballX3+qiu.offsetWidth>=kuang.offsetWidth ||ballX3<=0){
                directX3=-directX3;
            }
            if(ballY3+qiu.offsetHeight>=kuang.offsetHeight || ballY3<=0){
                directY3=-directY3;
            }
        }
        var ballX4=0;
        var directX4=1;
        function ballMove4(a,b){
            var kuang=document.getElementById(a);
            var qiu=document.getElementById(b);
            ballX4=ballX4+directX4;
            qiu.style.right=ballX4+'px';
            if(ballX4+qiu.offsetWidth>=kuang.offsetWidth){
                directX4=-1;
            }
            if(ballX1<=0){
                directX4=1;
            }
        }
        setInterval("ballMove1(a,b)",100);
        setInterval("ballMove2(c,d)",100);
        setInterval("ballMove3(e,f)",100);
        setInterval("ballMove4(g,h)",100);
        var a='div1';
        var b='div2';
        var c='div3';
        var d='div4';
        var e='div5';
        var f='div6';
        var g='div7';
        var h='div8';
        function loadList(isAppend,name,value){
    		var url = "${contextPath}/pubUser/queryUserTrackList?userId=${tutorDetail.id}"; 
    		$.get(url,function(data,status){
    		    $("#tracking-section").html(data);
    		});
    	}
       
        $(function(){
    		loadList(true);
    		footer.footerAddSubMenu();
    	});
        function doVoteUpDetail(vote,userid)
        {
        	if(userId.indexOf("999-")!=-1)
    		{
    			Box.prompt("您还未登录，请先登录！");
    			return ;
    		}
        	var url = "${contextPath}/user/doVoteUp"; 
    		 $.ajax( {
    	 	        type : "post",  
    	 	        url : url,  
    	 	        data:{userid:userid},
    	 	        dataType:"json",  
    	 	        success : function(data) {  
    	 	            if(data.exceptionCode){
    	 	            	Box.autoClose(data.exceptionMsg);
    	 	            	return ;
    	 	            }
    	 	            else
    	 	            {
    	 	              $("#voteCount").html(parseInt($("#voteCount").html())+1);
    	 	            $("#addVoter").remove();
    	 	            $("#oldVoter").html(data.result);
    	 	              Box.autoClose("点赞成功！");
    	 	              vote.style.opacity=0.5;
    	 	            }
    	 	        },
    	 	        error:function(data){
    	 	        	Box.autoClose("保存失败，请检查网络");
    	 	        }
    	 		}); 
        }
        function doUpVote(obj,id)
    	{
    		var url = "${contextPath}/user/doUserTrackVote"; 
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
    	 	            $(obj).parent().next().children().find("label").html(data.result);
    	 	             Box.autoClose("点赞成功！");
    	 	            }
    	 	        },
    	 	        error:function(data){
    	 	        	Box.autoClose("保存失败，请检查网络");
    	 	        }
    	 		}); 
    	}
        /*预览导师足迹图片by zm*/
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
		function shareOk()
		{
			var data={tutorId:'${tutorDetail.id}'};
	    	$.ajax({
	    		url:'${contextPath}/pubUser/shareMentorOk',
	    		type:'post',
	    		dataType:'json',
	    		data:data,
	    		success:function(data){
					if(data.exceptionCode){
						Box.autoClose(data.exceptionMsg);
					}else{
					   Box.autoClose("分享成功");		  
					   $("#shareCount").html(parseInt($("#shareCount").html())+1)
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
	<style>
	#supportBtn img{
	    border:0 !important;
	}
	
	</style>
</head>
<body>
<header>
    <c:if test="${not empty tutorDetail.skills && fn:length(fn:split(tutorDetail.skills,','))!=2}">
		<c:forEach items="${fn:split(tutorDetail.skills,',')}" var="item" varStatus="status">
			<div id="div${status.index +status.index+1}">
				<div id="div${status.index +status.index + 2}">
					<span><spring:message code="project.mentor.skills${item}" /></span>
				</div>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${not empty tutorDetail.skills && fn:length(fn:split(tutorDetail.skills,','))==2}">
		<c:forEach items="${fn:split(tutorDetail.skills,',')}" var="item" varStatus="status">
			<div id="div${status.index +status.index+3}">
				<div id="div${status.index +status.index + 4}">
					<span><spring:message code="project.mentor.skills${item}" /></span>
				</div>
			</div>
		</c:forEach>
	</c:if>
    <div class="picture">
        <c:set var="headImgUrl" value="${contextPath}/pics/auditImg/${tutorDetail.rheadimg}"/>
        <c:if test='${tutorDetail.rheadimg==null||""==tutorDetail.rheadimg}'>
	      <c:set var="headImgUrl" value="${contextPath}/image/sye-headImg.jpg"/>
        </c:if>
        <img class="my1" src='${headImgUrl}'/>
        <c:if test="${fn:indexOf(tutorDetail.role,'1')==0}">
            <img class="dao1" src="${contextPath}/image/mycenter-dao.png">
	    </c:if>
	    <c:if test="${fn:indexOf(tutorDetail.role,'4')==0}">
            <img class="dao1" src="${contextPath}/image/mycenter-daoH.png">
	    </c:if>
    </div>
    <div class="introduce">
        <span class="myname">${tutorDetail.userName}</span>
			<c:choose>
				<c:when test="${fn:indexOf(tutorDetail.level,'1')==0}">
					<img src="${contextPath}/image/v1.png">
				</c:when>
				<c:when test="${fn:indexOf(tutorDetail.level,'2')==0}">
					<img src="${contextPath}/image/v2.png">
				</c:when>
				<c:when test="${fn:indexOf(tutorDetail.level,'3')==0}">
					<img src="${contextPath}/image/v3.png">
				</c:when>
				<c:when test="${fn:indexOf(tutorDetail.level,'4')==0}">
					<img src="${contextPath}/image/v4.png">
				</c:when>
				<c:when test="${fn:indexOf(tutorDetail.level,'5')==0}">
					<img src="${contextPath}/image/v5.png">
				</c:when>
				<c:otherwise>
					<img src="${contextPath}/image/v6.png">
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test='${tutorDetail.certification!=null&&""!=tutorDetail.certification}'>
					<img src="${contextPath}/image/realname.png">
				</c:when>
			</c:choose>
			<c:choose>
				<c:when
					test="${fn:indexOf(tutorDetail.role,'1')==0||fn:indexOf(tutorDetail.role,'0')==0}">
					<img src="${contextPath}/image/SYE.png">
				</c:when>
			</c:choose>
		</div>
    <div class="baseMessage">
        <span><img class="first-where" src="${contextPath}/image/mycenter-where.png"><label><c:if test='${fn:length(tutorDetail.zone)>0}'><spring:message code="project.zone.zone${tutorDetail.zone}"/></c:if></label></span>
        <span><img src="${contextPath}/image/mycenter-position.png"><label><c:if test='${fn:length(tutorDetail.position)>0 && fn:length(tutorDetail.position)<8}'>${tutorDetail.position}</c:if><c:if test='${fn:length(tutorDetail.position)>7}'>${tutorDetail.position.substring(0,6)}...</c:if></label></span>
        <span><img src="${contextPath}/image/mycenter-name.png"><label><c:if test='${fn:length(tutorDetail.nickName)>0 && fn:length(tutorDetail.nickName)<11 && fn:length(tutorDetail.position)<4}'>${tutorDetail.nickName}</c:if><c:if test='${fn:length(tutorDetail.nickName)>0 && fn:length(tutorDetail.nickName)>10 && fn:length(tutorDetail.position)<4}'>${tutorDetail.nickName.substring(0,9)}...</c:if><c:if test='${fn:length(tutorDetail.position)>3 && fn:length(tutorDetail.nickName)<7}'>${tutorDetail.nickName}</c:if><c:if test='${fn:length(tutorDetail.position)>3 && fn:length(tutorDetail.nickName)>6}'>${tutorDetail.nickName.substring(0,5)}...</c:if></label></span>        
    </div>
		<c:choose>
			<c:when test='${tutorDetail.motto!=null||fn:length(tutorDetail.motto)>0}'>				
				<span class="manifesto">${tutorDetail.motto}</span>
			</c:when>
			<c:otherwise>
				<span class="manifesto">帮扶一个青年，成就一个未来的企业家</span>
			</c:otherwise>
		</c:choose>		
</header>
<article>
    <ul class="information">
        <li>
            <p>浏览</p>
            <span>${tutorDetail.browsePoint}次</span>
        </li>
        <li class="middle1">
            <p>服务时长</p>
            <span id="voteCount">${tutorDetail.lengthOfService}小时</span>
        </li>
        <li class="middle">
            <p>分享转发</p>
            <span id="voteCount">${tutorDetail.popPoint}次</span>
        </li>
        <li>
            <p>点赞</p>
            <span id="shareCount">${tutorDetail.sharePoint}次</span>
        </li>
    </ul>
    <div class="pointPeopelDetails" >
        <p><img src="${contextPath}/image/doVoteUp.png">
        <span id="oldVoter">
        <c:forEach items="${voteUsers.list }" var="MentorVote" varStatus="i">
        	<c:if test="${fn:length(voteUsers.list)>i.count }">
        	<a href="javascript:;" onclick="goToVoterPage('${MentorVote.voter_id}')">${MentorVote.nickName }</a>、
        	</c:if>
        	<c:if test="${fn:length(voteUsers.list)<=i.count}">
        	<a href="javascript:;" onclick="goToVoterPage('${MentorVote.voter_id}')">${MentorVote.nickName }</a>
        	</c:if>
        </c:forEach>
        </span>
        <c:if test="${voteUsers.totalSize>10 }">
        	<span id="addVoter"><a href="${contextPath }/pubUser/voteUserList?id=${tutorDetail.id }&type=mentor">等${voteUsers.totalSize }人</a>觉得赞</span>
        </c:if>
        <c:if test="${voteUsers.totalSize<=10&&voteUsers.totalSize>=0 }">
        	<span id="addVoter">觉得赞</span>
        </c:if>
        </p>
    </div>
    <section class="section">
        <div class="section-head">
            <img class="shu" src="${contextPath}/image/footprint-shu.png">
            <label class="tou">单位名称</label>
        </div>
        <div class="my-details">
           <c:if test='${tutorDetail.companyName!=null&&tutorDetail.companyName!=""}'>
            <c:forEach items="${fn:split(tutorDetail.companyName,',')}" var="item" varStatus="status">
              <%--  <p class="honor">${item}</p> --%>
               <div class="word"><p class="honor">${item}</p></div>
           </c:forEach>
           </c:if>
        </div>
    </section>
    <section class="section">
        <div class="section-head">
            <img class="shu" src="${contextPath}/image/footprint-shu.png">
            <label class="tou">社会职务</label>
        </div>
        <div class="my-details">
           <c:choose>
			<c:when test='${tutorDetail.rank!=null&&tutorDetail.rank!=""}'>				
				<c:forEach items="${fn:split(tutorDetail.rank,',')}" var="item" varStatus="status">
                   <div class="word">
                       <img src="${contextPath}/image/head.png">
                       <p class="honor"><spring:message code="${item}"/></p>
                   </div>
               </c:forEach>
			</c:when>
			<c:otherwise>
			    <div class="word">
                   <img src="${contextPath}/image/head.png">
                   <p class="honor">SYE创业导师</p>
                </div>
			</c:otherwise>
		</c:choose>	
        </div>
    </section>
    <section class="section">
        <div class="section-head">
            <img class="shu" src="${contextPath}/image/footprint-shu.png">
            <label class="tou">导师类型</label>
        </div>
        <div class="my-details mold">
          <c:if test='${tutorDetail.mentortype!=null&&tutorDetail.mentortype!=""}'>
			  <c:forEach items="${fn:split(tutorDetail.mentortype,',')}" var="item" varStatus="status">
					<span><spring:message code="project.mentor.type${item}" /></span>
			 </c:forEach>
		  </c:if>
        </div>
    </section>
    <section class="section">
        <div class="section-head">
            <img class="shu" src="${contextPath}/image/footprint-shu.png">
            <label class="tou">专业技术</label>
        </div>
        <div class="my-details skill">
        <c:if test='${tutorDetail.skills!=null&&tutorDetail.skills!=""}'>
            <c:forEach items="${fn:split(tutorDetail.skills,',')}" var="item" varStatus="status">
               <span><spring:message code="project.mentor.skills${item}"/></span>
            </c:forEach>
         </c:if>
        </div>
    </section>
    <section class="section">
        <div class="section-head">
            <img class="shu" src="${contextPath}/image/footprint-shu.png">
            <label class="tou">兴趣爱好</label>
        </div>
        <div class="my-details like">
         <c:if test='${tutorDetail.hobby!=null&&tutorDetail.hobby!=""}'>
         <c:forEach items="${fn:split(tutorDetail.hobby,',')}" var="item" varStatus="status">
               <span><spring:message code="project.mentor.hobby${item}"/></span>
            </c:forEach>
          </c:if>
        </div>
    </section>
    <section class="section">
        <div class="section-head">
            <img class="shu" src="${contextPath}/image/footprint-shu.png">
            <label class="tou">导师风采</label>
        </div>
        <div class="my-details books">
            <c:forEach items="${fn:split(tutorDetail.writtenbook,',')}" var="item" varStatus="status">
               <label class="book">${item}</label>
            </c:forEach>
        </div>
    </section>
    <section class="section">
        <div class="section-head">
            <img class="shu" src="${contextPath}/image/footprint-shu.png">
            <label class="tou">帮扶项目</label>
        </div>
        <c:if test='${project!=null}'>
       <div class="content" onclick="location.href='${contextPath}/ground/projectDetail?projectId=${project.id}&&showDetailHeader=${showDetailHeader}'">
     <div class="contentHead">
         <p class="name">${project.name}</p>
         <img src="${contextPath}/image/man4.jpg"><span><spring:message code="project.zone.${project.zone}" /></span>
         <img src="${contextPath}/image/man3.jpg"><span><spring:message code="project.business.${project.business}"/></span>
         <img src="${contextPath}/image/man2.jpg"><span><spring:message code="project.status.${project.status}" /></span>
         <c:if test="${project.passTime>0&&!project.passed}"><a href="#">修改</a></c:if>
     </div>
     <div class="contentBody">
         <img class="indexPic" src="${contextPath}/pics/${project.indexPic}">
         <div class="font">
             <p class="projIntroduce">${project.projIntroduce}</p>
             <div>
               <img src="${contextPath}/image/man6.jpg"><span>更新时间：${fn:split(project.commitDate," ")[0]}</span>
             </div>
         </div>       
     </div>
     </c:if>
 </div>
    </section>
    <section class="section">
        <div class="section-head">
            <img class="shu" src="${contextPath}/image/footprint-shu.png">
            <label class="tou">我们的足迹</label>
        </div>
        <article id="tracking-section"></article>       
    </section>
    <div class="foot-fill"></div>
</article>
<img class="vote-detail" src="${contextPath}/image/vote-detail.png" onclick="doVoteUpDetail(this,'${tutorDetail.id}')">
<script>
/*跳转到点赞人的页面*/
function goToVoterPage(userId){
	$.ajax({
		url:"${contextPath}/pubUser/getVoterRoleByUserId",
		type:"post",
		dataType:'json',
		data:{"userId":userId},
		success:function(data){
			if(data.exceptionCode){
				Box.autoClose(data.exceptionMsg);
			}else{
				if(data.result=="you"){
					Box.autoClose("该用户还未成为导师或创业者");
					return;
					
				}else if(data.result=="chuang"){
					$.ajax({
						url:"${contextPath}/pubUser/getVoterProjectByUserId",
						type:"post",
						dataType:'json',
						data:{"userId":userId},
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
</script>
</body>
</html>