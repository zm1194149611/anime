<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head lang="en">
	<script>
	var imgCount = 1;//上传数量
	var timestamp = ${timestamp};//时间戳
	var appId = '${appId}';//公众号id
	var nonceStr = '${nonceStr}';//签名随机字符串
	var signature = '${signature}';//签名
	var filePath;//返回的上传路劲
	var url = "${contextPath}/user/doUpload";//上传图片地址
	var flag = false;//上传图片完成标志
	var images = {
		localId:[],
		serverId:[],
		downloadId:[]
	};
	</script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>添加足迹</title>
    <link href="${contextPath}/css/addFootprint.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/js/addFootprint.js" type="text/javascript"></script>
    <script type="text/javascript" src="${contextPath}/js/box.js" ></script>
    <script src="${contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${contextPath}/js/jquery-form.js" ></script>
    <script type="text/javascript" src="${contextPath}/js/app.js"></script>
    <script type="text/javascript" src="${contextPath}/js/json2.js"></script>
    <script src="${contextPath}/js/upload/compressimg.0.1.js" type="text/javascript"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript">
     function prjTrack(tracktime,topic,trackimg){
    	 this.tracktime=tracktime;
    	 this.topic=topic;
    	 this.trackimg=trackimg;
    	// this.projectId=projectId;
     }
	function splitDateStr(dateStr){
     	var returnArray = new Array(3);
     	returnArray = dateStr.split("-");
     	return returnArray;
     }
	function getNowFormatDate() {
	    var date = new Date();
	    var seperator1 = "-";
	    var seperator2 = ":";
	    var month = date.getMonth() + 1;
	    var strDate = date.getDate();
	    if (month >= 1 && month <= 9) {
	        month = "0" + month;
	    }
	    if (strDate >= 0 && strDate <= 9) {
	        strDate = "0" + strDate;
	    }
	    var currentdate = date.getFullYear() + "-" + month + "-" + strDate;
	    return currentdate;
	}
     function submit(){
    	 /*var stringTime = "2014-07-10 10:21:12";
    	 var timestamp2 = Date.parse(new Date(stringTime));
    	 timestamp2 = timestamp2 / 1000;
    	 console.log(stringTime + "的时间戳为：" + timestamp2);*/

    	 var stringTime=$("#year").val()+"-"+$("#month").val()+"-"+$("#day").val();
	 	var testDate = splitDateStr(stringTime);
	 	var nowDate=splitDateStr(getNowFormatDate());
		var timestamp2 = Date.parse(new Date(testDate[0],testDate[1]-1,testDate[2]));  
		var timestamp3 = Date.parse(new Date(nowDate[0],nowDate[1]-1,nowDate[2]));   
		if(timestamp2>timestamp3){
			Box.autoClose("添加足迹时间不能大于当前时间");
			return;
		}
		//var timestamp2=Date.parse(new Date(stringTime));
    	 var data=JSON.stringify(new prjTrack(timestamp2,$("#devise").val(),$('input[name="prjPic"]').val()));
    	 $.ajax( {
 	        type : "post",  
 	        url : "saveuserTrack",  
 	        data:{jsonString:data},
 	        dataType:"json",  
 	        success : function(data) {  
 	            if(data.exceptionCode){
 	            	Box.autoClose(data.exceptionMsg);
 	            }
 	            else
 	            location.href="${contextPath}/user/userTrack?userId=${userId}";
 	        },
 	        error:function(data){
 	        	Box.autoClose("保存失败，请检查网络");
 	        }
 		}); 
    	 
     }
    </script>
    <script type="text/javascript">
    	//项目基本资料(包含已上传的文件名)提交时使用
    	var ProjectCreate={
    			created:false,
    			fileParentChildren:{},
    			checkFileLength:function(fileInput){
    				var fileComp = ProjectCreate.fileParentChildren[fileInput.name];
    				if(!fileComp){
    					return true;
    				}
    				var fileNames = fileComp.name;
    				var maxSize = fileInput.getAttribute('maxsize');
    				var minSize = fileInput.getAttribute('minsize');
    				maxSize = maxSize?maxSize:100;
    				minSize = minSize?minSize:0;
    				if(!fileNames||fileNames.length<minSize){
    					Box.autoClose(fileInput.title+'最少上传'+minSize+'张');
    					return false;
    				}else if(fileNames.length>maxSize){
    					Box.autoClose(fileInput.title+'最多上传'+maxSize+'张');
    					return false;
    				}
    				return true;
    			},
    			beforeSubmitTextForm:function(passImt){
    				if(ProjectCreate.created){
    					Box.autoClose('已提交成功，不用重复提交');
    					return false;
    				}
    				if(!passImt){
    					passImt={};
    				}
    					var currInput ;
    				    currInput= $("input[name='prjPic']");
    					var inputValue = currInput.val();
    					if('file'==currInput.type){
    						var fileUpStatus = ProjectCreate.fileParentChildren[currInput.name];
    						if(!fileUpStatus.name&&fileUpStatus.status=='uploading'&&!passImt[currInput.name]){
    							Box.autoClose(currInput.title+'正在上传，请稍候...');
        						return false;
    						}else if(fileUpStatus.name&&fileUpStatus.status=='uploading'&&!passImt[currInput.name]){
        						Box.confirm('新的'+currInput.title+'正在上传，此时提交将会使用之前上传成功的图片，确认提交？',
    									function(){
    										passImt[currInput.name]=true;
    										ProjectCreate.submitTextForm(passImt);
    									},
    									function(){});
    							return false;
    						}
    					}
    					//检查文件上传张数
    					var checkFilePass = ProjectCreate.checkFileLength(currInput);
    					if(!checkFilePass){
    						return false;
    					}
    					/*if(App.utils.isEmpty(inputValue)){
    						Box.autoClose(currInput.title+'不能为空');
    						return false;
    					}*/

    				return true;
    			},
    			
    			submitTextForm:function(fileParentChildren)
    			{
    				var pass = ProjectCreate.beforeSubmitTextForm(fileParentChildren);
					if(!pass){
						return;
					}
					ProjectCreate.doSubmitTextForm();
    			},
    			doSubmitTextForm:function(){
    			
		            submit();
    			}
    	};
    	function wrapSubmitTextForm()
    	{
    		ProjectCreate.submitTextForm();
    	}
    	$(function(){
    		var fileInputs = $("input[type='file']");
    		for(var i=0;i<fileInputs.length;i++){
    			//初始化
    			var fileInput = fileInputs[i];
    			bindingUpings[fileInput.id]=$("#"+fileInput.id+'Uping');
    			var inputId = fileInput.id;
				var textInputName = inputId.replace(/\d*/g,'');
				var textInput = $("input[name='"+textInputName+"']");
				if(!textInput){
					continue;
				}
				fileInput.parentInput = textInput;
				var textInputRel = ProjectCreate.fileParentChildren[textInputName];
				textInputRel=ProjectCreate.fileParentChildren[textInputName]=textInputRel==null?{status:'',name:''}:textInputRel;
				//监听
				fileInput.onchange = function(event){
					if(this.value){
						if(this.isUploading){
							return;
						}
						if(Compress.isCanvasSupported()&&Compress.isNeedCompress(event)){
							Compress.compress(event,function(imgData,fileInputId){
								uploadCompressFile(fileInputId,imgData);
							},this.id);
						}else{
							uploadFile(this.id);
						}
						this.isUploading = true;
					}else{
						//$('#'+this.id+'Uping').text('*');
					}
				};
				fileInput.onclick = function(){
					if(this.value&&this.isUploading){
						Box.autoClose("您有图片正在上传，请稍候再试");
						return false;
					}
					return true;
				}; 
			}
    	});

    </script>
    <script type="text/javascript">

		$(function(){
			showImageDetail();
			}
		);
		
	   /*
		* 以下通过FileReader实现上传图片预览
		* 实现过程:在需要预览的地方添加 <img src="" style="display:none;"/>标签，
		* 上传图片后，通过FileReader.readAsDataURL(file)读取图片信息;
		* 自定义FileReader.onload函数里设置src和style属性以显示预览图
		* by 黄智霖
		*/
	function showImageDetail(){
		//获取需要上传图片的4个input标签
		var input_prjPic = document.getElementById("prjPic");

		if (typeof FileReader === 'undefined') {
		
			Box.autoClose("提示:您的浏览器不支持上传图片!");
		} else {
			//为input标签绑定change事件		
			input_prjPic.addEventListener('change', readFile, false);
		}
	}
	   
	/*
	*change事件处理函数
	*/
	function readFile() {
		var file = this.files[0];
		if(!file){
			return;
		}
		var pex = this.getAttribute("id");
		//判断文件必须为图片的正则表达式
		if (!/image\/\w+/.test(file.type)) {
			Box.autoClose("文件必须为图片！");
			return false;
		}
		//使用FileReaser读取文件
		var reader = new FileReader();
		reader.readAsDataURL(file);
		reader.onload = function(e) {
			//id为projPic和teamPic，可上传多张图片（最多三张）
			var thisVar = document.getElementById(pex);
			if(pex == "prjPic"){
				//var thisVar = document.getElementById(pex);
				//获取当前已上传照片数量
				var numbers = thisVar.getAttribute("title");
					var im_3 = document.getElementById("preview_"+pex+"_"+numbers); 
					var fileUpKey =  upFileList[pex];
					if(!fileUpKey){
						fileUpKey = {};
						upFileList[pex] = 	fileUpKey;				
					}
					fileUpKey.uping = numbers;
					fileUpKey[numbers] = '';
					//显示预览图片
					im_3.setAttribute("src",this.result);
					im_3.setAttribute("style","");
					//上传照片数量加一
					thisVar.setAttribute("title",parseInt(numbers)+1);
					$("#"+pex).val('');
			}else{
				
				//id为logo和indexPic，只可上传一张照片
				var im_1 = document.getElementById("preview_"+pex); 
				im_1.setAttribute("src", this.result);
				im_1.setAttribute("style", "");
				var inpLabel = document.getElementById("label_"+pex);
				if(inpLabel){
					inpLabel.innerHTML="点击此处更改照片";
				}
				$("#"+pex).val('');
			}
		}
	}
	
	/*
	 *触发input的onclick事件
	 */
	 var projPicCount = 0;
	function fileClick(fileId){
					
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
			names = name.substring(name.lastIndexOf("userTrk/"))+","+names;
			//names = name.substring(name.indexOf("/")+1)+","+names;
		})
		$("#prjPic").val(names);
	}
    </script>
<style type="text/css">
.fileUping {
	display: block;
	width: 100%;
	margin: 2px 0 0 2px !important;
	height: 30px;
	line-height: 30px;
}

.upbar {
	width: 0;
	background-color: #e0485e;
	height: 5px !important;
	margin: 0 !important;
}

.fileUping div {
	float: left;
}

.upMsg {
	width: auto;
	float: left;
	margin: -12px 0 0 6px !important;
	display: inline-block;
	font-size: 12px;
}

.upbarContainer {
	float: left;
	width: 100px;
	background-color: gray;
	display: none;
	height: 5px !important;
	vertical-align: middle;
	margin: 2px 0 0 0 !important;
}
</style>
</head>
<body>
<header>
    <img src="${contextPath}/image/arrows-left.png">
    <p>添加足迹</p>
</header>
<section class="time">
    <div class="section-head">
        <img class="shu" src="${contextPath}/image/footprint-shu.png">
        <label class="tou">选择时间</label>
    </div>
    <form name="time" class="day">
        <label>
            年:
            <select id="year" name="year" onchange="changeYear(this.value)">
                <option>请选择年</option>
            </select>
        </label>
        <label>
            月:
            <select id="month" name="month" onchange="changeMonth(this.value)">
                <option>请选择月</option>
            </select>
        </label>
        <label>
            日:
            <select id="day" name="day">
                <option>请选择日</option>
            </select>
        </label>
    </form>
</section>
<div class="view">
    <img src="${contextPath}/image/footprint-shu.png">
    <label>新的里程</label>
    <div class="text">
        <textarea id="devise"></textarea>
        <span>还可以输入<label class="limit">150</label>字</span>
    </div>
</div>
<div class="view">
    <img src="${contextPath}/image/footprint-shu.png">
    <label>足迹照片（最多4张）</label>
    <div class="imgBox2">
        <div>
            <img onclick="changeImg('prjPic','0');" id="preview_prjPic_0" src="" style="display:none">
            <img onclick="changeImg('prjPic','1');" id="preview_prjPic_1" src="" style="display:none">
            <img onclick="changeImg('prjPic','2');" id="preview_prjPic_2" src="" style="display:none">
            <img onclick="changeImg('prjPic','3');" id="preview_prjPic_3" src="" style="display:none">
            <span id="proImg"></span>
            <img onclick="fileClick('prjPic');" src="${contextPath}/image/imgMore.png">
            <div id="prjPicUping" class="fileUping">
                        	<div class="upbarContainer">
                        		<div class="upbar"></div>
                        	</div>
                        	<div class="upMsg"></div>
            </div>
            <input name="prjPic" id="prjPic" type="hidden" title="项目照片" minsize="0" maxsize="4"/>
		    <%-- <form id="prjPicFileForm" action="${contextPath}/ground/uploadMultiFilesForPrjTrack" method="post" enctype ="multipart/form-data">
            <input id="prjPic" style="display:none;" type="file"  name="files" title="0" accept="image/*">
            </form> --%>
        </div>
    </div>
</div>
<div>
    <a class="submit-footprint" href="javascript:ProjectCreate.submitTextForm()"><span>提交</span></a>
</div>
<script>
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
			url:"${contextPath}/user/doUpload",
			type:"post",
			dataType:"json",
			data:{"media_id":media_id},
			success:function(data){
				var fileName = data.result;
				if(type=="prjPic"){
					$("#proImg").append('<img src="${contextPath}/'+ fileName +'" onclick="deleteImg(this);"/>');
					/* fileName =fileName +","+$("#prjPic").val();
					$("#prjPic").val(fileName); */
					
					
					images.localId=[];
					images.serverId=[];
				}
			},
			complete:function(){
				var names = "";
				var name = "";
				$.each($("#proImg").children(),function(i,data){
					name = $(data).attr("src")
					names = name.substring(name.lastIndexOf("userTrk/"))+","+names;
					//names = name.substring(name.indexOf("/")+1)+","+names;
				})
				$("#prjPic").val(names);
			}
		});
	});
}
</script>
</body>
</html>