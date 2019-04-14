<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>留言板</title>
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/messageTel.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="${contextPath}/css/idangerous.swiper.css">
	<link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${contextPath}/js/idangerous.swiper.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
	<script type="text/javascript" src="${contextPath}/js/box.js" ></script>
	<script type="text/javascript" src="${contextPath}/js/app.js" ></script>
	<script type="text/javascript" src="${contextPath}/js/footer.js"></script>
	<script  type="text/javascript">
	var contextPath = '<%=request.getAttribute("contextPath")%>';
	var userId='${userId}';
	var domain = '${domainName}';
	var isUpdateUser = '${isUpdateUser}';
    var type = "footerAddSubMenu";
	$(function(){
		footer.footerAddSubMenu();
	})
	</script>
    <style type="text/css">
    	.preloader {
			position: absolute;
			left: 0;
			z-index: 0;
			color: #fff;
			text-align: center;
			line-height: 30px;
			height: 30px;
			width: 100%;
			opacity: 0;
			font-size: 13px;
			/* -webkit-transition: 300ms;
			-moz-transition: 300ms;
			-ms-transition: 300ms;
			-o-transition: 300ms;
			transition: 300ms; */
			background: rgba(0,0,0,0.1);
		}
    	.nextloader {
    		position:fixed;
    		bottom:0;
			left: 0;
			z-index: 0;
			color: #fff;
			text-align: center;
			line-height: 30px;
			height: 30px;
			width: 100%;
			opacity: 0;
			font-size: 13px;
			background: rgba(0,0,0,0.1);
		}
		.nextloader.visible {
			opacity: 1;
		}
		.preloader.visible {
			opacity: 1;
		}
		.textBox{
			/* opacity: 0.2; */
			/* -webkit-transition: 300ms;
			-moz-transition: 300ms;
			-ms-transition: 300ms;
			-o-transition: 300ms;
			transition: 300ms; */
			border-bottom: 1px solid #eeeeee !important;
		}
		.swiper-slide{
			width: 100%;
		}
    </style>
</head>
<body>
<article>

					    <a class="more" href="${contextPath}/leftMessage/create">
					        <img src="${contextPath}/image/more.png">
					    </a>
	<div id="preloader" class="preloader">正在获取最新留言...</div>
	<div id="swiper-container"class="swiper-container msg-container">
		<div class="swiper-wrapper">
				<div class="swiper-slide">
					<header>
					        <p><span>发布留言</span></p>
					</header>
				</div>
			<c:forEach items="${msgs}" var="msg">
				<div class="swiper-slide">
					<div class="textBox">
					    <div class="textBody">
						    <c:choose>
						    	<c:when test="${empty msg.user.headImgUrl}">
							        <img class="header" src="${contextPath}/image/sye-headImg.jpg">
						    	</c:when>
						    	<c:otherwise>
							        <img class="header" src="${msg.user.headImgUrl}" onerror="this.src='${contextPath}/image/sye-headImg.jpg';this.onerror='';">
						    	</c:otherwise>
						    </c:choose>
					        <div class="content">
					            <div>
					                <p class="title">${msg.user.nickName}</p>
					                <p class="text">${fn:escapeXml(msg.msg.msg)}</p>
					            </div>
					            <c:if test="${!empty msg.msg.imgURL}"><img class="img" src="${contextPath}/pics/${msg.msg.imgURL}" onerror="this.style.display='none'"></c:if>
					            <p class="time"><label>${msg.checkTime}</label></p>
					        </div>
					    </div>
					</div>
			    </div>
		    </c:forEach>
		</div>
    </div>
    <div class="nextloader">正在获取历史留言...</div>
</article>
<script>
  var holdPosition = 0;
  var mySwiper = {};
  function initMySwiper(){
	  mySwiper= new Swiper('.swiper-container',{
		    slidesPerView:'auto',
		    //autoResize:true,
		    mode:'vertical',
		    watchActiveIndex: true,
		    freeMode : true,
		    freeModeFluid : true,
		    freeModeMomentum:true,
		    freeModeMomentumRatio:0.1,
		    allowSwipeToPrev:true,
		    //slidesPerViewFit:false,
		    onTouchStart: function() {
		      holdPosition = 0;
		    },
		    onResistanceBefore: function(s, pos){
		      holdPosition = pos;
		    },
		    onResistanceAfter: function(s, pos){
		      holdPosition = -pos;
		    },
		    onTouchEnd: function(swiper){
		    	if (holdPosition>30) {
		            mySwiper.setWrapperTranslate(0,30,0);
		            mySwiper.params.onlyExternal=true;
		            $('.preloader').addClass('visible');
		            loadNewSlides();
		        }else if(holdPosition<-30){
		        	console.log(holdPosition);
		        	mySwiper.setWrapperTranslate(0,mySwiper.positions.current,0);
		            mySwiper.params.onlyExternal=true;
		            $('.nextloader').addClass('visible');
		            loadNewSlides(true);
		        }
		    }
		  });
  }
  var slideNumber = 0;
  var preUrl = '${contextPath}/ground/mobileMsgs';
  var nextFlag = ${nextFlag};
  var prevFlag = ${prevFlag};
  function loadNewSlides(isNext){
	  var url = preUrl;
	  var data = {size:5};
	  if(isNext){
		  data.isNext = true;
		  data.flag = nextFlag;
	  }else{
		  data.isNext = false;
		  data.flag = prevFlag;
	  }
	  $.ajax({
  		url:url,
  		type:'post',
  		dataType:'html',
  		data:data,
  		success:function(data){
  			var $data = $(data); 
  			var $records = $data.find("div.textBox");
			if($records.size()<1){
				var isNext = $data.find('#isNext').attr('title');
				//Box.autoClose('没有更多留言了');
				if('true'==isNext){
					$('.nextloader').removeClass('visible');
					//mySwiper.setWrapperTranslate(0,mySwiper.positions.current,0);
					//alert(mySwiper.slides.length);
					//mySwiper.updateActiveSlide(mySwiper.slides.length-1);
					mySwiper.swipeTo(mySwiper.slides.length-1);
				}else{
					$('.preloader').removeClass('visible');
					mySwiper.setWrapperTranslate(0,0,0);
				}
				mySwiper.params.onlyExternal=false;
				mySwiper.reInit();
			}else{
				//Prepend new slide
				var isNext = $data.find('#isNext').attr('title');
				var newFlag = $data.find('#newFlag').attr('title');
				if('true'==isNext){
					nextFlag = newFlag;
					for(var i=0;i<$records.length;i++){
						mySwiper.appendSlide($records[i].outerHTML);
					}
					$('.nextloader').removeClass('visible');
					//Release interactions and set wrapper
					//Hide loader
					//mySwiper.setWrapperTranslate(0,0,0);
					mySwiper.params.onlyExternal=false;
					//Update active slide
					//mySwiper.updateActiveSlide(mySwiper.slides.length-1);
					//mySwiper.swipeTo(mySwiper.slides.length-1);
					setTimeout("mySwiper.reInit();", 800);
					//setTimeout("mySwiper.resizeFix();", 800);
				}else{
					prevFlag = newFlag;
					for(var i=0;i<$records.length;i++){
					    mySwiper.insertSlideAfter(0,$records[i].outerHTML);
					}
					$('.preloader').removeClass('visible');
					//Release interactions and set wrapper
					//Hide loader
					mySwiper.setWrapperTranslate(0,0,0);
					mySwiper.params.onlyExternal=false;
					//Update active slide
					mySwiper.updateActiveSlide(0);
				}
			}
			
  		},
  		error:function(data){
  			mySwiper.setWrapperTranslate(0,0,0);
			mySwiper.params.onlyExternal=false;
			$('.nextloader').removeClass('visible');
			$('.preloader').removeClass('visible');
  			Box.autoClose('最新留言获取失败，请检查网络');
  		}
  	});
  }
  $(function(){
	  initMySwiper();
  });
  $(function(){
	  /* var heightAll = document.body.clientHeight;
	  var heightTop = document.getElementsByTagName("header")[0].offsetHeight;
	  var heightMessage = heightAll-heightTop;
	  var swiperContainer = document.getElementById("swiper-container");
	  var preloader = document.getElementById("preloader");
	  preloader.style.top = heightTop;
	  swiperContainer.style.height = heightMessage; */
	  var heightAll = document.body.clientHeight;
	  var swiperContainer = document.getElementById("swiper-container");
	  var preloader = document.getElementById("preloader");
	  //var heightTop = document.getElementsByTagName("header")[0].offsetHeight;
	  preloader.style.top = 0;
	  swiperContainer.style.height = heightAll;
  });
  
  </script>
</body>
</html>
