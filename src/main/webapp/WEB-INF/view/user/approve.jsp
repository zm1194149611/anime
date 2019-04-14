<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
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
<head lang="en">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name='apple-mobile-web-app-capable' content='yes' />
<title>身份认证</title>
<link href="${contextPath}/css/approve.css" rel="stylesheet"
	type="text/css">
<link href="${contextPath}/css/approve-tutor.css" rel="stylesheet"
	type="text/css">
<link href="${contextPath}/css/public.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${contextPath}/js/jquery-form.js"></script>

<script type="text/javascript" src="${contextPath}/js/app.js"></script>
<script type="text/javascript" src="${contextPath}/js/box.js"></script>
<script type="text/javascript" src="${contextPath}/js/json2.js"></script>
<script src="${contextPath}/js/upload/compressimg.0.1.js"
	type="text/javascript"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
/*textarea 字数限制*/
function textarealength(obj,maxlength){
	var v = $(obj).val();
	var l = v.length;
	if( l > maxlength){
		v = v.substring(0,maxlength);
	}
	$(obj).parent().find(".textarea-length").text(v.length);
}
    function fontNum(fieldId,max){
        var field =document.getElementById(fieldId);
        field.onkeyup = function(){
            if (field.value.length > max){
                field.value = field.value.substring(0, max);
            }else{
                var parent = field.parentNode;
                var label = parent.getElementsByTagName("label")[0];
                label.innerHTML = max - field.value.length;
            }
        };
    }
    function showInput(){
        var hint=document.getElementById('hint');
        var head_input = document.getElementById('head-input');
        hint.onclick=function(){
            head_input.style.display="block";
            hint.style.display="none";
            addHead('head-rank','head-bottom','head-list');
            addHead('book-rank','book-bottom','book-list');
        }
    }

    function addHead(info,up,list){
        var bottom = document.getElementById(up);
        var head_list=document.getElementById(list);
        var rank=document.getElementById(info);

        bottom.onclick=function() {
            //alert(world.value);
            if (rank.value == '' || rank.value == null) {
                alert("请输入您的社会职务！！！");
            } else {
               
            	 var div=document.createElement('div');
                 var p = document.createElement('p');
                 var label=document.createElement('label');
                 label.innerHTML="&#10005";
                 p.innerHTML =rank.value;
                 
                 head_list.appendChild(div);
                 div.appendChild(p);
                 div.appendChild(label);
                 if(this.getAttribute("id").indexOf("head")!=-1)
                 {
                 	mentorRank.push(rank.value)
                 	
                 }
                 else if(this.getAttribute("id").indexOf("book")!=-1)
                 {
                 	wrtBook.push(rank.value)
                 	
                 }
                 else
                 {}
                	 
                rank.value="";
                removeHead(list);
            }
        }
       
    }
    function removeHead(list){
    	
        var head_list=document.getElementById(list);
        var p=head_list.getElementsByTagName('div');
        if(list.indexOf("head")!=-1)
        {
        for(var i=0; i< p.length; i++){
            p[i].onclick=function(){
            	for(var i=0;i<mentorRank.length;i++)
            	{
            		if(this.innerHTML.indexOf(mentorRank[i])!=-1)
            		{
            		  mentorRank.splice(i,1);
            		}
            	}
                this.remove();          
            }
        }
        }
        else
        {
        	for(var i=0; i< p.length; i++){
        		  p[i].onclick=function(){
        			for(var i=0;i<wrtBook.length;i++)
                  	{
                  		if(this.innerHTML.indexOf(wrtBook[i])!=-1)
                  		{
                  			wrtBook.splice(i,1);
                  		}
                  	}
        			  this.remove();
        		  }
        	}
        }
    }
    var mentorRank=new Array();
    var wrtBook=new Array();
    window.onload = function(){
    	var img1 = ['/image/upload-tutor.png','/image/upload-tutor1.png'];
    	var img2 = ['/image/upload-entrepreneur.png','/image/upload-entrepreneur1.png'];
        var tutor = document.getElementById('tutor');
        var entrepreneur = document.getElementById('entrepreneur');
        var upload_tutor=document.getElementById('upload-tutor');
        var upload_entrepreneur=document.getElementById('upload-entrepreneur');
        var tutorImg=document.getElementById('tutorImg');
        var entrepreneurImg=document.getElementById('entrepreneurImg');
        tutor.onclick= function () {
            upload_tutor.style.display='block';
            upload_entrepreneur.style.display='none';
            tutorImg.src="${contextPath}"+img1[0];
            entrepreneurImg.src="${contextPath}"+img2[0];
        };
        entrepreneur.onclick= function () {
            upload_tutor.style.display='none';
            upload_entrepreneur.style.display='block';
            tutorImg.src="${contextPath}"+img1[1];
            entrepreneurImg.src="${contextPath}"+img2[1];
        };
        

        fontNum("devise",18);
        fontNum("project",150);
        showImageDetail();
  
        if(${user.role}==0||${user.role}==3||${user.role}==6)
        {
        	 upload_tutor.style.display='none';
             upload_entrepreneur.style.display='block';
             tutorImg.src="${contextPath}"+img1[1];
             entrepreneurImg.src="${contextPath}"+img2[1];
        }
        
        
        initRankAndWrtBook();
        addHead('head-rank','head-bottom','head-list');
        addHead('book-rank','book-bottom','book-list');
        initText();
    };
    function initText()
    {
    	var txt="${user.projintro}";
    	if(txt!="")
    	{
    	  $("#project").val(txt);
    	  $("#project").keyup();
    	}
    	txt="${user.motto}"
    	if(txt!="")
    	{
    	  $("#devise").val(txt);
    	  $("#devise").keyup();
    	}
    	
    		
    }
    function initRankAndWrtBook()
    {
    	var i=0;
    	var head_list;
    	var div;
    	var p;
    	var label;
    	<c:if test='${user.rank!=null&&fn:length(user.rank)>0}'>
    	  mentorRank ="${user.rank}".split(","); 	
          head_list=document.getElementById('head-list');
         
          for(i=0;i<mentorRank.length;i++)
          {
        	  var div=document.createElement('div');
              var p = document.createElement('p');
              var label=document.createElement('label');
              label.innerHTML="&#10005";
              p.innerHTML =mentorRank[i];
              div.setAttribute("id",i); 
              div.appendChild(p);
              div.appendChild(label);
              head_list.appendChild(div);
             
          }
          removeHead('head-list');
    	 </c:if>
    	 <c:if test='${user.writtenbook!=null&&fn:length(user.writtenbook)>0}'>
    	 wrtBook="${user.writtenbook}".split(",");
         head_list=document.getElementById('book-list');
         for(i=0;i<wrtBook.length;i++)
         {
        	  var div=document.createElement('div');
              var p = document.createElement('p');
              var label=document.createElement('label');
              label.innerHTML="&#10005";
              p.innerHTML =wrtBook[i];
              div.setAttribute("id",i);
              div.appendChild(p);
              div.appendChild(label);
              head_list.appendChild(div);
           
         }
         removeHead('book-list');
    	 </c:if>
    		
    }
    function returnHomeCenter()
    {
    	if($("#name").val().trim()=="")
    	{
    		Box.alert("请填写项目名称");
    		return
    	}
     	if($("#project").val().trim()=="")
    	{
    		Box.alert("请填写项目简介");
    		return
    	}
    	updateuserpartinfo(6,$("#name").val(),$("#project").val(),"",$('input[name="prjPic"]').val())
    }

    function returnHomeCenterM()
    {
    	var rank="" ;
    	var imgs="";
    	for(var i=0;i<mentorRank.length;i++)
        {
    		if(i==mentorRank.length-1)
    		rank+=mentorRank[i];
    		else
    		rank+=mentorRank[i]+",";
    		
        }
    	var wrtbkstr="";
    	for(i=0;i<wrtBook.length;i++)
    	{
    		if(i==wrtBook.length-1)
    			wrtbkstr+=wrtBook[i]
    		else
    			wrtbkstr+=wrtBook[i]+",";
    	}
    	updateuserpartinfo(5,rank,wrtbkstr,$("#devise").val(),$('input[name="head"]').val());
    }
    function updateuserpartinfo(role,rank,writtenbook,motto,imgs)
    {
    	 var userinfoRef=new userpartinfo(role,rank,writtenbook,motto,imgs);  
        //alert(JSON.stringify(userinfoRef))
         doModify(JSON.stringify(userinfoRef),gurl)
    }
    function userpartinfo(role,rank,writtenbook,motto,imgs){  
    	if(role ==5)
        {
          this.role=role;  
          this.rank=rank;
          this.writtenbook=writtenbook;
          this.motto=motto;
          this.imgs =imgs;
        }
    	else
    	{
    		this.role=role;
    		this.projname=rank;
    		this.projintro=writtenbook;
    		this.imgs=imgs;
    	}
    }
    function goBack(){
    	location.href="${contextPath}/user/homecenter";
    }
    function doModify(data,gurl){
		 $.ajax( {
	        type : "post",  
	        url : "updateUserInfoes",  
	        data:{jsonString:data},
	        dataType:"json",  
	        success : function(data) {  
	            if(data.exceptionCode){
	            	Box.autoClose(data.exceptionMsg);
	            }
	            if(gurl==""){
	            	Box.autoClose("提交成功，请等待审核",goBack); 			            
	            }	            
	            else
	            location.href=gurl;
	        },
	        error:function(data){
	        	Box.autoClose("保存失败，请检查网络");
	        }
		}); 
    }
    var gurl="";
    function JumpToTab(url)
    {
    	gurl=url;
    	ProjectCreate.submitTextFormM();
    	gurl="";
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
    			beforeSubmitTextForm:function(passImt,sw){
    				if(ProjectCreate.created){
    					Box.autoClose('已提交成功，不用重复提交');
    					return false;
    				}
    				if(!passImt){
    					passImt={};
    				}

    				//console.log(textFormInputs);
    					var currInput ;
    					if(sw ==1)
    						currInput= $("input[name='head']");
    					else
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
    					if(App.utils.isEmpty(inputValue)){
    						Box.autoClose(currInput.title+'不能为空');
    						return false;
    					}

    				return true;
    			},
    			
    			submitTextFormM:function(fileParentChildren){
					ProjectCreate.doSubmitTextFormM();
    			},
    			submitTextFormA:function(fileParentChildren){
    				//基本资料（包含团队照片，logo等字段所需文件名）提交前的检查
    				var pass = ProjectCreate.beforeSubmitTextForm(fileParentChildren,1);
					if(!pass){
						Box.autoClose("请上传照片");
						return;
					}
					var business=document.getElementById("business");
			    	var mold=document.getElementById("mold");
			    	var major=document.getElementById("major");
			    	var hobby=document.getElementById("hobby");
			    	var businessSpan=business.getElementsByTagName("span");
			    	var moldSpan=mold.getElementsByTagName("span");
			    	var majorSpan=major.getElementsByTagName("span");
			    	var hobbySpan=hobby.getElementsByTagName("span");
			    	if(businessSpan.length<1 || moldSpan.length<1 || majorSpan.length<1 || hobbySpan.length<1){
			    		Box.alert("请选择完标签再提交");
			    		return 
			    	}
					ProjectCreate.doSubmitTextFormM();
					
    			},
    			submitTextForm:function(fileParentChildren)
    			{
    				var pass = ProjectCreate.beforeSubmitTextForm(fileParentChildren,0);
					if(!pass){
						Box.autoClose("请上传项目照片");
						return;
					}
					ProjectCreate.doSubmitTextForm();
    			},
    			doSubmitTextFormM:function()
    			{
    			//	Box.noAutoClose('正在提交，请稍候');
    				returnHomeCenterM();
    			},
    			doSubmitTextForm:function(){
    			//	Box.noAutoClose('正在提交，请稍候');
    				/*$('#textSubmit').ajaxSubmit({
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
		            });*/
    				returnHomeCenter();
    			}
    	};
    	function wrapSubmitTextForm()
    	{
    		ProjectCreate.submitTextForm();
    	}
    	$(function(){
    		/*$('#submit').click(function(){
    			ProjectCreate.submitTextForm();
    		});*/
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
		var input_logo = document.getElementById("head");
		var input_prjPic = document.getElementById("prjPic");

		if (typeof FileReader === 'undefined') {
		
			Box.autoClose("提示:您的浏览器不支持上传图片!");
		} else {
			//为input标签绑定change事件		
			/* input_logo.addEventListener('change', readFile, false);
			input_prjPic.addEventListener('change', readFile, false); */
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
				
		if(fileId=='head'){
			imgCount = 1;
			chooseImage("head");
		}else if(fileId=='prjPic'){
			if(projPicCount>=3){
				Box.autoClose("注意，最多上传4张照片");
				return;
			}
			projPicCount++;
			chooseImage("prjPic");
		 }
	}
	function deleteImg(obj){
		$(obj).remove();
		projPicCount--;
		
		var names = "";
		var name = "";
		$.each($("#proImg").children(),function(i,data){
			name = $(data).attr("src")
			names = name.substring(name.lastIndexOf("/")+1)+","+names;
				
		})
		$("#prjPic").val(names);
	}
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
		var role="";
		if(type=="head"){
			role = "1";
		}else if(type=="prjPic"){
			role = "0";
		}
		$.each(images.serverId,function(i,data){
			var media_id = data;
			$.ajax({
				url:"${contextPath}/user/doUpload",
				type:"post",
				dataType:"json",
				data:{"media_id":media_id,
					"role":role},
				success:function(data){
					var fileName = data.result;
					if(type=='head'){
						$("#head").val(fileName);
						$("#preview_head").attr("src","${contextPath}/pics/auditImg/"+fileName);
						images.localId=[];
						images.serverId=[];
					}else if(type=="prjPic"){
						$("#proImg").append('<img src="${contextPath}/pics/auditPrj/'+ fileName +'" onclick="deleteImg(this);"/>');
						images.localId=[];
						images.serverId=[];
					}
				},
				complete:function(){
					var names = "";
					var name = "";
					if(type=='prjPic'){
						$.each($("#proImg").children(),function(i,data){
							name = $(data).attr("src")
							names = name.substring(name.lastIndexOf("/")+1)+","+names;
							
						})
						$("#prjPic").val(names);
					}
					
				}
			});
		});
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
	<article>
	<header>
		<ul>
			<li id="tutor"><span></span><img class="left" id="tutorImg" src="${contextPath}/image/upload-tutor.png"></li>
			<li id="entrepreneur"><span></span><img class="right" id="entrepreneurImg" src="${contextPath}/image/upload-entrepreneur.png"></li>
		</ul>
	</header>
	<div id="upload-tutor">
		<div class="tutor-data">
			<div class="imgBox">
				<span>真实头像</span>
				<div class="tutor-head">
					<!--<img id="preview_head" style="display: none;" src=""> -->
					<c:choose>
					<c:when test="${user.rheadimg!=null&&fn:length(user.rheadimg)>0}">
					<img id="preview_head" onclick="fileClick('head')" src="${contextPath}/pics/auditImg/${user.rheadimg}">
					</c:when>
					<c:otherwise>
					<img id="preview_head" onclick="fileClick('head')" src="${contextPath}/image/imgMore.png">
					</c:otherwise>
					</c:choose>
					<div id="headUping" class="fileUping">
						<div class="upbarContainer">
							<div class="upbar"></div>
						</div>
						<div class="upMsg"></div>
					</div>
				</div>
				<img class="arrows" src="${contextPath}/image/head-arrows.png">
				<input name="head" id="head" type="hidden" form="textSubmit" title="导师头像" minsize="1" maxsize="1" accept="image/*" value="${user.rheadimg}"/>
                <%-- <form id="headFileForm" action="${contextPath}/user/uploadMultiFilesWithMentor" method="post" enctype ="multipart/form-data">
                    	<input id="head" style="display:none;" type="file" name="files"  title="0" accept="image/*">
                 </form> --%> 
			</div>
			<div class="view">
				<img src="${contextPath}/image/footprint-shu.png"> <label>座右铭</label>
				<!-- <div class="text">
					<textarea id="devise"></textarea>
					<span>还可以输入<label class="limit">18</label>字
					</span>
				</div> -->
				<div class="text">
					<textarea id="devise" class="textarea" maxlength="18" dragonfly="true" onKeyUp="textarealength(this,18)"></textarea>
					<span class="textarea-numberbar">还可以输入<label class="limit"><em class="textarea-length">0</em>/18</label>字
					</span>
				</div>
				
			</div>
			<div class="view">
				<img src="${contextPath}/image/footprint-shu.png"> <label>社会职务</label>
				<div class="head-fill"></div>
				<div class="head-list" id="head-list"></div>
				<div class="head-input" id="head-input">
					<input class="info" id="head-rank" type="text" 
						placeholder="请输入您的社会职务"> <span id="head-bottom">确认</span>
				</div>
			</div>
			<div class="view">
				<img src="${contextPath}/image/footprint-shu.png"> <label>导师风采</label>
				<div class="head-fill"></div>
				<div class="head-list" id="book-list"></div>
				<div class="head-input" id="book-input">
					<input class="info" id="book-rank" type="text" 
						placeholder="请输入您撰写的书籍和文章"> <span id="book-bottom">确认</span>
				</div>
			</div>
			<div class="view-new">
				<img src="${contextPath}/image/footprint-shu.png"> <label>我的标签</label>
				<ul class="label">
					<li><a href="javascript:JumpToTab('${contextPath}/user/business')">
							<p>所属行业</p>
							<div class="label-details one" id="business">
								<c:if test='${user.business!=null&&fn:length(user.business)>0}'>
									<c:forEach items="${fn:split(user.business,',')}" var="item"
										varStatus="status">
										<span><spring:message code="project.business.business${item}" /></span>
									</c:forEach>
								</c:if>
							</div> 
							<img class="arrow" src="${contextPath}/image/head-arrows.png">
					     </a>
					</li>
					<li><a href="javascript:JumpToTab('${contextPath}/user/mold')">
							<p>导师类型</p>
							<div class="label-details two" id="mold">
								<c:if test='${user.mentortype!=null&&fn:length(user.mentortype)>0}'>
									<c:forEach items="${fn:split(user.mentortype,',')}" var="item"
										varStatus="status">
										<span><spring:message code="project.mentor.type${item}" /></span>
									</c:forEach>
								</c:if>
							</div> <img class="arrow" src="${contextPath}/image/head-arrows.png">
					</a></li>
					<li><a href="javascript:JumpToTab('${contextPath}/user/major')">
							<p>专业技术</p>
							<div class="label-details three" id="major">
								<c:if test='${not empty user.skills && fn:length(user.skills)>0}'>
									<c:forEach items="${fn:split(user.skills,',')}" var="item"
										varStatus="status">
										<span><spring:message
												code="project.mentor.skills${item}" /></span>
									</c:forEach>
								</c:if>
							</div> <img class="arrow" src="${contextPath}/image/head-arrows.png">
					</a></li>
					<li><a href="javascript:JumpToTab('${contextPath}/user/hobby')">
							<p>兴趣爱好</p>
							<div class="label-details four" id="hobby">
								<c:if test='${user.hobby!=null&&fn:length(user.hobby)>0}'>
									<c:forEach items="${fn:split(user.hobby,',')}" var="item"
										varStatus="status">
										<span><spring:message
												code="project.mentor.hobby${item}" /></span>
									</c:forEach>
								</c:if>
							</div> <img class="arrow" src="${contextPath}/image/head-arrows.png">
					</a></li>
				</ul>
				<div class="fill"></div>
			</div>
			<div>
			    <a class="submit-apply" href="javascript:ProjectCreate.submitTextFormA()"><span>提交</span></a>
				<%-- <c:choose>
					<c:when test='${user.role<=2}'>
						<a class="submit-apply" href="${contextPath}/user/homecenter"><span>提交</span></a>
					</c:when>
					<c:otherwise>
						<a class="submit-apply" href="${contextPath}/user/homecenter"><span>确认</span></a>
					</c:otherwise>
				</c:choose> --%>
			</div>
		</div>
	</div>
	<div id="upload-entrepreneur" style="display: none">
		<div class="entrepreneur-data">
			<div class="view project-name">
				<img src="${contextPath}/image/footprint-shu.png"> <input
					id="name" type="text" placeholder="项目名称" value="${user.projname}">
			</div>
			<div class="view">
				<img src="${contextPath}/image/footprint-shu.png"> <label>项目简介</label>
				<div class="text">
					<textarea id="project"></textarea>
					<span>还可以输入<label class="limit">150</label>字
					</span>
				</div>
			</div>
			<div class="view">
				<img src="${contextPath}/image/footprint-shu.png"> <label>项目照片（最多3张）</label>
				<div class="imgBox2">
					<div>
						<img onclick="changeImg('prjPic','0');" id="preview_prjPic_0"
							src="" style="display: none"/> <img
							onclick="changeImg('prjPic','1');" id="preview_prjPic_1" src=""
							style="display: none"/> <img
							onclick="changeImg('prjPic','2');" id="preview_prjPic_2" src=""
							style="display: none"/>
							<span id="proImg"></span> 
							<img onclick="fileClick('prjPic');" src="${contextPath}/image/imgMore.png"/>
							 <div id="prjPicUping" class="fileUping">
                        	<div class="upbarContainer">
                        		<div class="upbar"></div>
                        	</div>
                        	<div class="upMsg"></div>
                        </div>
					</div>
					<input name="prjPic" id="prjPic" type="hidden" title="项目照片" minsize="1" maxsize="3"/>
					 <%-- <form id="prjPicFileForm" action="${contextPath}/user/uploadMultiFilesWithPrj" method="post" enctype ="multipart/form-data">
                    <input id="prjPic" type="file" style="display:none;" name="files" title="0" accept="image/*">
                    </form> --%>
				</div>
			</div>
			<div>
			<a class="submit-apply" href="javascript:ProjectCreate.submitTextForm()"><span>提交</span></a>
				<%-- <c:choose>
					<c:when test='${user.role<=2}'>
						<a class="submit-apply" href="javascript:ProjectCreate.submitTextForm()"><span>提交</span></a>
					</c:when>
					<c:otherwise>
						<a class="submit-apply" href="${contextPath}/user/homecenter"><span>确认</span></a>
					</c:otherwise>
				</c:choose> --%>
			</div>
		</div>
	</div>
	</article>

</body>
</html>