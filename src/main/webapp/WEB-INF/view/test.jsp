<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/app.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/box.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-form.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.qrcode.min.js"></script>
    <script src="${contextPath}/js/jquery-form.js" type="text/javascript"></script>
    <script src="${contextPath}/js/upload/compressimg.0.1.js" type="text/javascript"></script>
    <script type="text/javascript">
		App.data.wechat.apis = ['scanQRCode','chooseImage','previewImage'];
		App.data.wechat.API_NAMEs = {'scanQRCode':'微信扫一扫','chooseImage':'选取图片','previewImage':'预览图片'};
		chooseImg = function(){
			wx.chooseImage({
			    count: 3, // 默认9
			    sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
			    sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
			    success: function (res) {
			        var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
			        alert(localIds);
			        if(localIds){
				        $('#img').attr('result',localIds);
				        $('#fileForm').ajaxSubmit();
			        }
			    }
			});
		};
		$(function(){
			$("#qrCode").qrcode({width:200,height:200,correctLevel:0,text:"3d1d037e-b56f-4ae0-810d-b78b448ce735"});
		});
		$(function(){
			var isIOS = /(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent);
			var msgPrefix = "sms:15882376873";
			var msgSuffix = "body=张律师，我有关于创业项目xxxxx的事情想咨询你：";
			$("#msg").attr("href",msgPrefix+(isIOS?"&":"?")+msgSuffix);
		});
		$(function(){
			/* WeixinJSBridge.invoke('sendAppMessage',{
                "appid": appid,
                "img_url": imgUrl,
                "img_width": "640",
                "img_height": "640",
                "link": lineLink,
                "desc": descContent,
                "title": shareTitle
                }, function(res) {
                _report('send_msg', res.err_msg);
                }); */
		});
		function previewImg() {
			wx.previewImage({
			    current: 'http://hiphotos.baidu.com/exp/pic/item/cf5a8316fdfaaf513bc91c5d8e5494eef11f7aef.jpg', // 当前显示图片的http链接
			    urls: [
					   'http://hiphotos.baidu.com/exp/pic/item/cf5a8316fdfaaf513bc91c5d8e5494eef11f7aef.jpg',
			           'http://hiphotos.baidu.com/exp/pic/item/d35a10f41bd5ad6ed239f60883cb39dbb4fd3cd4.jpg',
			           'http://hiphotos.baidu.com/exp/pic/item/027a45b5c9ea15cea6377debb4003af33b87b23c.jpg'] // 需要预览的图片http链接列表
			});
		};
		$(function(){
			$('#img').change(function(event){
				if(Compress.isCanvasSupported()){
					Compress.compress(event,function(imgData){
						$.ajax({
				    		url:'${contextPath}/test/doCreate',
				    		type:'post',
				    		dataType:'json',
				    		data:{img:encodeURIComponent(imgData)},
				    		success:function(data){
				    			Box.autoClose('提交成功');
				    		},
				    		error:function(data){
				    			Box.autoClose('提交失败，请检查网络');
				    		}
				    	});			
					});
				}else{
					alert('不支持图片压缩');
				}
				
			});
		});
    </script>
    <%@include file="jspf/wechatInit.jspf"%>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sweep.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/shake.js"></script>
    <style type="text/css">
    	div{
    		line-height: 40px;
    	}
    </style>
</head>
<body>
<h2>摇一摇!</h2>
	<a href="javascript:Sweep.sweep();">扫一扫!</a><br/>
	<a href="javascript:chooseImg();">选图片!</a><br/><br/><br/>
	<a href="javascript:previewImg();">预览图片!</a><br/><br/><br/>
	<form id="fileForm" action="${contextPath}/pub/doCreate" method="post">
        <input id="img" type="file" name="img" multiple="multiple"/>
    </form>
	<br/>
	<br/>
	<br/>
	<div>按我打电话1：<a href="tel:15882376873">15882376873</a></div>
	<div>按我打电话2：<a href="wtai://wp/mc;15882376873">15882376873</a></div>
	<!-- <div><a href="sms:15882376873?body=张律师，我有关于创业项目xxxxx的事情想咨询你：">给我留言android版</a></div>
	<div><a href="sms:15882376873">给我留言iphone版1</a></div>
	<div><a href="sms:15882376873&body=张律师，我有关于创业项目xxxxx的事情想咨询你：">给我留言iphone版2</a></div> -->
	<div><a href="#" id="msg">给我留言</a></div>
	<div><a href="#" id="share">分享好友</a></div>
	<br/>
	<div>我有二维码！</div>
	<div id="qrCode"></div>
	<c:if test="${hasSubscribe == true }">
		<div id="hasSubscribe">已关注</div>
	</c:if>
	<c:if test="${hasSubscribe == false }">
		<div id="hasSubscribe">没有关注，<a href="http://mp.weixin.qq.com/s?__biz=MzI3ODA4MDEyMw==&mid=400748704&idx=1&sn=aaa3b6a2d138f50b9959b25d0a83520b#rd">点击关注</a></div>
	</c:if>
	<hr>
	<div>文件上传</div>
	
</body>
</html>
