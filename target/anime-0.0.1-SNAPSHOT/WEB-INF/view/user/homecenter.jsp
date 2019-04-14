<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>个人中心</title>
	<link href="${contextPath}/css/mycenter.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <!--<link href="${contextPath}/css/person.css" rel="stylesheet" type="text/css">-->
    <link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/pointPeopelList.css" rel="stylesheet" type="text/css">
    <!--弹出层JS-->
    <script type="text/javascript" src="${contextPath}/js/box.js"></script>
    <script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${contextPath}/js/app.js"></script>
    <script src="${contextPath}/js/footer.js" type="text/javascript"></script>
    <!--!end 弹出层JS-->
    
    <script type="text/javascript">
    var contextPath = '${contextPath}';
    var userId='${user.id}';
    var domain = '${domainName}';
    //var isUpdateSystem = '${isUpdateSystem}';
    var isUpdateUser = '${isUpdateUser}';
    var start = 0;
	var size = 5;
    var loading=false;
	var showMore = false;
	var type = "footerAddMy";//加载页脚的方式
	window.onload=function()
	{
		//setInterval(footer.footerAddMy(),5000);
	 	footer.footerAddMy();
	 	/*var pointRule=document.getElementById('pointRule');
	 	pointRule.onclick=function(){
	 		location.href="${contextPath}/ground/integrationRule";
	 	};*/
	};
    function loadList(){
		if(loading){
			Box.autoClose("项目载入中，请稍候...");
			return;
		}
		loading=true;
		var url = "${contextPath}/user/queryProjectList?start="+start+"&size="+size; 
		$.get(url,function(data,status){
   			$("section").append(data);
			loading = false;
		});
	}
    function queryMoreList(){
		start += size;
		loadList();
	}
    var $showMore = '';
	$(function(){
		loadList();
		$showMore=$('#showMore');
		showItemByRole();
	});
    function showClickMore(isShow){
    	showMore = isShow;
		if(isShow){
			$showMore.show();
		}else{
			$showMore.hide();
		}
	}
    $(window).scroll(function(){
   
    	if(App.windowReachBottom()&&showMore){
    		queryMoreList();
		}
	});
    function showItemByRole()
    {
    	var role=${user.role};
    	if(role==0 || role==3 )
    	{
    		$("#mytrack").hide();
    	}else if(role==100){
    		$("#mytrack").hide();
    		
    	}
    	else if(role==1 ||role==4)
        {
    	  $("#myproject span").html("辅导项目")
        }
    	else if(role==2||role==5||role==6)
        {
    		$("#myproject").hide();
    		$("#showMore").hide();
    		$("#mytrack").hide();
//     		click(function()
//     		{
//     			$("#createPrj").attr('href',"#");  			
//     			Box.autoClose("请先认证身份...");
//     		})
    		
        }
    }
    function doVote(vote,projectId){
		
    	var data={"projectId":projectId};
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
				}
    		},
    		error:function(data){
    			Box.autoClose('提交失败，请检查网络');
    		}
    	});
    }
    /*进入互动时间轴*/
    function interactionTimeLine(){
    	location.href="${contextPath}/communication/interactionListByUser?userId="+userId;
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
    <div class="picture">
        <c:set var="headImgUrl" value="${user.headImgUrl}"/>
        <c:if test='${user.headImgUrl==null||""==user.headImgUrl}'>
	  <c:set var="headImgUrl" value="${contextPath}/image/sye-headImg.jpg"/>
        </c:if>
          <img class="my" onclick="interactionTimeLine();" src='${headImgUrl}'/>
        <%-- <c:if test="${fn:indexOf(user.role,'1')==0}">
        <img class="dao" src="${contextPath}/image/mycenter-dao.png">
	    </c:if>
	    <c:if test="${fn:indexOf(user.role,'0')==0}">
        <img class="dao" src="${contextPath}/image/mycenter-chuang.png">
	    </c:if>
	     <c:if test="${fn:indexOf(user.role,'3')==0}">
        <img class="dao" src="${contextPath}/image/mycenter-chuangH.png">
	    </c:if>
	     <c:if test="${fn:indexOf(user.role,'4')==0}">
        <img class="dao" src="${contextPath}/image/mycenter-daoH.png">
	    </c:if> --%>
	    <c:if test="${user.role==1}">
        <img class="dao" src="${contextPath}/image/mycenter-dao.png">
	    </c:if>
	    <c:if test="${user.role==100}">
        <img class="dao" src="${contextPath}/image/mycenter-guan.png">
	    </c:if>
	    <c:if test="${fn:indexOf(user.role,'0')==0}">
        <img class="dao" src="${contextPath}/image/mycenter-chuang.png">
	    </c:if>
	     <c:if test="${fn:indexOf(user.role,'3')==0}">
        <img class="dao" src="${contextPath}/image/mycenter-chuangH.png">
	    </c:if>
	     <c:if test="${fn:indexOf(user.role,'4')==0}">
        <img class="dao" src="${contextPath}/image/mycenter-daoH.png">
	    </c:if>

    </div>
    <div class="introduce">
        <c:if test='${fn:length(user.nickName)<=0}'>
           <span class="mynameK"></span>
        </c:if>
        <c:if test='${fn:length(user.nickName)>0 && fn:length(user.nickName)<3}'>
           <span class="myname">${user.nickName}</span>
        </c:if>
        <c:if test='${fn:length(user.nickName)>2 && fn:length(user.nickName)<5}'>
           <span class="myname myname1">${user.nickName}</span>
        </c:if>
        <c:if test='${fn:length(user.nickName)>4 && fn:length(user.nickName)<7}'>
           <span class="myname myname2">${user.nickName}</span>
        </c:if>
        <c:if test='${fn:length(user.nickName)>6 && fn:length(user.nickName)<9}'>
           <span class="myname myname3">${user.nickName}</span>
        </c:if>
        <c:if test='${fn:length(user.nickName)>8}'>
           <span class="myname myname3">${user.nickName.substring(0,7)}...</span>
        </c:if>
        <c:choose>
             <c:when test="${fn:indexOf(user.level,'1')==0}">
                 <img src="${contextPath}/image/v1.png">
             </c:when>
             <c:when test="${fn:indexOf(user.level,'2')==0}">
                 <img src="${contextPath}/image/v2.png">
             </c:when>
             <c:when test="${fn:indexOf(user.level,'3')==0}">
                 <img src="${contextPath}/image/v3.png">
             </c:when>
             <c:when test="${fn:indexOf(user.level,'4')==0}">
                 <img src="${contextPath}/image/v4.png">
             </c:when>
             <c:when test="${fn:indexOf(user.level,'5')==0}">
                 <img src="${contextPath}/image/v5.png">
             </c:when>
             <c:otherwise>
                 <img src="${contextPath}/image/v6.png">
             </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test='${user.certification!=null&&""!=user.certification}'>
                <img src="${contextPath}/image/realname.png">
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${fn:indexOf(user.role,'1')==0||fn:indexOf(user.role,'0')==0}">
                <img src="${contextPath}/image/SYE.png">
             </c:when>
        </c:choose>
       
    </div>
    <div class="baseMessage">
        <span>
            <img class="first-where" src="${contextPath}/image/mycenter-where.png">
            <label>
                <c:if test='${user.zone!=null&&user.zone!=""}'>
                    <spring:message code="project.zone.zone${user.zone}"/>
                </c:if>
            </label>
        </span>
        <span><img  src="${contextPath}/image/mycenter-name.png"><label>${user.userName}</label></span>
        <span><img  src="${contextPath}/image/mycenter-position.png"><label>${user.position}</label></span>
    </div>
</header>
<div class="integral">
    <div class="integral-left">
    <a href="${contextPath}/user/jfDetail">
        <img src="${contextPath}/image/mycenter-integral.png">
        <div class="integral-details">
            <p>${user.totalGrade}</p>
            <span>当前积分</span>
        </div>
    </a>
    </div>
    <div class="integral-right">
    <a href="${contextPath}/user/jfrule">
        <img src="${contextPath}/image/mycenter-rule.png">
        <div class="rule-details">
            <span>查看积分规则</span>
        </div>
    </a>
    </div>
</div>
<div class="mycenter-menu server">
    <span>服务时长</span>
    <span>${user.lengthOfService }小时</span>
</div>
<div class="mycenter-menu">
    <ul <c:if test="${user.role==100 }">style="height:60px;"</c:if>>
        <li class="first">
            <a href="${contextPath}/user/user">
                <span>完善信息</span>
                <img src="${contextPath}/image/mycenter-arrows.png">
            </a>
        </li>
        <c:if test="${user.role!=100 }">
        <li>
            <a href="${contextPath}/user/approving">
                <span>身份认证</span>
                <img src="${contextPath}/image/mycenter-arrows.png">
            </a>
        </li>
        </c:if>
    </ul>
</div>
<div class="mycenter-menu foot">
    <ul>
        <li class="first">
            <a href="${contextPath}/user/setting">
                <span>设置</span>
                <img src="${contextPath}/image/mycenter-arrows.png">
            </a>
        </li>
    </ul>
</div>
<div class="mycenter-menu foot">
    <ul>
	    <li>
	        <a id="createPrj" href="${contextPath}/project/create">
	            <span>上传项目</span>
	            <img src="${contextPath}/image/mycenter-arrows.png">
	        </a>
	    </li>
  </ul>
</div>
<div class="mycenter-menu foot" id="mytrack">
    <ul>
        <li class="first">
            <a href="${contextPath}/user/userTrack?userId=${user.id}">
               <span>导师的足迹</span>
               <img src="${contextPath}/image/mycenter-arrows.png">
            </a>  
        </li>
    </ul>
</div>
 <section class="last" id="myproject">
    <ul class="last-one">
        <li class="first">
                <span>我的项目</span>
        </li>
    </ul>
 </section>
 <div class="footer-fill"></div>
    <div id="showMore" style="display:none;margin-left: 20px;"><a href="javascript:queryMoreList();">点击加载更多&gt;&gt;</a></div>
 	<br/>
</body>
</html>