<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>孵化园详情</title>
    <link href="${contextPath}/css/parkDetails.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/pointPeopelDetails.css" rel="stylesheet" type="text/css" charset="utf-8">
    <script type="text/javascript">
    var contextPath = '${contextPath}';
    var userId='${userId}';
    var domain = '${domainName}';
    var isUpdateUser = '${isUpdateUser}';
    var type = "footerAddSubMenu";
    </script>
    <script src="${contextPath}/js/box.js" type="text/javascript"></script>
    <script src="${contextPath}/js/app.js" type="text/javascript"></script> 
    <script src="${contextPath}/js/jquery.js" type="text/javascript"></script>
    <script src="${contextPath}/js/footer.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8">
    window.onload=function(){
		footer.footerAddSubMenu();
		picNew();
		var write=document.getElementById("write");
		write.onclick=function(){
			window.open("https://www.wenjuan.com/s/AnE7Zb9",'_self');
		}
	};
	 function picNew(){
	        var picS = document.getElementsByClassName("picNew");
	        if(picS.length == 0)return false;
	        for(var j=0;j<picS.length;j++){
	            var image = picS[j].getElementsByTagName("img");
	            var num = image.length;

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
	    };
    function doVoteUpDetail(vote,softParkId)
    {
    	if(userId.indexOf("999-")!=-1)
		{
			Box.prompt("您还未登录，请先登录！");
			return ;
		}
    	var url = "${contextPath}/ground/doVoteUp"; 
		 $.ajax( {
	 	        type : "post",  
	 	        url : url,  
	 	        data:{softParkId:softParkId},
	 	        dataType:"json",  
	 	        success : function(data) {  
	 	            if(data.exceptionCode){
	 	            	Box.autoClose(data.exceptionMsg);
	 	            	return;
	 	            }
	 	            else
	 	            {
	 	              $("#voteCount").html(parseInt($("#voteCount").html())+1)
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
				    	shareOk()
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
			var data={parkId:'${park.softParkId}'};
	    	$.ajax({
	    		url:'${contextPath}/ground/shareParkOk',
	    		type:'post',
	    		dataType:'json',
	    		data:data,
	    		success:function(data){
					if(data.exceptionCode){
						Box.autoClose(data.exceptionMsg);
					}else{
					   Box.autoClose("分享成功")		  
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
<img class="write" id="write" src="${contextPath}/image/incubationpark-apply.png">

<header style="background-image: url(${contextPath}/pics/incubationpark/${park.softParkImgUrl})">
     <div class="stratum"></div>
     <div class="picture">
        <%-- <img class="parkPicture" src="${contextPath}/pics/incubationpark/${park.softParkImgUrl}"> --%> 
    </div> 
    <div class="introduce">
        <span class="myname"><img class="first-where" src="${contextPath}/image/mycenter-where.png">&nbsp;${park.softName}</span>
    </div>
    <div class="baseMessage">
        <span>工位：<label>${park.freeCount}</label>/${park.totalCount}</span>
        <span>单价：<label>${park.stationPrice}</label>/月</span>
        <span>SYE入驻：<label>${park.projectCount}</label>个</span>
    </div>
</header>
<article>
    <ul class="information">
        <li>
            <img src="${contextPath}/image/see.png">
            <span>${park.browseCount}</span>
        </li>
        <li class="middle">
            <img src="${contextPath}/image/zan.png">
            <span id="voteCount">${park.totalVoteUpCount}</span>
        </li>
        <li>
            <img src="${contextPath}/image/fen.png">
            <span id="shareCount">${park.totalShareCount}</span>
        </li>
    </ul>
    <div class="pointPeopelDetails">
    	<p><img src="${contextPath}/image/doVoteUp.png">
		<span id="oldVoter">
		<c:forEach items="${voteUsers.list }" var="vote" varStatus="i">
        	<c:if test="${fn:length(voteUsers.list)>i.count }">
        	<a href="javascript:;" onclick="goToVoterPage('${vote.user_id}')">${vote.nickName }</a>、
        	</c:if>
        	<c:if test="${fn:length(voteUsers.list)<=i.count}">
        	<a href="javascript:;" onclick="goToVoterPage('${vote.user_id}')">${vote.nickName }</a>
        	</c:if>
        </c:forEach>
        </span>
        <c:if test="${voteUsers.totalSize>10 }">
        	<span id="addVoter"><a href="${contextPath }/pubUser/voteUserList?id=${park.softParkId }&type='park'">等${voteUsers.totalSize }人</a>觉得赞</span>
        </c:if>
        <c:if test="${voteUsers.totalSize<=10&&voteUsers.totalSize>0 }">
        	<span id="addVoter">觉得赞</span>
        </c:if>
        </p>
    </div>
    <section>
        <div class="section-head">
            <img class="shu" src="${contextPath}/image/footprint-shu.png">
            <label class="tou">园区介绍</label>
            <c:if test='${park.panorama!=null&&park.panorama!=""}'>
                <a href="${park.panorama}"><img class="icon" id="icon" src="${contextPath}/image/360icon.png"></a>
                <span class="icon-intruduce">全景图</span>
            </c:if>         
        </div>
        <!-- 改 开始 -->
			<div class="describe_work">
				<p class="describe">${park.softParkIntroduce}</p>
				<div class="picNew" onclick="previewImgs(this);">
					<c:if test='${park.parkPicture!=null&&park.parkPicture!=""}'>
						<c:forEach var="img" items="${fn:split(park.parkPicture,',')}">
							<img src="${contextPath}/pics/incubationpark/${img}">
						</c:forEach>
					</c:if>
				</div>
			</div>
			<!-- 改 结束 -->
    </section>
    <section>
        <div class="section-head">
            <img class="shu" src="${contextPath}/image/footprint-shu.png">
            <label class="tou">园区性质</label>
        </div>
        <!-- 改 开始 -->
        <div class="describe_work">
        <p class="describe">${park.softParkCharacter}</p>
        </div>
    </section>
    <section>
        <div class="section-head">
            <img class="shu" src="${contextPath}/image/footprint-shu.png">
            <label class="tou">详细地址</label>
        </div>
        <div class="describe_work">
            <p class="describe">${park.softParkAddress}</p>
        </div>
    </section>
    <section>
        <div class="section-head">
            <img class="shu" src="${contextPath}/image/footprint-shu.png">
            <label class="tou">优惠政策</label>
        </div>
        <div class="describe_work">
		<c:if test='${park.privilegePolicy!=null||fn:length(park.privilegePolicy)>0}'>
			<c:forEach items="${fn:split(park.privilegePolicy,',')}" var="item" varStatus="status">
				<p class="describe">
					<spring:message code="${item}" />
				</p>
			</c:forEach>
		</c:if>
		</div>
    </section>
    <section>
        <div class="section-head">
            <img class="shu" src="${contextPath}/image/footprint-shu.png">
            <label class="tou">行业</label>
        </div>
            <!-- 改 开始 -->
            <div class="my-details industry">
                <c:forEach items="${park.listIndustryLabel}" var="item" varStatus="status">
                     <span><spring:message code="${item.industryLabelName}"/></span>
                </c:forEach>
            </div>
        <!-- 改 结束 -->
    </section>
    <section>
        <div class="section-head">
            <img class="shu" src="${contextPath}/image/footprint-shu.png">
            <label class="tou">园区服务</label>
        </div>
        <!-- 改 开始 -->
        <div class="my-details mold">
            <c:forEach items="${park.listServiceLabel}" var="item" varStatus="status">
                 <span><spring:message code="${item.serviceLabelName}"/></span>
            </c:forEach>
        </div>
        <!-- 改 结束 -->
    </section>
    <section>
        <div class="section-head">
            <img class="shu" src="${contextPath}/image/footprint-shu.png">
            <label class="tou">入驻企业</label>
        </div>
        <div class="my-details enterprise">
            <c:if test='${park.companyName!=null&&park.companyName!=""}'>
            <c:forEach items="${fn:split(park.companyName,',')}" var="item" varStatus="status">
               <c:choose>
		           <c:when test="${status.index<=7}">
			            <a><span><spring:message code="${item}"/></span></a><br>
		           </c:when>
               </c:choose>            
           </c:forEach>
           </c:if>
        </div>
    </section>
    <section>
        <div class="section-head">
            <img class="shu" src="${contextPath}/image/footprint-shu.png">
            <label class="tou">入驻企业要求</label>
        </div>
        <div class="describe_work">
        <c:if test='${park.projectRequire!=null||fn:length(park.projectRequire)>0}'>
                     <c:forEach items="${fn:split(park.projectRequire,',')}" var="item" varStatus="status">
                           <p class="describe"><spring:message code="${item}"/></p>
                     </c:forEach>
        </c:if>
        </div>
    </section>
    <div class="foot-fill"></div>
</article>
<img class="vote-detail" src="${contextPath}/image/vote-detail.png" onclick="doVoteUpDetail(this,'${park.softParkId}')">
<script>
/*跳转到点赞人的页面*/
function goToVoterPage(userId){
	$.ajax({
		url:"${contextPath}/user/getVoterRoleByUserId",
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
						url:"${contextPath}/user/getVoterProjectByUserId",
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