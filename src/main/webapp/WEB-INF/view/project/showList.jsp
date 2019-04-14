<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>项目路演</title>
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/proList.css" rel="stylesheet" type="text/css">
     <link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
     <link href="${contextPath}/css/pointPeopelList.css" rel="stylesheet" type="text/css">
     <c:set var="projectId" value="${project.id }"/>
    <!--弹出层JS-->
    <script src="${contextPath}/js/box.js"></script>
    <!--!end 弹出层JS-->
    <script src="${contextPath}/js/proList.js"></script>
    <script src="${contextPath}/js/jquery.js"></script>   
   <script src="${contextPath}/js/app.js" type="text/javascript"></script>
     <script src="${contextPath}/js/footer.js" type="text/javascript"></script>
    <style>
        .pointPeopelList {
             overflow:hidden;
             padding-top: 10px;
         }
   
    </style>
    
    <script type="text/javascript">
    
	    var contextPath = '${contextPath}';
	    var userId='${user.id}';
	    var domain = '${domainName}';
	    var isUpdateUser = '${isUpdateUser}';
        var type = "footerAddSubMenu";
	   	var start = 0;
	   	var size = 4;
	   	var prevName = '';
	   	var prevValue = '';
	   	var loading=false;
	   	var showMore = false;
	   	function loadList(isAppend,name,value){
	   		if(loading){
	   			Box.autoClose("项目载入中，请稍候...");
	   			return;
	   		}
	   		loading=true;
	   		prevName=name;
			prevValue=value;
	   		var url = "${contextPath}/ground/queryProjectList?start="+start+"&size="+size; 
	   		
	   		if(name&&value){
	   			url+="&" + name + "=" + value;
	   		}
			$loading.show();
	   		$.get(url,function(data,status){
	   			$loading.hide();
	   			if(isAppend){
	    			$("section").append(data);
	   			}else{
	   				$("section").html(data);
	   			}
	   			loading = false;
	   		});
	  	}
	   	
	   	function queryMoreList(){
	   		start += size;
	   		loadList(true,prevName,prevValue);
	   	}
	   	
    	var $showMore = '';
    	var $loading = '';
    	$(function(){
    		footer.footerAddSubMenu();
    		SelectionCondition.conditionSelected = function(name,value){
    			start = 0;
    			loadList(false,name,value);
    		};
    		SelectionCondition.init();
    		$showMore=$('#showMore');
    		$loading=$('#loading');
    		if(userId.indexOf("999-")!=-1){
	    		<c:choose>
	    			<c:when test='${info.cityName==null||""==info.cityName}'>
	    				loadList(false,null,null);
	    			</c:when>
	    			<c:otherwise>
			            var selectedP=document.getElementsByClassName("selectedP")[0];
			    		selectedP.style.display = "block";
			            selectedP.innerHTML = "筛选条件：";
			            var span = document.createElement("span");
			            var text = document.createTextNode('<spring:message code="project.zone.${info.zone}"/>');
			            span.appendChild(text);
			            selectedP.appendChild(span);
			    		loadList(true,"zone","${info.zone}");
	    			</c:otherwise>
	    		</c:choose>
    		}else{
	    		<c:choose>
		    		<c:when test='${info.cityName==null||""==info.cityName}'>
			    		var selectedP=document.getElementsByClassName("selectedP")[0];
			    		selectedP.style.display = "block";
			            selectedP.innerHTML = "筛选条件：";
			            var span = document.createElement("span");
			            var text = document.createTextNode('<spring:message code="project.zone.zone${user.zone}"/>');
			            span.appendChild(text);
			            selectedP.appendChild(span);
			            console.info(1)
			            loadList(false,"zone","zone${user.zone}");
		            </c:when>
		            <c:otherwise>
			            var selectedP=document.getElementsByClassName("selectedP")[0];
			    		selectedP.style.display = "block";
			            selectedP.innerHTML = "筛选条件：";
			            var span = document.createElement("span");
			            var text = document.createTextNode('<spring:message code="project.zone.${info.zone}"/>');
			            span.appendChild(text);
			            selectedP.appendChild(span);
			            console.info(2)
			    		loadList(true,"zone","${info.zone}");
		    		</c:otherwise>
	            </c:choose>
    		}
    	});
    	
    	function showClickMore(isShow){
    		showMore = isShow;
    		if(isShow){
    			$showMore.hide();
    		}else{
    			$showMore.show();
    		}
    	};
    	
    	function doVote(vote,projectId){
        	var data={"projectId":projectId};
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
    					$("#"+projectId).html(parseInt($("#"+projectId).html())+1);
    					Box.autoClose("投票成功！每天都可以投票噢！");
    					vote.style.opacity=0.5;
    					$(vote).parents("ul").next().parent().next().children().find("label").html(data.result);
    				}
        		},
        		error:function(data){
        			Box.autoClose('提交失败，请检查网络');
        		}
        	});
        }
    	
    	$(window).scroll(function(){
        	if(App.windowReachBottom()&&showMore){
        		queryMoreList();
    		}
    	});
    </script>
 <!-- --------------------以下为添加内容---------------------- -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/app.js"></script>
    <script type="text/javascript">
   <%
   java.util.Map<String,String> shareInfo = (java.util.Map<String,String>)request.getAttribute("info");
   shareInfo = shareInfo==null?new java.util.HashMap<String,String>():shareInfo;
   %>
   	App.data.wechat.apis = ['onMenuShareAppMessage','onMenuShareTimeline'];
	App.data.wechat.API_NAMEs = {'onMenuShareAppMessage':'分享给朋友','onMenuShareTimeline':'分享到朋友圈'};
	$(function(){
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
		        shareOk();
		    },
		    cancel: function () { 
		        // 用户取消分享后执行的回调函数
		    	//alert("success");
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
	function shareOk(){
		var data={};
    	$.ajax({
    		url:'${contextPath}/user/shareOk',
    		type:'post',
    		dataType:'json',
    		data:data,
    		success:function(data){
				if(data.exceptionCode){
					Box.autoClose(data.exceptionMsg);
				}else{
				   Box.autoClose("分享成功")		  
				}
    		},
    		error:function(data){
    			Box.autoClose('提交失败，请检查网络');
    		}
    	});
	}
	
    </script>
    <%@include file="../jspf/wechatInit.jspf"%>
    <!-- ----------以上为添加内容---------------------------- -->
    <style type="text/css">
    	#loading{
    		display: none;
    		width: 100%;
    		height: 20px;
    		background-color: rgba(0,0,0,0.4);
    		text-align: center;
    		position: fixed;
    		z-index: 19;
    		bottom: 0;
    		padding-top: 4px;
    	}
    	#loadingText{
    		width: auto;
    		color: #fff;
    		font-size: 13px;
    	}
    </style>
</head>
<body>
<header>
    <div class="bgBox">
        <ul class="picBox" id="picBox">
        	<c:forEach items="${syeBannerList}" var="banner">
	            <li>
	                <a href="${banner.syeBannerLink}">
	                <img src="${contextPath}/pics/${banner.syeBannerUrl}"></a>
	                <p class="boxFont"></p>
	            </li>
        	</c:forEach>
            <%-- <li>
                <a href="http://x.eqxiu.com/s/GW9bplp3?eqrcode=1&from=singlemessage&isappinstalled=0">
                <img src="${contextPath}/image/banner1.jpg"></a>
                <p class="boxFont"></p>
            </li>
            <li>
                <a href="http://mp.weixin.qq.com/s?__biz=MzA3MTU2MjI3MA==&mid=401297513&idx=1&sn=2c0bb6dce72e71066a25a5cdf30de4b2&scene=23&srcid=1229hymoCJHy10yDsWlK9rRk#rd">
                <img src="${contextPath}/image/banner2.jpg"></a>
                <p class="boxFont"></p>
            </li> --%>
        </ul>
        <div class="picIndex" id="picIndex"></div>
    </div>
</header>
<article>
    <nav>
        <ul>
         	<li id="all" class="title">
                <a onclick="loadList(false)"><label>全部</label></a>
            </li>
            <li id="zone" class="title">
                <a><label>区域</label><span class="titleSpan"></span></a>
            </li>
            <li id="business" class="title">
                <a><label>行业</label><span class="titleSpan"></span></a>
            </li>
            <li id="status" class="title">
                <a><label>状态</label><span class="titleSpan"></span></a>
            </li>
        </ul>
    </nav>
    <div class="choose">
        <ul id="zoneList" style="display: none">
            <c:forEach var="i" begin="1" end="21" step="1"> 
            	<li><div style="display:none">zone${i}</div><span><spring:message code="project.zone.zone${i}" /></span></li>
            </c:forEach>
        </ul>
        <ul id="businessList" style="display: none">
        	<c:forEach var="i" begin="1" end="9" step="1">
            	<li><div style="display:none">business${i}</div><span><spring:message code="project.business.business${i}" /></span></li>
            </c:forEach>
        </ul>
        <ul id="statusList" style="display: none">
        	<c:forEach var="i" begin="1" end="3" step="1">
            	<li><div style="display:none">status${i}</div><span><spring:message code="project.status.status${i}" /></span></li>
            </c:forEach>
        </ul>
    </div>
    <p class="selectedP" style="display: none"></p>
    <section>
		<!-- <div class="black"></div> -->
		<!-- to load -->
    </section>
    
    <div id="showMore">
        <span></span>
        <a href="javascript:void(0);">没有更多此类项目了</a>
        <span></span>
    </div>
    <div id="loading">
        <span id="loadingText">正在加载，请稍候...</span>
    </div>
 	<br/>
</article>
<div class="fill"></div>
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
</script>
</body>
</html>
