<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>SYE${list[0].area}办欢迎你</title>
    <link href="${contextPath}/css/area-home.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
    var contextPath = '${contextPath}';
    var userId='${userId}';
    var domain = '${domainName}';
    var areaName='${list[0].area}';
    var isUpdateUser = '${isUpdateUser}';
    var type = "footerAddHome";
    function no_development(){
		Box.alert("敬请期待。。。");
	};
    </script>
    <script src="${contextPath}/js/jquery.js"></script>
    <script src="${contextPath}/js/footer.js"></script>
    <script src="${contextPath}/js/adswitch.js"></script>
    <script src="${contextPath}/js/box.js" type="text/javascript"></script>
    
</head>
<body>
<img class="phone" id="phone" src="${contextPath}/image/tellphone.png">
<header>
    <div class="bgBox">
        <ul class="picBox" id="picBox">
	        <c:forEach items="${syeBannerList}" var="banner">
	            <li>
	                <a href="${banner.syeBannerLink}"><img src="${contextPath}/pics/${banner.syeBannerUrl}"></a>
	                <p class="boxFont">SYE创业四川-${list[0].area}欢迎您</p>
	            </li>
        	</c:forEach>
            <%-- <li>
                <a href="#"><img src="${contextPath}/image/ad_01.png"></a>
                <p class="boxFont">SYE创业四川-${list[0].area}欢迎您</p>
            </li>
            <li>
                <a href="#"><img src="${contextPath}/image/ad_02.png"></a>
                <p class="boxFont">SYE创业四川-${list[0].area}欢迎您</p>
            </li>
            <li>
                <a href="#"><img src="${contextPath}/image/ad_02.png"></a>
                <p class="boxFont">SYE创业四川-${list[0].area}欢迎您</p>
            </li> --%>
        </ul>
        <div class="picIndex" id="picIndex"></div>
    </div>
</header>
<section class="notice">
    <div class="notice_left">
        <img src="${contextPath}/image/notice.png">
    </div>
    <div class="notice_right" id="moocBox">
        <ul>
            <li><a href="#">${sYENoticeList[0].syeNoticeContent}</a></li>
            <li><a href="#">${sYENoticeList[1].syeNoticeContent}</a></li>
            <li><a href="#">${sYENoticeList[2].syeNoticeContent}</a></li>
        </ul>
    </div>
</section>
<section class="head-menu">
    <ul>
        <li class="one">
            <img src="${contextPath}/image/area-youth.png">
            <div class="youth-number">
                <p>${list[0].youthCount}</p>
                <span>累计扶持青年/人</span>
            </div>
        </li>
        <li class="two">
            <img src="${contextPath}/image/area-tutor.png">
            <div class="tutor-number">
                <p>${list[0].tutorCount}</p>
                <span>导师志愿者/人</span>
            </div>
        </li>
        <li class="three">
            <img src="${contextPath}/image/area-time.png">
            <div class="tutor-time">
                <p>${list[0].tutorTime}</p>
                <span>导师累计时间/h</span>
            </div>
        </li>
        <li class="four">
            <img src="${contextPath}/image/area-money.png">
            <div class="money">
                <p>${list[0].money}</p>
                <span>累计扶持基金/万元</span>
            </div>
        </li>
    </ul>
</section>
<section class="body-menu">
	<div class="menu_tit"><b>创业者</b></div>
	<div style="background-color:white">
    <ul>
        <li>
            <a href="${contextPath}/ground/projectList?cityName=${list[0].area}" style="border-bottom:1px solid #e1e1e1;"><img src="${contextPath}/image/home-item1.png">SYE项目</a>
        </li>
        <li>
            <a href="${contextPath}/ground/apply" style="border-bottom:1px solid #e1e1e1;"><img src="${contextPath}/image/home-application1.png">我要创业</a>
        </li>
        <li>
            <a href="${contextPath}/ground/incubationParkList?cityName=${list[0].area}" style="border-bottom:1px solid #e1e1e1;"><img src="${contextPath}/image/home-incubation1.png">入驻孵化园</a>
        </li>
        <li>
            <a href="#"><img src="${contextPath}/image/application3.png" onclick="no_development()">创业商学院</a>
        </li>
        <li>
            <a href="https://www.wenjuan.com/s/VJNVFn/"><img src="${contextPath}/image/home-finance1.png">融资</a>
        </li>
         <li>
            <a href="#"><img src="${contextPath}/image/projectActivity.png" onclick="no_development()">创业活动</a>
        </li>
        <div style="clear:both"></div>
     </ul>
</div>
     <div class="menu_tit"><b>导师</b></div>
     <div style="background-color:white">
     <ul>
        <li>
            <a href="${contextPath}/pubUser/tutorList?cityName=${list[0].area}"><img src="${contextPath}/image/home-tutor1.png">导师志愿者</a>
        </li>
        <li>
            <a href="#"><img src="${contextPath}/image/tutor3.png" onclick="no_development()">导师俱乐部</a>
        </li>
        <li>
            <a href="#"><img src="${contextPath}/image/tutorActivity.png" onclick="no_development()">导师活动</a>
        </li>
        <div style="clear:both"></div>
      </ul>
      </div>
      <div class="menu_tit"><b>帮扶服务</b></div>
      <div style="background-color:white">
      <ul>
      	<li>
            <a href="${contextPath}/user/financial"><img src="${contextPath}/image/home-accountant1.png">财务</a>
        </li>
        <li>
            <a href="${contextPath}/user/legal"><img src="${contextPath}/image/home-lawyer1.png">法务</a>
        </li>
        <li>
            <a href="${contextPath}/ground/supportPolicy"><img src="${contextPath}/image/home-policy1.png">扶持政策</a>
        </li>
        <div style="clear:both"></div>
      </ul>  
    </div>
</section>
<div class="fill"></div>
<script type="text/javascript">
    window.onload=function(){
        footer.footerAddHome();
        banner();

        var areaPhone="";
        $.ajax({
    		url:'areaPhone',
    		type:'post',
    		dataType:'json',
    		data:{
    			cityName:areaName
    		},
    		success:function(data){
    			areaPhone=data.areaPhone;
    		},
    		error:function(data){
    			Box.autoClose('提交失败，请检查网络');
    		}
    	});
        
        var phone = document.getElementById('phone');
        phone.onclick = function(){
        	Box.alert("请拨打SYE办公室电话"+areaPhone,function(){
        		location.href='tel:'+areaPhone;
        	});
        };
    };
    var area = document.getElementById('moocBox');
    var iliHeight = 25;//单行滚动的高度
    var speed = 50;//滚动的速度
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
</script>
</body>
</html>