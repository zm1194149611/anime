<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>动漫</title>
    <link href="${contextPath}/css/tutorList.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/proList.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/pointPeopelList.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/js/adswitch.js" type="text/javascript"></script>
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <!--弹出层JS-->
    <script src="${contextPath}/js/box.js" type="text/javascript"></script>
    <!--!end 弹出层JS-->
    <script src="${contextPath}/js/jquery.js" type="text/javascript"></script>
    <script src="${contextPath}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${contextPath}/js/footer.js?key=14" type="text/javascript"></script>
    <script src="${contextPath}/js/app.js" type="text/javascript"></script>
    <style>
        .pointPeopelList {
             overflow:hidden;
             padding-top: 10px;
         }
   
    </style>
    
    <script type="text/javascript">
    
	    var contextPath = '${contextPath}';
        var type = "footerAddSubMenu";
	   	var start = 0;//分页开始
	   	var prevName = '';
	   	var prevValue = '';
	   	var loading=false;
	   	var showMore = false;
	   	function loadList(){
	   		if(loading){
	   			Box.autoClose("载入中，请稍候...");
	   			return;
	   		}
	   		loading=true;
	   		
	   		key=$('#textfield').val();
	   		
	   		var url = "${contextPath}/comic/querylist?start="+start+"&keySearch="+encodeURI(encodeURI(key)); 
	  
			$loading.show();
	   		$.get(url,function(data,status){
	   			$loading.hide();

	    		$("#cartoon-list").append(data);
	   			
	   			loading = false;
	   		});
	  	}
	   	
	   	function queryMoreList(){
	   		start += 1;
	   		loadList();
	   	}
	   	
    	var $showMore = '';
    	var $loading = '';
    	$(function(){
    		
    		var phone = window.localStorage.getItem("phone");
			var pwd = window.localStorage.getItem("pwd");
			/* if(phone&&pwd){
				var data={phone:phone,pwd:pwd};
				$.ajax({
		    		url:'${contextPath}/login/login',
		    		type:'post',
		    		dataType:'json',
		    		data:data,
		    	});
			} */
    		banner();
    		$showMore=$('#showMore');
    		$loading=$('#loading');
    		loadList();
    		footer.footerAddTalk();
    		
    	});
    	
    	function showClickMore(isShow){
    		
    		/* if(isShow){
    			$showMore.hide();
    		}else{
    			$showMore.show();
    		} */
    		console.log(isShow)
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
        	<c:forEach items="${bannerList}" var="banner">
	            <li>
	                <%-- <a href="${banner.configValue}"> --%>
	                <img src="${banner.configValue}"></a>
	                <p class="boxFont"></p>
	            </li>
        	</c:forEach>
            <%-- <li>
                <img src="${contextPath}/imgs/banner4.jpg"></a>
                <p class="boxFont"></p>
            </li>
            <li>
                <img src="${contextPath}/imgs/banner5.jpg"></a>
                <p class="boxFont"></p>
            </li>
            <li>
                <img src="${contextPath}/imgs/banner6.jpg"></a>
                <p class="boxFont"></p>
            </li> --%>
        </ul>
        <div class="picIndex" id="picIndex"></div>
    </div>
    <section class="notice">
        <div class="notice_left">
            <img src="${contextPath}/image/notice.png">
        </div>
        <div class="notice_right" id="moocBox">
            <ul>
            	<c:forEach items="${rollWordList}" var="rollWord">
            		<li><a href="#">${rollWord.configValue}</a></li>
            	</c:forEach>
                <!-- <li><a href="#">微信公众号：日月明动漫小屋</a></li>
                <li><a href="#">备用公众号：日月明影视小屋</a></li>
	            <li><a href="#">新网站上线，请多多支持！</a></li> -->
	            <!-- <li><a href="#">所有动漫资源均免费</a></li> -->
            </ul>
            
        </div>
    </section>
</header>
<article>
    <section>
        <form>
        <div class="search" style="padding-bottom:0">
        	<!-- onblur="keySearch()" onfocus="sea();" -->
            <input name="textfield" type="text" id="textfield" placeholder="请输入动漫名称" value="${info.cityName!=null?info.cityName:''}" >
            <div class="kuang" onclick="keySearch()"><img id="search" src="${contextPath}/image/search.png"></div>
        </div>
        </form>
    </section>
    <section id="cartoon-list">
		<!-- <div class="black"></div> -->
		<!-- to load -->
    </section>
    
    <div id="showMore">
        <span></span>
        <a href="javascript:void(0);">没有更多内容了</a>
        <span></span>
    </div>
    <div id="loading">
        <span id="loadingText">正在加载，请稍候...</span>
    </div>
 	<br/>
</article>
<div class="fill"></div>
<script type="text/javascript">
    var area = document.getElementById('moocBox');
    var iliHeight = 25;//单行滚动的高度
    var speed = 100;//滚动的速度
    var time;
    var delay= 2000;
    area.scrollTop=0;
    area.innerHTML+=area.innerHTML;//克隆一份一样的内容
    function startScroll(){
        time=setInterval("scrollUp()",speed);
        area.scrollTop++;
    }
    function scrollUp(){
        if(area.scrollTop % iliHeight==0){
            clearInterval(time);
            setTimeout(startScroll,delay);
        }else{
            area.scrollTop++;
            if(area.scrollTop >= area.scrollHeight/2){
                area.scrollTop =0;
            }
        }
    }
    setTimeout(startScroll,delay)
    
    function keySearch()
	 {
		key=$('#textfield').val();
		start=0;
		var url = "${contextPath}/comic/querylist?start="+start+"&keySearch="+encodeURI(encodeURI(key)); 
		$.get(url,function(data,status){
	 		$("#cartoon-list").html(data);
		})
		
	 }
</script>
</body>
</html>
