<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>积分详情</title>
    <link href="${contextPath}/css/details.css" rel="stylesheet" type="text/css">
<%-- 	<link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css"> --%>
<%-- 	<script type="text/javascript" src="${contextPath}/js/footer.js"></script> --%>
	<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
	<script src="${contextPath}/js/app.js" type="text/javascript"></script>
	<script type="text/javascript">
// 	var contextPath = '${contextPath}';
	function consulting(){
		Box.alert("还在开发中……");
	}
	var start = 0;
 	var size = 4;
 	var prevName = '';
 	var prevValue = '';
 	var loading=false;
 	var showMore = false;
 	function loadList(){
 		if(loading){
 			Box.autoClose("项目载入中，请稍候...");
 			return;
 		}

 		loading=true;
 		var url = "${contextPath}/user/pointlist?start="+start+"&size="+size;
			$loading.show();
 		$.get(url,function(data,status){
 			$loading.hide();
 			//alert(data);
	    		$("ul").append(data);
 			loading = false;
 		});
 	}
 	function queryMoreList(){
 		start += size;
 		loadList();
 	}
 	var $showMore = '';
 	var $loading = '';
 	$(function(){
 		$showMore=$('#showMore');
 		$loading=$('#loading');
 		loadList();
//  		footer.footerAddSubMenu();
 	});
 	function showClickMore(isShow){
 		showMore = isShow;
 		if(isShow){
 			$showMore.hide();
 		}else{
 			$showMore.show();
 		}
 	}
 	$(window).scroll(function(){
     	if(App.windowReachBottom()&&showMore){
     		queryMoreList();
 		}
 	});
	</script>
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
<!--     <div class="jfnow"> -->
<%--         <span>${user.totalGrade}</span> --%>
<!--     </div> -->
</header>
<section class="jftitle">
    <span>积分明细</span>
</section>
<section class="jflist">
    <ul>
    </ul>
</section>
<div class="back"><a href="javascript:history.go(-1)" >返回</a></div>
<div id="showMore">
        <span></span>
        <a href="javascript:void(0);">没有更多此类项目了</a>
        <span></span>
    </div>
    <div id="loading">
        <span id="loadingText">正在加载，请稍候...</span>
    </div>
</body>
</html>