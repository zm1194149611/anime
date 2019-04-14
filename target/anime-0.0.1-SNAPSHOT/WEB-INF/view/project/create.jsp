<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <title>上传项目</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <link href="${contextPath}/css/select.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/Upload.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <script>
    //初始化上传图片所需的参数
	var imgCount = 1;//上传数量，默认为1
	var timestamp = ${timestamp};//时间戳
	var appId = '${appId}';//公众号id
	var nonceStr = '${nonceStr}';//签名随机字符串
	var signature = '${signature}';//签名
	var fileName;//返回的文件名
	var url = "${contextPath}/user/doUpload";//上传图片地址
	//保存选图或上传图片后返回的图片id
	var images = {
		localId:[],
		serverId:[],
		downloadId:[]
	};
	</script>
    <script type="text/javascript" src="${contextPath}/js/jquery.js" ></script>
    <script type="text/javascript" src="${contextPath}/js/jquery-form.js" ></script>
    <script type="text/javascript" src="${contextPath}/js/app.js"></script>
    <script type="text/javascript" src="${contextPath}/js/box.js" ></script>
    <script type="text/javascript" src="${contextPath}/js/select.js" ></script>
    <script type="text/javascript" src="${contextPath}/js/Uplode.js" ></script>
    <script src="${contextPath}/js/upload/compressimg.0.1.js" type="text/javascript"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
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
    				var textFormInputs = $("[form='textSubmit']");
    				//console.log(textFormInputs);
    				for(var i=0;i<textFormInputs.length;i++){
    					var currInput = textFormInputs[i];
    					var inputValue = currInput.value;
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
    					if(App.utils.isEmpty(inputValue)){
    						Box.autoClose(currInput.title+'不能为空');
    						return false;
    					}
    				}
    				return true;
    			},
    			submitTextForm:function(fileParentChildren){
    				//基本资料（包含团队照片，logo等字段所需文件名）提交前的检查
    				var pass = ProjectCreate.beforeSubmitTextForm(fileParentChildren);
					if(!pass){
						return;
					}
					ProjectCreate.doSubmitTextForm();
    			},
    			doSubmitTextForm:function(){
    				Box.noAutoClose('正在提交，请稍候');
    				$('#textSubmit').ajaxSubmit({
    					 type:'post',
						 dataType:'json',
						 success: function(data, status){
							 Box.close();
							 if(data.exceptionMsg){
								Box.autoClose(data.exceptionMsg);
							 }else{
								ProjectCreate.created = true;
								Box.alert('提交成功，点击确定返回个人中心',function(){
									location.href="${contextPath}/user/homecenter";
								}); 
							 }
		                 },
		                 error: function (data, status, e){
		                	 Box.close();
		                     Box.autoClose('提交失败，请检查网络');
		                 }
		            });
    			}
    	};
    	$(function(){
    		$('#submit').click(function(){
    			ProjectCreate.submitTextForm();
    		});
    		//$('#submit').click(alert());
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
    	/* $(function(){
    		if(typeof uploadjsInit=='function'){
	    		uploadjsInit();
    		}
    	}); */
    </script>
    <script type="text/javascript">
    //window.onload = function() {
		//var result = document.getElementById("result");
		$(function(){
			showImageDetail();
			uploadjsInit();
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
		var input_logo = document.getElementById("logo");
		var input_indexPic = document.getElementById("indexPic");
		var input_projPic = document.getElementById("projPic");
		var input_teamPic = document.getElementById("teamPic");
		/* input_projPic.onclick=function(){
			if(parseInt(input_projPic.getAttribute("name")) >=3 ){
				alert("您已经添加了三张照片!");
				return;
			}
		} */
		if (typeof FileReader === 'undefined') {
			//result.innerHTML = "抱歉，你的浏览器不支持 FileReader";
			//input.setAttribute('disabled', 'disabled');
			Box.autoClose("提示:您的浏览器不支持上传图片!");
		} else {
			//为input标签绑定change事件		
			input_logo.addEventListener('change', readFile, false);
			input_indexPic.addEventListener('change', readFile, false);
			input_projPic.addEventListener('change', readFile, false);
			input_teamPic.addEventListener('change', readFile, false);
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
			if(pex == "projPic" || pex == "teamPic"){
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
	var projPicCount=0;//项目照片数量
	var teamPicCount=0;//团队照片数量
	function fileClick(fileId){
		
		if(fileId=='logo'){
			imgCount = 1;
			chooseImage("logo");
		}else if(fileId=="indexPic"){
			imgCount = 1;
			chooseImage("indexPic");
		}else if(fileId=='projPic'){
			if(projPicCount>=3){
				Box.autoClose("注意，最多上传3张照片");
				return;
			}
			projPicCount++;
			chooseImage("projPic");
		}else if(fileId=='teamPic'){
			if(teamPicCount>=3){
				Box.autoClose("注意，最多上传3张照片");
				return;
			}
			teamPicCount++;
			chooseImage("teamPic");
		}
		
		
		
		/* var thisVar = document.getElementById(fileId);
		if(thisVar.value || thisVar.isUploading){
			Box.autoClose("您有图片正在上传，请稍候再试");
			return false;
		}
		var numbers = thisVar.getAttribute("title");
		if(numbers >= 3){
			Box.autoClose("您已经添加了三张照片!");
			return;
		}
		thisVar.click(); */
	
	}
	//文件上传记录容器，已上传和正在上传文件记录（仅供多照片的字段使用）。
	var upFileList = {};
	
	/*删除项目图片*/
	 function deleteProjImg(obj){
		$(obj).remove();
		projPicCount--;
		
		var names = "";
		var name = "";
		$.each($("#preview_projPic").children(),function(i,data){
			name = $(data).attr("src")
			names = name.substring(name.lastIndexOf("/")+1)+","+names;
				
		});
		$("#projPic").val(names);
	}
	 /*删除团队图片*/
	 function deleteTeamImg(obj){
			$(obj).remove();
			teamPicCount--;
			
			var names = "";
			var name = "";
			$.each($("#preview_teamPic").children(),function(i,data){
				name = $(data).attr("src")
				names = name.substring(name.lastIndexOf("/")+1)+","+names;
					
			});
			$("#teamPic").val(names);
	}
	/**
	*实现多张图片(最多3张)预览处，点击图片删除该图片重新上传
	*
	*/
	/* function changeImg(fileId,id){
		var inputFile = document.getElementById(fileId);
		
		if(inputFile.value || inputFile.isUploading){
			Box.autoClose("您有图片正在上传，请稍候再试");
			return false;
		}
		
		var currentImg = document.getElementById("preview_"+fileId+"_"+id);
		var inp = document.getElementById(fileId);
		//0 1 2 分别表示三个预览图片所在位置
		//删除第三张照片，直接置空src属性，并设为隐藏
		if(id == '2'){
			currentImg.setAttribute("src","");
			currentImg.setAttribute("style","display:none;");
			var fileUpKey = upFileList[fileId];
			if(fileUpKey){
				delete fileUpKey[id];
				$('#'+fileId+'Uping').children('.upbarContainer').hide();
			}
		}else if(id == '1' || id == '0'){
			//删除第一张或第二张，如果后面没有图片则直接置空隐藏，如果后面有图片则将后面图片属性转移本图片，置空隐藏后面图片			
			var nexImg = document.getElementById("preview_"+fileId+"_"+(parseInt(id)+1));
			var fileUpKey = upFileList[fileId];
			var curKey = '';
			if(nexImg.getAttribute("src") != ""){
				if(fileUpKey){
					curKey = fileUpKey[id];
				}
				if(id == '0'){
					var nex2Img = document.getElementById("preview_"+fileId+"_"+(parseInt(id)+2));
					if(nex2Img.getAttribute("src") != ""){
						currentImg.setAttribute("src",nexImg.getAttribute("src"));
						nexImg.setAttribute("src",nex2Img.getAttribute("src"));
						nex2Img.setAttribute("src","");
						nex2Img.setAttribute("style","display:none;");
						if(fileUpKey){
							//和文件上传记录容器同步
							curKey = fileUpKey[id];
							var prev1 = fileUpKey['1'];
							var prev2 = fileUpKey['2'];
							fileUpKey['0']=prev1;
							fileUpKey['1']=prev2;
							delete fileUpKey['2'];
						}
					}else{
						currentImg.setAttribute("src",nexImg.getAttribute("src"));
						nexImg.setAttribute("src","");
						nexImg.setAttribute("style","display:none;");
						if(fileUpKey){
							//和文件上传记录容器同步
							curKey = fileUpKey[id];
							var prev1 = fileUpKey['1'];
							fileUpKey['0']=prev1;
							delete fileUpKey['1'];
						}
					}
				}else{
					currentImg.setAttribute("src",nexImg.getAttribute("src"));
					nexImg.setAttribute("src","");
					nexImg.setAttribute("style","display:none;");
					if(fileUpKey){
						//和文件上传记录容器同步
						curKey = fileUpKey[id];
						var prev1 = fileUpKey['2'];
						fileUpKey['1']=prev1;
						delete fileUpKey['2'];
					}
				}
			}else{
				currentImg.setAttribute("src","");
				currentImg.setAttribute("style","display:none;");
				if(fileUpKey){
					//和文件上传记录容器同步
					delete fileUpKey[id];
					$('#'+fileId+'Uping').children('.upbarContainer').hide();
				}
			}
		}
		
		var fileList = upFileList[fileId];
		if(fileList){
			//将已同步的文件上传容器，重新读取容器内成功上传的文件，并更新到对应的文件名input上
			var fileNames = '';
			for(var i in fileList){
				if(fileList[i]=='uping'){
					continue;
				}
				fileNames+=',';
				fileNames+=fileList[i];
			}
			fileNames = fileNames.slice(1);
			$('input[name="'+fileId+'"]').val(fileNames);
		}
		//删除一张图片后，已上传数量减一
		var nowNum = document.getElementById(fileId).getAttribute("title");
		document.getElementById(fileId).setAttribute("title",(parseInt(nowNum)-1));
		$("#"+fileId+"Uping").children("div.upMsg").text("");
	} */
    </script>
	<style type="text/css">
		.fileUping{
			display:block;
			width: 100%;
			margin: 2px 0 0 2px !important;
			height:30px;
			line-height:30px;
		}
		.upbar{
			width:0;
			background-color: #e0485e;
			height:5px !important;
			margin: 0 !important;
		}
		.fileUping div{
			float:left;
		}
		.upMsg{
			width:auto;
			float:left;
			margin: -12px 0 0 6px !important;
			display:inline-block;
			font-size:12px;
		}
		.upbarContainer{
			float:left;
			width:100px;
			background-color:gray;
			display:none;
			height: 5px !important;
			vertical-align: middle;
			margin: 2px 0 0 0 !important;
		}
	</style>
</head>
<body>
<article>
    <section>
        <ul>
            <li><img src="${contextPath}/image/up%20(9).jpg">
            	<input id="name" name="name" form="textSubmit" type="text" placeholder="项目名称" title="项目名称">
            </li>
                <li class="view">
                <img src="${contextPath}/image/up%20(2).jpg"><label>项目所在地</label>
                <div class="radio">
                <p id="zone" class="title"><label></label><span class="titleSpan"></span></p>
            		 <!-- 2222222 -->
            		<div class="choose">
                        <ul id="zoneList" style="display: none">
                        <c:forEach var="i" begin="1" end="21" step="1"> 
                        <li value="zone${i}"><span><spring:message code="project.zone.zone${i}" /></span></li>
                        </c:forEach>
                        </ul>
                    </div>
            		<input  id="zone_s" name="zone" type="hidden" form="textSubmit" value="" title="项目所在地"/>
                              
                </div>
            </li>
            
            <li class="view">
                <img src="${contextPath}/image/up%20(1).jpg"><label>项目状态</label>
                <div class="radio">
               <c:forEach var="i" begin="1" end="3" step="1"> 
                		<span>
	                		<input  id="status${i}" name="status" type="radio" form="textSubmit" value="status${i}" title="项目状态"/>
	                		<label for="status${i}"><spring:message code="project.status.status${i}" /></label>
                		</span>
				    </c:forEach>
				    
                </div>
            </li>
        
            <li class="view">
                <img src="${contextPath}/image/up%20(3).jpg"><label>所属行业</label>
                <div class="radio3">
                <p id="business" class="title"><label></label><span class="titleSpan"></span></p>
                <!-- 3333333 -->
                <div class="choose">
                        <ul id="businessList" style="display: none">
                        <c:forEach var="i" begin="1" end="9" step="1">
                            <li value="business${i}"><span><spring:message code="project.business.business${i}" /></span></li>
                        </c:forEach>
                        </ul>
                    </div>
                <input id="business_s" name="business" type="hidden" form="textSubmit" value="" title="所属行业"/>
                	
                	
                </div>
            </li>
        </ul>
    </section>
    <section>
        <ul>
            <li><img src="${contextPath}/image/up%20(4).jpg">
            	<input id="resPerson" name="resPerson" form="textSubmit" type="text" placeholder="项目负责人" title="项目负责人"/>
            </li>
            <li class="view">
                <img src="${contextPath}/image/up%20(5).jpg"><label>项目Logo（请上传一张图片）</label>
                <div class="imgBox">
                    <div>
                    		<!--------- 用于显示预览图片--------->
                    	<img id="preview_logo" style="display:none;" src="">
                        <img onclick="fileClick('logo')" src="${contextPath}/image/imgMore.png">
                        <div id="logoUping" class="fileUping">
                        	<div class="upbarContainer">
                        		<div class="upbar"></div>
                        	</div>
                        	<div class="upMsg"></div>
                        </div>
                    </div>
                    <input name="logo" id="logo" type="hidden" form="textSubmit" title="项目Logo" minsize="1" maxsize="1" accept="image/*"/>
                    <%-- <form id="logoFileForm" action="${contextPath}/project/uploadMultiFiles" method="post" enctype ="multipart/form-data">
                    	<input id="logo" style="display:none;" type="file" name="files" accept="image/*">
                    </form> --%>
                </div>
                
                
                <%-- <div class="imgBox">
                   	<input name="logo" type="hidden" form="textSubmit" title="项目Logo" minsize="1" maxsize="1" accept="image/*"/>
                   	<form id="logoFileForm" action="${contextPath}/project/uploadMultiFiles" method="post" enctype ="multipart/form-data">
					<input id="logo" type="file" name="files" accept="image/*"/>
					<img class="up" src="${contextPath}/image/up%20(8).jpg">
					<label>选取1张<span class="uping" id="logoUping"></span></label>
                   	</form>
                </div> --%>
                
            </li>
            <li class="view">
                <img src="${contextPath}/image/up%20(6).jpg"><label>项目封面（请上传一张图片）</label>
                <div class="imgBox">
                    <div>
                    	<img id="preview_indexPic" style="display:none;" src=""/>
                        <img onclick="fileClick('indexPic');" src="${contextPath}/image/imgMore.png">
                        <div id="indexPicUping" class="fileUping">
                        	<div class="upbarContainer">
                        		<div class="upbar"></div>
                        	</div>
                        	<div class="upMsg"></div>
                        </div>
                    </div>
                    <input name="indexPic" id="indexPic" type="hidden" form="textSubmit" title="项目封面" minsize="1" maxsize="1"/>
                    <%-- <form id="indexPicFileForm" action="${contextPath}/project/uploadMultiFiles" method="post" enctype ="multipart/form-data">
                    	<input id="indexPic" style="display:none;" type="file" name="files" accept="image/*">
                    </form> --%>
                </div>
                
                <%-- 
                <div>
                	<input name="indexPic" type="hidden" form="textSubmit" title="项目封面" minsize="1" maxsize="1"/>
                	<form id="indexPicFileForm" action="${contextPath}/project/uploadMultiFiles" method="post" enctype ="multipart/form-data">
                    	<input id="indexPic" type="file" name="files" accept="image/*"/>
                		<img class="up" src="${contextPath}/image/up%20(8).jpg">
                    	<label>选取1张<span class="uping" id="indexPicUping"></span></label>
                    </form>
                </div> --%>
            </li>
            <li class="view">
                <img src="${contextPath}/image/up%20(7).jpg"><label>项目照片（请上传横向图片且最多3张）</label>
                <div class="imgBox">
                    <div>
                    	<!-- <img onclick="changeImg('projPic','0');" id="preview_projPic_0" src="" style="display:none">
                    	<img onclick="changeImg('projPic','1');" id="preview_projPic_1" src="" style="display:none">
                    	<img onclick="changeImg('projPic','2');" id="preview_projPic_2" src="" style="display:none"> -->
                        <span id="preview_projPic"></span>
                        <img onclick="fileClick('projPic');" src="${contextPath}/image/imgMore.png">
                        <div id="projPicUping" class="fileUping">
                        	<div class="upbarContainer">
                        		<div class="upbar"></div>
                        	</div>
                        	<div class="upMsg"></div>
                        </div>
                    </div>
                    <input type="hidden" id="projPic" name="projPic" form="textSubmit" title="项目照片" minsize="1" maxsize="3"/>
                    <%-- <form id="projPicFileForm" action="${contextPath}/project/uploadMultiFiles" method="post" enctype ="multipart/form-data">
                    	<input id="projPic" style="display:none;" type="file"  name="files" title="0" accept="image/*">
                    </form> --%>
                </div>
                
                <%-- 
                <div>
                    <input type="hidden" name="projPic" form="textSubmit" title="项目照片" minsize="1" maxsize="3"/>
                    <form id="projPicFileForm" action="${contextPath}/project/uploadMultiFiles" method="post" enctype ="multipart/form-data">
                    	<input id="projPic" type="file" name="files" accept="image/*"  multiple="multiple"/>
                		<img class="up" src="${contextPath}/image/up%20(8).jpg">
                    	<label>最少一张，最多3张<span class="uping" id="projPicUping"></span></label>
                    </form>
                    
                </div> --%>
                
            </li>
        </ul>
    </section>
    <section>
        <ul>
            <li class="view">
                <img src="${contextPath}/image/up%20(9).jpg"><label>项目简介</label>
                <div>
                    <textarea id="projIntroduce" name="projIntroduce" form="textSubmit" title="项目简介"></textarea>
                    <span>还可以输入<label>100</label>字</span>
                </div>
            </li>
            <li class="view">
                <img src="${contextPath}/image/up%20(11).jpg"><label>经营状况</label>
                <div>
                    <textarea id="operation" name="operation" form="textSubmit" title="经营状况"></textarea>
                    <span>还可以输入<label>100</label>字</span>
                </div>
            </li>
            <li class="view">
                <img src="${contextPath}/image/up%20(12).jpg"><label>发展规划</label>
                <div>
                    <textarea id="plan" name="plan" form="textSubmit" title="发展规划"></textarea>
                    <span>还可以输入<label>100</label>字</span>
                </div>
            </li>
        </ul>
    </section>
    <section>
        <ul>
            <li class="view">
                <img src="${contextPath}/image/up%20(13).jpg"><label>团队介绍</label>
                <div>
                    <textarea id="teamIntroduce" name="teamIntroduce" form="textSubmit" title="团队介绍"></textarea>
                    <span>还可以输入<label>100</label>字</span>
                </div>
            </li>
            <li class="view">
                <img src="${contextPath}/image/up%20(7).jpg"><label>团队照片（请上传横向图片且最多3张）</label>
                
                
                <div class="imgBox">
                    <div>
						<!-- <img onclick="changeImg('teamPic','0');" id="preview_teamPic_0" src="" style="display:none">
                    	<img onclick="changeImg('teamPic','1');" id="preview_teamPic_1" src="" style="display:none">
                    	<img onclick="changeImg('teamPic','2');" id="preview_teamPic_2" src="" style="display:none"> -->
                    	<span id="preview_teamPic"></span>
                        <img onclick="fileClick('teamPic');" src="${contextPath}/image/imgMore.png">
                        <div id="teamPicUping" class="fileUping">
                        	<div class="upbarContainer">
                        		<div class="upbar"></div>
                        	</div>
                        	<div class="upMsg"></div>
                        </div>
                    </div>
                    <input name="teamPic" id="teamPic" type="hidden" form="textSubmit" title="团队照片" minsize="1" maxsize="3"/>
                    <%-- <form id="teamPicFileForm" action="${contextPath}/project/uploadMultiFiles" method="post" enctype ="multipart/form-data">
                    	<input id="teamPic" type="file" style="display:none;" name="files" title="0" accept="image/*">
                    </form> --%>
                </div>
                
                <%-- 
                <div>
                    <input name="teamPic" type="hidden" form="textSubmit" title="团队照片" minsize="1" maxsize="3"/>
                    <form id="teamPicFileForm" action="${contextPath}/project/uploadMultiFiles" method="post" enctype ="multipart/form-data">
                    	<input id="teamPic" type="file" name="files" accept="image/*" multiple="multiple"/>
                		<img class="up" src="${contextPath}/image/up%20(8).jpg">
                    	 <label>最少一张，最多3张<span class="uping" id="teamPicUping"></span></label>
                    </form>
                   
                </div> --%>
            </li>
        </ul>
    </section>
    <form id="textSubmit" action="${contextPath}/project/doCreate">
        <span id="submit">提交</span>
    </form>
</article>
<script>
/**
 * 以下是上传图片js
 */
/*jssdk配置*/
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
			url:"${contextPath}/project/doUpload",
			type:"post",
			dataType:"json",
			data:{"media_id":media_id},
			success:function(data){
				var fileName = data.result;
				if(type=='logo'){
					$("#preview_logo").attr("src","${contextPath}/pics/"+fileName);
					$("#preview_logo").attr("style","");
					$("#logo").val(fileName);
					images.localId = [];
					images.serverId = [];
				}else if(type=="indexPic"){
					$("#preview_indexPic").attr("src","${contextPath}/pics/"+fileName);
					$("#preview_indexPic").attr("style","");
					$("#indexPic").val(fileName);
					images.localId = [];
					images.serverId = [];
				}else if(type=="projPic"){
					$("#preview_projPic").append('<img src="${contextPath}/pics/'+ fileName +'" onclick="deleteProjImg(this);"/>');
					images.localId = [];
					images.serverId = [];
				}else if(type=="teamPic"){
					$("#preview_teamPic").append('<img src="${contextPath}/pics/'+ fileName +'" onclick="deleteTeamImg(this);"/>');
					images.localId = [];
					images.serverId = [];
				}
			},
			complete:function(){
				var names = "";
				var name = "";
				if(type=="projPic"){
					$.each($("#preview_projPic").children(),function(i,data){
						name = $(data).attr("src")
						names = name.substring(name.lastIndexOf("/")+1)+","+names;
							
					});
					$("#projPic").val(names);
				}else if(type=="teamPic"){
					$.each($("#preview_teamPic").children(),function(i,data){
						name = $(data).attr("src")
						names = name.substring(name.lastIndexOf("/")+1)+","+names;
							
					});
					$("#teamPic").val(names);
				}
				
			}
		});
	});
}
</script>
</body>
</html>
