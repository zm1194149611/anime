<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name='apple-mobile-web-app-capable' content='yes' />
<title>互动</title>
<style type="text/css">
#loading {
	display: none;
	width: 100%;
	height: 20px;
	background-color: rgba(0, 0, 0, 0.4);
	text-align: center;
	position: fixed;
	z-index: 19;
	bottom: 68px;
	padding-top: 4px;
}

#loadingText {
	width: auto;
	color: #fff;
	font-size: 13px;
}
</style>
<link href="${contextPath}/css/interactionCommunication.css"
	rel="stylesheet" type="text/css">
<link href="${contextPath}/css/public.css" rel="stylesheet"
	type="text/css">
<link href="${contextPath}/css/footer.css" rel="stylesheet"
	type="text/css">
<script src="${contextPath}/js/base.js" type="text/javascript"></script>
<script src="${contextPath}/js/box.js" type="text/javascript"></script>
<script src="${contextPath}/js/jquery-2.1.4.min.js"></script>
<script src="${contextPath}/js/footer.js" type="text/javascript"></script>
<script src="${contextPath}/js/scroll/TouchLine.js"></script>
<script src="${contextPath}/js/app.js" type="text/javascript"></script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
</head>
<body>
	<input id="userId" type="hidden" name="userId" value="${user.id}">
	<input id="pageStart" type="hidden" name="pageStart" value="5">
		<a href="javascript:void(0);" onclick="peopleByActivity('write','${user.id}','${user.certification}')"><img class="write" id="write"
		src="${contextPath}/image/interaction-write.png"></a>
	<c:if test="${user !=null && user !=''}">
		<a href="javascript:void(0);" onclick="peopleByActivity('activity','${user.id}','${user.certification}')"><img class="write1" id="write1"
			src="${contextPath}/image/interaction-word-list.png"></a>
	</c:if>
	<header>
		<div class="navtab">
			<ul id="address" class="ul1">
				<li id="address0" class="clickTop"><a class="yes">全部区域</a></li>
				<li id="address1" class="clickTop"><a>成都</a></li>
				<li id="address2" class="clickTop"><a>自贡</a></li>
				<li id="address3" class="clickTop"><a>攀枝花</a></li>
				<li id="address4" class="clickTop"><a>泸州</a></li>
				<li id="address5" class="clickTop"><a>德阳</a></li>
				<li id="address6" class="clickTop"><a>绵阳</a></li>
				<li id="address7" class="clickTop"><a>广元</a></li>
				<li id="address8" class="clickTop"><a>遂宁</a></li>
				<li id="address9" class="clickTop"><a>内江</a></li>
				<li id="address10" class="clickTop"><a>乐山</a></li>
				<li id="address11" class="clickTop"><a>南充</a></li>
				<li id="address12" class="clickTop"><a>宜宾</a></li>
				<li id="address13" class="clickTop"><a>广安</a></li>
				<li id="address14" class="clickTop"><a>达州</a></li>
				<li id="address15" class="clickTop"><a>巴中</a></li>
				<li id="address16" class="clickTop"><a>雅安</a></li>
				<li id="address17" class="clickTop"><a>眉山</a></li>
				<li id="address18" class="clickTop"><a>资阳</a></li>
				<li id="address19" class="clickTop"><a>阿坝</a></li>
				<li id="address20" class="clickTop"><a>甘孜</a></li>
				<li id="address21" class="clickTop"><a>凉山</a></li>
			</ul>
		</div>
		<div class="navtab">
			<ul id="industry" class="ul1">
				<li id="industry0" class="clickTop"><a class="yes">全部行业</a></li>
				<li id="industry1" class="clickTop"><a>农林牧渔</a></li>
				<li id="industry2" class="clickTop"><a>批发零售</a></li>
				<li id="industry3" class="clickTop"><a>商务服务业</a></li>
				<li id="industry4" class="clickTop"><a>计算机软件</a></li>
				<li id="industry5" class="clickTop"><a>住宿餐饮</a></li>
				<li id="industry6" class="clickTop"><a>文化体育</a></li>
				<li id="industry7" class="clickTop"><a>教育培训</a></li>
				<li id="industry8" class="clickTop"><a>水利能源</a></li>
				<li id="industry9" class="clickTop"><a>其他</a></li>
			</ul>
		</div>
		<div class="navtab">
			<ul id="statu" class="ul1">
				<li id="statu0" class="clickTop"><a class="yes">全部类型</a></li>
				<li id="statu1" class="clickTop"><a>政策咨询</a></li>
				<li id="statu2" class="clickTop"><a>创业问题</a></li>
				<li id="statu3" class="clickTop"><a>创业留言</a></li>
			</ul>
		</div>
		<div class="fill"></div>

	</header>
	<article>
		<section>
			<div id="interactionSection"></div>
			<div id="showMore">
				<span></span> <a href="javascript:void(0);">没有更多互动了</a> <span></span>
			</div>
			<div id="loading">
				<span id="loadingText">正在加载，请稍候...</span>
			</div>
		</section>
	</article>
	<div class="foot-fill"></div>
	
	<script type="text/javascript">
		var contextPath = '${contextPath}';		
		var openId = '${openId}';
		var userId = '${user.id}';
		var activityId = '${ap.id}';
		var url = '${url}';
		var start = 0;
		var size = 4;
		var loading = false;
		var showMore = false;
		var address=null;
		var industry=null;
		var statu=null;
		var pageStart = 0;
		var domain = '${domainName}';
		var isUpdateUser = '${isUpdateUser}';
		var type = "footerAddTalk";//加载页脚的方式
		/* 加载页脚 footer.js  */
		$(function() {
			footer.footerAddTalk();
		});
		/* 加载头部选择列表    */
		new TouchLine({
			container : document.getElementById('address'),//id名称
			nodeTagName : 'li'//子元素标签名称
		});
		new TouchLine({
			container : document.getElementById('industry'),//id名称
			nodeTagName : 'li'//子元素标签名称
		});
		new TouchLine({
			container : document.getElementById('statu'),//id名称
			nodeTagName : 'li'//子元素标签名称
		});
	</script>
	<script type="text/javascript">
	window.onload=function(){	
		var userId=document.getElementById('userId').value;
		footer.footerAddTalk(footerUserId);
	    var write=document.getElementById('write'); 
	    write.onclick= function () {
	    	$.ajax({
	    		url:"${contextPath}/communication/judgeUser",
	    		data:{"userId":userId},
	            type:"post",
	            dataType:"json",
	            success:function(data){   
	            	alert("succ");
	            	if(data[0] ==null){
	            		//Box.alert("请先注册或登录",userLogin());
	            		Box.prompt("您还没登录，请先登录！","${contextPath}/pub/login");
	            		return;
	            	}
	            	if(data[0].certification==""){             		
	            		Box.prompt("请完善信息！","${contextPath}/user/homecenter?userId="+userId);
	            	}else{
	            		window.open("${contextPath}/syequestion/edit.do?userId="+userId,"_self");
	            	}
	            },
	            error:function(){
	            	alert("error");
	            }
	        });	       
	    };   
	};

	 $(function(){
         $(".clickTop").click(function(){
             var list = $(this).parent("ul").children("li");
             var thisId = $(this).attr("id");
             for(var i=0;i<list.length;i++){
                 if($("#"+list[i].getAttribute("id")).children("a").attr("class") == "yes"){
                     if(thisId == list[i].getAttribute("id")){                          
                         return;
                     }
                     $("#"+list[i].getAttribute("id")).children("a").removeAttr("class")
                 }
             }
             $(this).children("a").attr("class","yes");
             var addressList = $("#address").children("li");
             var industryList = $("#industry").children("li");
             var statuList = $("#statu").children("li");
             for(var i=0;i<addressList.length;i++){
                 if(addressList[i].lastChild.getAttribute("class") == "yes"){
                     address = addressList[i].getElementsByTagName("a")[0].innerHTML;
                     if(address=="全部区域"){
                     	address=null;
                     } 
                     break;
                 }
             }
             for(var i=0;i<industryList.length;i++){
                 if(industryList[i].lastChild.getAttribute("class") == "yes"){	 
                     industry = industryList[i].getElementsByTagName("a")[0].innerHTML;
                     if(industry=="全部行业"){
                     	industry=null;
                     }
                     break;
                 }
             }
             for(var i=0;i<statuList.length;i++){
                 if(statuList[i].lastChild.getAttribute("class") == "yes"){
                     statu = statuList[i].getElementsByTagName("a")[0].innerHTML;
                     if(statu=="全部类型"){
                     	statu=null;
                     }
                     break;
                 }
             }
             start = 0;
			 loadList(false);
         });
		});
	 
		$(window).scroll(function() {
			console.log('showMore', showMore);
			if (App.windowReachBottom() == true && showMore == 'true') {
				queryMoreList();
			}
		});
		
		function queryMoreList() {
			start += size;
			loadList(true);
		}
		
		var $showMore = '';
     	var $loading = '';
     	$(function(){
     		$showMore=$('#showMore');
     		$loading=$('#loading');
     		loadList(false);     		
     	});
     	
     	function showClickMore(isShow){
     		showMore = isShow;
     		if(isShow){
     			$showMore.hide();
     		}else{
     			$showMore.show();
     		}
     	}; 
     	
		function loadList(isAppend){
     		if(loading){
     			Box.autoClose("互动载入中，请稍候...");
     			return;
     		}
     		loading=true;
     		var url = "${contextPath}/communication/interactionList?start="+start+
     				"&size="+size+"&questionArea="+encodeURI(encodeURI(address))+"&questionType="+encodeURI(encodeURI(statu))+"&questionBusiness="+encodeURI(encodeURI(industry))+"&userId="+userId;     		
     		$loading.show();
     		$.get(url,function(data,status){
     			$loading.hide();
     			console.log('isAppend',isAppend);
     			console.log('data',data);
     			if(isAppend){
     				$("#interactionSection").append(data);
     			}else{
     				$("#interactionSection").html(data);
     			}
     			loading = false;
     		});
     	}
		
		/* 跳转个人问题展示界面  */
		function peopleByActivity(mark,userId,certification){
			var url ="";
			if(mark == "write"){
				url += '${contextPath}/communication/writeByUser?userId='+userId;
			}
			if(mark == "activity"){
				url +='${contextPath}/communication/interactionListByUser?userId='+userId;
			}
			if(userId == null || userId ==""){
				Box.prompt("您还没登录，请先登录！","${contextPath}/pub/login");
        		return;
			}
			if(certification == ""){
				Box.prompt("请完善信息！","${contextPath}/user/homecenter?userId="+userId);
			}else{
        		window.open(url,"_self");
        	}
		}
	</script>
</body>
</html>