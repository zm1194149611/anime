<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>孵化园列表</title>
    <link href="${contextPath}/css/pointPeopelList.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/incubationParkList.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/js/adswitch.js"></script>
    <!--弹出层JS-->
    <script src="${contextPath}/js/box.js"></script>
    <!--!end 弹出层JS-->
    <script src="${contextPath}/js/jquery.js"></script>
    <script src="${contextPath}/js/app.js" type="text/javascript"></script>
     <script src="${contextPath}/js/footer.js" type="text/javascript"></script>
        <script type="text/javascript">
        var start = 0;
    	var size = 4;
    	var prevName = '';
    	var prevValue = '';
    	var loading=false;
    	var showMore = false;
    	var key="";
        var contextPath = '${contextPath}';
        var userId='${userId}';
        var domain = '${domainName}';
        var isUpdateUser = '${isUpdateUser}';
        var type = "footerAddSubMenu";
    	function loadList(){
    		if(loading){
    			Box.autoClose("项目载入中，请稍候...");
    			return;
    		}

    		loading=true;
    		
    		var url = "${contextPath}/ground/queryIncubationList?start="+start+"&size="+size+"&keySearch="+key+"&softName=${info.cityName}" 
    		console.info(url);
    		console.info(1);
			$loading.show();
    		$.get(url,function(data,status){
    			$loading.hide();
    			//alert(data);
	    		$("#incubation-section").append(data);
    			loading = false;
    		});
    	};
    	function doVoteUp(vote,softParkId)
        {
    		if(userId.indexOf("999-")!=-1)
    		{
    			Box.prompt("您还未登录，请先登录！");
    			return ;
    		}
        	var url = "${contextPath}/ground/doVoteUp"; 
    		/*$.get(url,function(data,status){
    			
    		});*/
    		 $.ajax( {
    	 	        type : "post",  
    	 	        url : url,  
    	 	        data:{softParkId:softParkId},
    	 	        dataType:"json",  
    	 	        success : function(data) {  
    	 	            if(data.exceptionCode){
    	 	            	Box.autoClose(data.exceptionMsg);
    	 	            	return ;
    	 	            }
    	 	            else
    	 	            {
    	 	               $("#"+softParkId).html(parseInt($("#"+softParkId).html())+1)
        	 	           Box.autoClose("点赞成功！");
        	 	           vote.style.opacity=0.5;
        	 	          $(vote).parents("ul").next().children().find("label").html(data.result);
    	 	            }
    	 	       
    	 	        },
    	 	        error:function(data){
    	 	        	Box.autoClose("保存失败，请检查网络");
    	 	        }
    	 		}); 
        };
    	function queryMoreList(){
    		start += size;
    		loadList();
    	};
    	var $showMore = '';
    	var $loading = '';
    	$(function(){
    		banner();
    		$showMore=$('#showMore');
    		$loading=$('#loading');
    		loadList();
    		footer.footerAddSubMenu();
    	});
    	function showClickMore(isShow){
    		showMore = isShow;
    		if(isShow){
    			$showMore.hide();
    		}else{
    			$showMore.show();
    		}
    	};
    	$(window).scroll(function(){
        	if(App.windowReachBottom()&&showMore){
        		queryMoreList();
    		}
    	});
  
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
	    function previewImg(img) {
			wx.previewImage({
			    current: img, // 当前显示图片的http链接
			    urls: [img] // 需要预览的图片http链接列表
			});
		};
		function shareOk()
		{
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
	<%@include file="../jspf/wechatInit.jspf"%>
	<!-- --------------以上是添加内容------------------ -->
	<style>
	#supportBtn img{
	    border:0 !important;
	}
	
	</style>

    <style type="text/css">
        #showMore{
             position: relative;
             margin: 10px 0;
         }
        #showMore span:first-of-type{
             margin-left: 18%;
         }
        #showMore span{
             display: inline-block;
             width: 14%;
             position: relative;
             top: -3px;
             border-bottom: 1px solid #cccccc;
         }
        #showMore a{
	         text-align:center;
             text-decoration: none;
             color: #aaaaaa;
             width: 34%;
             position: relative;
             display: inline-block;
         }
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
    	@media (min-height: 630px) {
	        #showMore a{
	            font-size:14px;
	            padding:14px 0;
             }
         }
         @media (max-height: 630px) {
            #showMore a{
                font-size:12px;
                padding:10px 0;
             }
          }
    </style>
</head>
<body>
<header>
		<div class="bgBox">
			<ul class="picBox" id="picBox">
	        	<c:forEach items="${syeBannerList}" var="banner">
					<li>
						<a href="${banner.syeBannerLink}"><img src="${contextPath}/pics/${banner.syeBannerUrl}"></a>
						<p class="boxFont">${banner.syeBannerRemark}</p>
					</li>
	        	</c:forEach>
				<%-- <li>
					<a href="#"><img src="${contextPath}/image/ad_04.png"></a>
					<p class="boxFont">孵化风情</p>
				</li>
				<li>
					<a href="#"><img src="${contextPath}/image/ad_03.png"></a>
					<p class="boxFont">孵化未来</p>
				</li>
				<li>
					<a href="#"><img src="${contextPath}/image/ad_02.png"></a>
					<p class="boxFont">孵化希望</p>
				</li> --%>
			</ul>
			<div class="picIndex" id="picIndex"></div>
		</div>
	</header>
	<!-- 搜索 -->
	<section>
		<form>
			<div class="search">
				<input name="textfield" type="text" id="textfield" placeholder="请输入园区名字" value="${info.cityName!=null?info.cityName:''}" onblur="keySearch()">
				<img id="search" src="${contextPath}/image/search.png" onclick="keySearch()">
			</div>
		</form>
	</section>
	<!-- 列表 -->
	<section id="incubation-section">
	</section>
	<div class="foot-fill"></div>
	<div id="showMore">
        <span></span>
        <a href="javascript:void(0);">没有更多此类项目了</a>
        <span></span>
    </div>
    <div id="loading">
        <span id="loadingText">正在加载，请稍候...</span>
    </div>
 	<br/>
</body>
<script type="text/javascript">
 function keySearch()
 {
	 var key=$('#textfield').val();
	 var start=0;
	 var url = "${contextPath}/ground/queryIncubationList?start="+start+"&size="+size+"&keySearch="+key; 
		$.get(url,function(data,status){
 			$("#incubation-section").html(data);
		});
 }
</script>
</html>