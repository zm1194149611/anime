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
    <title>详情</title>
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
    <script src="${contextPath}/js/proDetails.js?key=1"></script>
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
    	//footer.footerAddSubMenu();
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
    
    window.onload=function(){ 
    	ChangeColorByDoVote('${DoVoteColor}'); 
    	picNew();
        suppor();
   } 
    
    </script>
   
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
        <img id="proPic" src="${cartoon.imgUrl }">
        <p id="proName">${cartoon.title }</p>
        <p class="proMan">作者：<label>${cartoon.author }</label></p>
        <p class="proData">
        	<c:forEach var="tag" items="${cartoon.tagList}">
			    <span><label id="support">${tag }</label></span>
		    </c:forEach>
            <!-- <span><label id="support">热血</label></span>
            <span><label id="scan">冒险</label></span>
            <span><label id="share">搞笑</label></span> -->
        </p>
        
        <p>
            <%-- <span id="supporting" onclick="voke();ChangeColorByDoVote()"><img src="${contextPath}/image/pro_%20details3.png">投票</span>
            <span id="contact"><img src="${contextPath}/image/pro_%20details4.jpg">电话</span> --%>
        </p>
    </div>
</header>
<article>
	
    <div class="pointPeopelDetails">
        ${cartoon.introduce }
    </div>
    <!-- <div class="pointPeopelDetails">
        如果本站对你有帮助，请将每天公众号推送的文章都点击一遍(拉到最底部即可)，为小编增加一点人气！
    </div> -->
    <c:forEach var="cartoonChapter" items="${cartoonChapters}">
	    <div class="font bgLine" onclick="location.href='${contextPath}/cartoon/getCartoonBody?chapterId=${cartoonChapter.id}'">
	    	
		    &nbsp; &nbsp;第${cartoonChapter.sequence }话&nbsp;&nbsp; &nbsp;${cartoonChapter.title }
	    </div>
    </c:forEach>
    <!-- <div class="font bgLine">
	    &nbsp; &nbsp;第2话&nbsp; 
    </div>
    <div class="font bgLine">
        
        &nbsp; &nbsp;第3话&nbsp;
    </div>
    <div class="font bgLine">
        
    </div>
    <div class="font bgLine">
       
    </div>
    <div class="font bgLine">
        
    </div>
    <div class="font bgLine">
	</div> -->
<div class="footer-fill"></div>
</body>
</html>
