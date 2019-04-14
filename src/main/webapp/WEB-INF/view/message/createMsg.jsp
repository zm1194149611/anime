<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>留言</title>
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/rankMessage.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/js/preview.js" type="text/javascript"></script>
    <script src="${contextPath}/js/box.js" type="text/javascript"></script>
    <script src="${contextPath}/js/jquery.js" type="text/javascript"></script>
    <script src="${contextPath}/js/jquery-form.js" type="text/javascript"></script>
    <script src="${contextPath}/js/footer.js" type="text/javascript"></script>
    <script src="${contextPath}/js/upload/compressimg.0.1.js" type="text/javascript"></script>
    <script type="text/javascript">
       var contextPath = '${contextPath}';
       var userId='${user.id}';
       var domain = '${domainName}';
       var isUpdateUser = '${isUpdateUser}';
       var type = "footerAddSubMenu";
    	var isCommiting = false;
    	var imgURL = "";
    	//上传普通图片（非压缩。在客户端不支持压缩或者图片小于100k，不需要压缩时调用）。
    	//上传成功后，会执行留言内容和留言文件名的form提交。
    	function doCreateWithImg(msg){
    		isCommiting = true;
    		$('#createForm').ajaxSubmit({
				 type:'post',
				 dataType:'json',
				 success: function(data, status){
					 try {
						 isCommiting = false;
						 if(data.exceptionMsg){
							Box.autoClose(data.exceptionMsg);
						 }else{
							 imgURL = data.result;
							 //alert(imgURL);
							 doCreateWithMsgOnly(msg);
						 }
					 } catch (e) {
						Box.close();
					 }
                },
                error: function (data, status, e){  
                	Box.close();
                	isCommiting = false;
                    Box.autoClose('提交失败，请检查网络');
                }
           });
    	}
    	//上传压缩图片。
    	//上传成功后，会执行留言内容和留言文件名的form提交。
    	function doCreateWithCompressImg(msg,imgData){
    		isCommiting = true;
    		$.ajax({
    			 url:"${contextPath}/project/uploadCompressFile",
				 type:'post',
				 data:{img:encodeURIComponent(imgData)},
				 dataType:'json',
				 success: function(data, status){
					 try {
						 Box.close();
						 isCommiting = false;
						 if(data.exceptionMsg){
							Box.autoClose(data.exceptionMsg);
						 }else{
							 imgURL = data.result;
							 //alert(imgURL);
							 doCreateWithMsgOnly(msg);
						 }
					 } catch (e) {
					 }
                },
                error: function (data, status, e){  
                	Box.close();
                	isCommiting = false;
                    Box.autoClose('提交失败，请检查网络');
                }
           });
    	}

        function fontNum(fieldId,maxlimit){
            var field =document.getElementById(fieldId);
            field.onkeyup = function(){
                if (field.value.length > maxlimit){
                    field.value = field.value.substring(0, maxlimit);
                }else{
                    var label = document.getElementById("messageNum");
                    label.innerHTML = maxlimit - field.value.length;
                }
            };
        }
        
        //提交留言（提交留言和文件名）
    	function doCreateWithMsgOnly(msg){
    		$("#textOnlyMsg").val(msg);
    		$("#imgURL").val(imgURL);
    		isCommiting = true;
    		$('#createFormTextOnly').ajaxSubmit({
				 type:'post',
				 dataType:'json',
				 success: function(data, status){
					 Box.close();
					 isCommiting = false;
					 if(data.exceptionMsg){
						Box.autoClose(data.exceptionMsg);
					 }else{
						imgURL = "";
						Box.leftmsg('留言提交成功，审核通过后，可到留言板查看',function(){
						//	WeixinJSBridge.invoke('closeWindow',{},function(res){});
							location.href="${contextPath}/ground/scrollMobilePage";
						},function(){
							$('textarea[name="msg"]').val("");
							$('#preview').css('display','none');
						});
						
						//document.getElementById("preview").setAttribute("src", "");
					 }
               },
               error: function (data, status, e){  
            	   Box.close();
            	   isCommiting = false;
                   Box.autoClose('提交失败，请检查网络');
               }
          });
    	}
    	//图片压缩需要file input的change事件，在文件change时记录，提交时使用。
    	var fcEvent = {};
    	$(function(){
    		$('#img_file').change(function(event){
    			fcEvent = event;
    		});
    	});
    	$(function(){
    		fontNum("messageNew",60);
    		footer.footerAddSubMenu();
    		$('#preview').css('display','none');
    		$('div .submit').click(function(){
    			var msg = $('textarea[name="msg"]').val();
    			if(!msg){
    				Box.autoClose('请输入您的留言');
    				return;
    			}
    			var img = $('#img_file').val();
    			if(isCommiting){
    				Box.autoClose('正在提交，请稍候...');
    				return;
    			}
    			//不关闭的遮罩，后面的"."自动添加，别画蛇添足自己加上。
   				Box.noAutoClose('正在提交，请稍候');
    			if(img){
    				if(Compress.isCanvasSupported()&&Compress.isNeedCompress(fcEvent)){
						Compress.compress(fcEvent,function(imgData,msg){
							doCreateWithCompressImg(msg,imgData);
						},msg);
					}else{
						doCreateWithImg(msg);
					}
    			}else{
    				doCreateWithMsgOnly(msg);
    			}
    		});
    	});
    </script>
</head>
<body>
<header>
    <img class="boder" src="${contextPath}/image/messageAdd1.png">
    <div>
        <img src="${contextPath}/image/messageAdd2.png">
        <p>留言抽大奖</p>
    </div>
    <img class="boder" src="${contextPath}/image/messageAdd.png">
</header>
<article>
    <img class="boder" src="${contextPath}/image/messageAdd1.png">
    <div class="content">
        <div class="font">
            <p>各位朋友：</p>
            <p>
                创业路上，苦难与甜蜜共存，记录下这段旅程上的真实感受吧，我们共同分享，一起成就未来！
            </p>
            <span></span>
        </div>
        <form class="form" id="createForm" action="${contextPath}/leftMessage/doCreate" method="post">
            <textarea name="msg" id="messageNew" placeholder="写下您的感受..."></textarea>
            <p>您还可输入<span id="messageNum">60</span>字</p>
            <div class="imgBox">
                <div>
                	<img id="preview" src=""/>
                    <img src="${contextPath}/image/imgMore.png">
                    <label id="img_name">上传照片(仅限一张)</label>
                </div>
                <input id="img_file" name="img"  type="file" accept="image/*" value="点击此处上传图片"/>
            </div>
        </form>
        <form id="createFormTextOnly" action="${contextPath}/leftMessage/doCreateWithoutFile" method="post">
        		<textarea id="textOnlyMsg" name="msg" style="display:none;"></textarea>
        		<input id="imgURL" type="hidden" name="imgURL"/>
        </form>
        <div class="submit">
            <span id="submit">提交</span>
        </div>
    </div>
    <img class="boder" src="${contextPath}/image/messageAdd.png">
</article>
<div class="foot-fill"></div>
</body>
</html>
