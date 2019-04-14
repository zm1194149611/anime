<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>足迹</title>
    <link href="${contextPath}/css/pointPeopelList.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/footprint.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/js/jquery.js" type="text/javascript"></script>
    <script src="${contextPath}/js/app.js" type="text/javascript"></script>
    <script src="${contextPath}/js/box.js" type="text/javascript"></script>
     <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript">
    	function loadList(isAppend,name,value){
    		var url = "${contextPath}/ground/queryPrjTrackList?projectId=${projectId}";
			$loading.show();
    		$.get(url,function(data,status){
    			$loading.hide();
    		    $("article").html(data);
    		});
    	}
    	function doUpVote(obj,id)
    	{
    		var url = "${contextPath}/user/doTrackVote"; 
    		/*$.get(url,function(data,status){
    			
    		});*/
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
    	$(function(){
    		$loading=$('#loading');
    		loadList(true);
    	});
    	
    	/*跳转到点赞人的页面 by zm*/
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
</head>
<body>
<header>
    <a href="${contextPath}/user/homecenter"><img src="${contextPath}/image/arrows-left.png"></a>
    <p>我们的足迹</p>
    <a href="${contextPath}/ground/addprjTrack?projectId=${projectId}"><span>添加</span></a>
</header>
<article>
</article>
<div id="loading">
     <span id="loadingText">正在加载，请稍候...</span>
</div>
</body>
</html>