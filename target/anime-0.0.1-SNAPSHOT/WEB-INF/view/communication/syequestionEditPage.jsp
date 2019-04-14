<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>互动</title>    
    <link href="${contextPath}/css/questionImg.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/js/question.js" type="text/javascript"></script>
    <script src="${contextPath}/js/scroll/TouchLine.js"></script>
    <script src="${contextPath}/js/jquery-2.1.4.min.js"></script>
    <script src="${contextPath}/js/jquery.js"></script>
    <script src="${contextPath}/js/box.js"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript">
        $(function(){
            var address;
            var industry;
            var statu;
            $(".clickTop").click(function(){
                var list = $(this).parent("ul").children("li");
                var thisId = $(this).attr("id");
                for(var i=0;i<list.length;i++){
                    if($("#"+list[i].getAttribute("id")).children("a").attr("class") == "yes"){
                        if(thisId == list[i].getAttribute("id")){
                            //alert("不能重复选择");
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
                        //address = addressList[i].getAttribute("id");  
                        address = addressList[i].getElementsByTagName("a")[0].innerHTML;
                        break;
                    }
                }
                document.getElementById('syeQuestionArea').value=address;
                for(var i=0;i<industryList.length;i++){
                    if(industryList[i].lastChild.getAttribute("class") == "yes"){
                        //industry = industryList[i].getAttribute("id");
                        industry = industryList[i].getElementsByTagName("a")[0].innerHTML;
                        break;
                    }
                }
                document.getElementById('syeQuestionBusiness').value=industry;
                for(var i=0;i<statuList.length;i++){
                    if(statuList[i].lastChild.getAttribute("class") == "yes"){
                        //statu = statuList[i].getAttribute("id");
                        statu = statuList[i].getElementsByTagName("a")[0].innerHTML;
                        break;
                    }
                }
                document.getElementById('syeQuestionType').value=statu;              
            });
        });
    </script>
    <script type="text/javascript">
    var isUpdateUser = '${user.interactionUpdate}';
	var type = "footerAddTalk";
	var imgCount = 1;//上传数量
	var timestamp = ${timestamp};//时间戳
	var appId = '${appId}';//公众号id
	var nonceStr = '${nonceStr}';//签名随机字符串
	var signature = '${signature}';//签名
	var filePath;//返回的上传路劲
	var url = "${contextPath}/communication/doUpload";//上传图片地址
	var images = {
		localId:[],
		serverId:[],
		downloadId:[]
	};
	  /*以下是jssdk上传图片*/
    wx.config({
    	debug : false,
    	appId : appId,// 必填，公众号的唯一id
    	timestamp : timestamp,// 必填，生成签名时间戳
    	nonceStr : nonceStr,// 必填，生成签名的随机串
    	signature : signature,// 必填，生成的签名
    	jsApiList : [ 
    	        'checkJsApi',
    	        'chooseImage', 
    	        'uploadImage', 
    	        'downloadImage',
    			'previewImage' ]// 必填，需要使用的JS接口列表
    });
    /*选择图片*/
    function chooseImage(type){
    	var sizeType = [ 'compressed' ];
    	wx.ready(function(){    		
    		wx.chooseImage({
    			count : imgCount, // 默认9
    			sizeType : sizeType, // 可以指定是原图还是压缩图，默认二者都有
    			sourceType : [ 'album', 'camera' ], // 可以指定来源是相册还是相机，默认二者都有 
    			success : function(res) {    			
    				images.localId = res.localIds;
    			},
    			complete:function(){
    				uploadImage(type);//选图完成后调用上传图片函数
    			}
    		});
    		
    	});
    }
    /*上传图片到微信服务器*/
    function uploadImage(type){
    	wx.ready(function(){
    		$.each(images.localId,function(i,data){   			
    			wx.uploadImage({
    				localId:data,
    				success:function(res){
    					images.serverId.push(res.serverId);
    				},
    				fail:function(res){   
    					alert(JSON.stringfy(res));
    				},
    				complete:function(){
    					downloadImage(type);//上传图片到微信服务器上之后调用下载图片函数
    				}
    			})
    		})
    	})
    }
    /*下载图片到自己的服务器*/
    function downloadImage(type){
    	$.each(images.serverId,function(i,data){
    		var media_id = data;
    		$.ajax({
    			url:"${contextPath}/communication/doUpload",
    			type:"post",
    			dataType:"json",
    			data:{"media_id":media_id},
    			success:function(data){
    				var fileName = data.fileName;   			
    				if(type=="prjPic"){
    					$("#proImg").append('<img src="${contextPath}/pics/upload/'+ fileName +'" onclick="deleteImg(this);"/>');
    					images.localId=[];
    					images.serverId=[];
    				}
    			},
    			complete:function(){
    				var names = "";
    				var name = "";
    				var domin=window.location.protocol+"//"+window.location.host;
    				$.each($("#proImg").children(),function(i,data){   					
    					name = $(data).attr("src");
    					names = name+","+names;    
    				})
    				$("#prjPic").val(names);  			
    			}
    		});
    	});
    }
    /*
	 *触发input的onclick事件
	 */
	 var projPicCount = 0;
	function fileClick(fileId){
		var spanId=document.getElementById('spanId');
		spanId.style.display='none';
		if(projPicCount>=4){
			Box.autoClose("注意，最多上传4张照片");
			return;
		}
		projPicCount++;
		chooseImage("prjPic");
	}
	function deleteImg(obj){
		$(obj).remove();
		projPicCount--;
		
		var names = "";
		var name = "";
		$.each($("#proImg").children(),function(i,data){
			name = $(data).attr("src")
			names = name.substring(name.lastIndexOf("pics/")+5)+","+names;
			
		})
		$("#prjPic").val("hahahhah");
	}	
    </script>
</head>
<body>
<form action="${contextPath}/communication/addOrUpdateQuestion" method="post" id="syequestion">
   <input id="syeQuestionArea" type="hidden" name="syeQuestionArea" value="">
   <input id="syeQuestionBusiness" type="hidden" name="syeQuestionBusiness" value="">
   <input id="syeQuestionType" type="hidden" name="syeQuestionType" value="">
   <input id="syeQuestionContent" type="hidden" name="syeQuestionContent" value="${syeQuestion.syeQuestionContent}">
   <input id="imgs" type="hidden" name="imgs" value="">
<!--    <input id="imgTwo" type="hidden" name="imgTwo" value="">
   <input id="imgThree" type="hidden" name="imgThree" value="">
   <input id="imgFour" type="hidden" name="imgFour" value=""> -->
   <input id="userId" type="hidden" name="userId" value="${user.id}">
<header>
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
<section>
    <div class="question">
        <textarea id="syeQuestionContentTemp">${question.syeQuestionContent}</textarea>
        <span>还可以输入<label>100</label>字</span>
    </div>
		<div class="view">
			<div class="imgBox2">
				<img onclick="changeImg('prjPic','0');" id="preview_prjPic_0" src="" style="display: none"> 
				<img onclick="changeImg('prjPic','1');" id="preview_prjPic_1" src="" style="display: none"> 
				<img onclick="changeImg('prjPic','2');" id="preview_prjPic_2" src="" style="display: none"> 
				<img onclick="changeImg('prjPic','3');" id="preview_prjPic_3" src="" style="display: none"> 
				<span id="proImg"></span>
				<img onclick="fileClick('prjPic');" src="${contextPath}/image/imgMore.png">
				<span id='spanId'>上传图片，最多4张</span>
				<input name="prjPic" id="prjPic" type="hidden" title="互动照片" minsize="0" maxsize="4" value=""/>				
			</div>
		</div>
		<div class="submit" onclick="addOrUpdate()">
        <span>提交</span>
    </div>
    <div class="fill"></div>
</section>
</form>
<script>
    new TouchLine({
        container : document.getElementById('industry'),//id名称
        nodeTagName : 'li'//子元素标签名称
    });
    new TouchLine({
        container : document.getElementById('statu'),//id名称
        nodeTagName : 'li'//子元素标签名称
    });
   
	function addOrUpdate() {
		checkDetails('industry', "全部行业");
		checkDetails('statu', "全部类型");
		if (check()) {
			var syeQuestionContentTemp = document.getElementById("syeQuestionContentTemp").value;
			document.getElementById("syeQuestionContent").value = syeQuestionContentTemp;
		/* 	document.getElementById("imgOne").value = document.getElementById("preview_prjPic_0").src;
			document.getElementById("imgTwo").value = document.getElementById("preview_prjPic_1").src;
			document.getElementById("imgThree").value = document.getElementById("preview_prjPic_2").src;
			document.getElementById("imgFour").value = document.getElementById("preview_prjPic_3").src; */
			document.getElementById("imgs").value = $("#prjPic").val();
			var frm = document.getElementById("syequestion");	
			frm.submit();
		}

	}
	function check() {
		if (yes2 && yes3) {
			return true;
		} else {
			alert("请选择具体的行业和类型！");
			return false;
		}
	}
	function checkDetails(total, type) {
		var all = document.getElementById(total);
		var totalDetails = all.getElementsByTagName('li');
		for (var i = 0; i < totalDetails.length; i++) {
			var one = totalDetails[i].getElementsByTagName('a')[0];
			if (one.innerHTML != type && one.className == "yes") {
				if (total == 'industry') {
					yes2 = true;
					break;
				}
				if (total == 'statu') {
					yes3 = true;
					break;
				}
			} else {
				if (total == 'industry') {
					yes2 = false;
				}
				if (total == 'statu') {
					yes3 = false;
				}
			}
		}
	}
</script>
</body>
</html>