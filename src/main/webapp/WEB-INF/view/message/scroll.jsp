<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/big.css" rel="stylesheet" type="text/css">
   <%--  <script src="${contextPath}/js/big.js" type="text/javascript"></script> --%>
    <script src="${contextPath}/js/jquery.js" type="text/javascript"></script>
    <script src="${contextPath}/js/app.js" type="text/javascript"></script>
    <c:set var="batchCount" value="4" />
    <script type="text/javascript">
    	var batchCount = ${batchCount};
    	var batchCacheIndex = 0;
    	var currentLoadingBatch = 0;
    	var currentShowBatch = 0;
    	var page = 1;
    	var size = 20;
    	function loadedNew(){
    		var newSize = $("#new .textBox").size();
    		return newSize>0;
    	}
    	function loadBatch(batchIndex){
    		var data = {page:(batchIndex||batchIndex==0)?batchIndex:batchCacheIndex,size:4};
    		console.log("query page:"+data.page);
    		console.log("batchCacheIndex:"+batchCacheIndex);
    		$.ajax({
	    		url:'${contextPath}/ground/queryMessageScrollBlock',
	    		type:'post',
	    		dataType:'html',
	    		data:data,
	    		success:function(data){
					//$("article").append(data);
					$("#new").html(data);
					if((batchIndex||batchIndex==0)&&loadedNew()){
						batchCacheIndex++;
						$("#batchct_"+batchIndex).html(data);
						console.log("loaded:"+batchIndex);
						$("#new").empty();
					}
	    		},
	    		error:function(data){
	    			//setTimeout("loadBatch("+batchIndex+")",10000);
	    			//Box.autoClose('获取留言失败，请检查网络');
	    		}
	    	});
    	}
    	var currentShowDom = "";
    	var delayToShow = function(){}
    	function scrollToBottom(){
    		document.body.scrollTop+=1;
    		/* var scrollSpace = document.body.offsetHeight-document.body.clientHeight-document.body.scrollTop;
    		console.log(scrollSpace); */
    		if(App.windowReachBottom()){
    			console.log("showed:"+currentShowBatch);
    			currentShowBatch = (currentShowBatch+1)%(batchCacheIndex<batchCount?batchCacheIndex:batchCount);
    			console.log("before showBatch ->currentShowBatch:"+currentShowBatch);
    			showBatch();
    			var artSize = $("article").children("div").size();
    			document.body.scrollTop = 0;
    			if(artSize>1){
    				console.log("appended success");
    				console.log(artSize);
	    			var $prevDom = $("article").children("div:first");
	    			$prevDom.animate({width:0,height:0});
	    			delayToShow = function (){
	    				$prevDom.remove();
	    				currentShowDom = $("article div:first").show();
	        			console.log("showing:"+currentShowBatch);
	        			setTimeout("scrollToBottom()", 100);
	    			}
	    			setTimeout("delayToShow()", 500);
	    			return;
    			}
    			currentShowDom = $("article div:first").show();
    			console.log("showing:"+currentShowBatch);
    			setTimeout("scrollToBottom()", 500);
    			return;
    		}
    		setTimeout("scrollToBottom()", 10);
    	}
    	function showBatch(){
    		$("article").append($("#batchct_"+currentShowBatch).html());
    		//console.log(currentShowBatch);
    		var loadingIndex = batchCacheIndex;
    		if(batchCacheIndex>=batchCount){
    			loadingIndex = (currentShowBatch+batchCount-1)%batchCount;
    		}
    		console.log("loading:"+loadingIndex);
    		loadBatch(loadingIndex);
    	}
    	function startShow(){
    		var domToShow = $("#batchct_"+currentShowBatch).html();
    		$("article").append(domToShow);
    		currentShowDom = $("article div");
    		currentShowDom.show();
    		console.log("showing:"+currentShowBatch);
    		setTimeout("scrollToBottom()", 30);
    	}
    	$(function(){
    		for(var i=0;i<batchCount;i++){
	    		console.log(i);
	    		loadBatch(i);
    		}
    		setTimeout("startShow()", 5000);
    	});
    </script>
    <style type="text/css">
    	.batch{
    		float:left;
    		width: 100%;
    	}
    	#batchContainer,#batchContainer div{
    		display:none;
    	}
    	#new{
    		display:none;
    	}
    </style>
</head>
<body>
<img class="bg" src="${contextPath}/image/winBg.jpg">
<article></article>
<div id="batchContainer">
	<c:forEach begin="0" step="1" end="${batchCount-1}" var="bIndex">
		<div id="batchct_${bIndex}" class="batch_ct"></div>
	</c:forEach>
</div>
<div id="new"></div>
</body>
</html>
