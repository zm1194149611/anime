<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		
		<link href="${contextPath}/bg/css/H-ui.min.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/css/common.css" rel="stylesheet" type="text/css" />
		
		<title>项目修改</title>
	</head>
	
	<body>
		<div class="pd-20">
			<form  method="post" class="form form-horizontal" id="form-article-add">
				<div class="row cl">
					<span class="form-label col-2"><span class="c-red">*</span>项目名称：</span>
					<div class="formControls col-10">
						<input type="hidden" name="id" value="${project.id}" />
						<input type="hidden" name="userId" value="${project.userId}" />
						<input type="hidden" name="likeCount" value="${project.likeCount}" />
						<input type="hidden" name="visitCount" value="${project.visitCount}" />
						<input type="hidden" name="shareCount" value="${project.shareCount}" />
						<input type="hidden" name="start" value="${start}" />
						<input type="hidden" name="auditstatus" value="${auditstatus}" />
						<input type="text" class="input-text" style="width:250px;" name="name" value="${project.name}" />
					</div>
				</div>
				
				<div class="row cl">
					<span class="form-label col-2"><span class="c-red">*</span>项目状态：</span>
					<div class="formControls col-10">
						<select name="status" id="status" class="input-text" style="width:250px;">
						<c:forEach var="i" begin="1" end="3" step="1"> 
							<option value="status${i}"><spring:message code="project.status.status${i}" /></option>
				    	</c:forEach>
						</select>
					</div>
				</div>
				
				<div class="row cl">
					<span class="form-label col-2"><span class="c-red">*</span>所属行业：</span>
					<div class="formControls col-10">
						<select name="business" id="business" class="input-text" style="width:250px;">
						<c:forEach var="i" begin="1" end="9" step="1">
                            <option value="business${i}"><spring:message code="project.business.business${i}" /></option>
                        </c:forEach>
						</select>
					</div>
				</div>
				
				<div class="row cl">
					<span class="form-label col-2"><span class="c-red">*</span>所&nbsp;&nbsp;在&nbsp;地：</span>
					<div class="formControls col-10">
						<select name="zone" id="zone" class="input-text" style="width:250px;">
						<c:forEach var="i" begin="1" end="21" step="1"> 
                        	<option value="zone${i}"><spring:message code="project.zone.zone${i}" /></option>
                        </c:forEach>
						</select>
					</div>
				</div>
				
				<div  class="row cl">
					<span class="form-label col-2"><span class="c-red">*</span>负&nbsp;&nbsp;责&nbsp;人：</span>
					<div class="formControls col-10">
						<input type="text" class="input-text" style="width:250px;" value="${project.resPerson}" name="resPerson" />
					</div>
				</div>
				
				<div class="row cl pr">
					<span class="form-label col-2"><span class="c-red">*</span>项目logo：</span>
					<div class="images_box">
						<!-- <div class="images_del" onclick="delImg(this);"></div> -->
						<div></div>
						<img alt="" class="images" src="${contextPath}/pics/${project.logo}" />
					</div>
					<div class="row cl" id="logo">
						<span class="form-label col-2"></span>
						<div class="formControls col-10">
							<div class="uploader-list-container1 uploader-list-container"> 
								<div class="queueList">
									<div id="dndArea1" class="placeholder">
										<div id="filePicker-1"></div>
										<p>项目logo只能上传1张，会把之前的项目logo覆盖</p>
									</div>
								</div>
								<div class="statusBar" style="display:none;">
									<div class="progress"> <span class="text">0%</span> <span class="percentage"></span> </div>
									<div class="info"></div>
									<div class="btns">
										<div id="filePicker1"></div>
										<div class="uploadBtn">开始上传</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<input type="hidden" name="logo" value="${project.logo}" />
				</div>
				
				<div class="row cl">
					<span class="form-label col-2"><span class="c-red">*</span>项目简介：</span>
					<div class="formControls col-10">
						<textarea name="projIntroduce" class="textarea" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="textarealength(this,1000)">${project.projIntroduce}</textarea>
						<p class="textarea-numberbar"><em class="textarea-length">0</em>/1000</p>
					</div>
				</div>
				
				<div class="row cl pr">
					<span class="form-label col-2"><span class="c-red">*</span>项目封面：</span>
					<div class="images_box">
						<div></div>
						<img alt="" class="images" src="${contextPath}/pics/${project.indexPic}" />
					</div>
					<div class="row cl" id="indexPic">
						<label class="form-label col-2"></label>
						<div class="formControls col-10">
							<div class="uploader-list-container2 uploader-list-container"> 
								<div class="queueList">
									<div id="dndArea2" class="placeholder">
										<div id="filePicker-2"></div>
										<p>项目封面只能上传1张，会把之前的项目封面覆盖</p>
									</div>
								</div>
								<div class="statusBar" style="display:none;">
									<div class="progress"> <span class="text">0%</span> <span class="percentage"></span> </div>
									<div class="info"></div>
									<div class="btns">
										<div id="filePicker2"></div>
										<div class="uploadBtn">开始上传</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<input type="hidden" name="indexPic" value="${project.indexPic}" />
				</div>
				
				<div class="row cl">
					<span class="form-label col-2"><span class="c-red">*</span>经营状况：</span>
					<div class="formControls col-10">
						<textarea name="operation" cols="" rows="" class="textarea" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="textarealength(this,1000)">${project.operation}</textarea>
						<p class="textarea-numberbar"><em class="textarea-length">0</em>/1000</p>
					</div>
				</div>
				
				<div class="row cl pr">
					<span class="form-label col-2"><span class="c-red">*</span>项目照片：</span>
					<c:forEach items="${projs}" var="proimages">
						<div class="images_box">
							<div></div>
							<img alt="" class="images" src="${contextPath}/pics/${proimages}" />
						</div>
					</c:forEach>
					<div class="row cl" id="projs">
						<label class="form-label col-2"></label>
						<div class="formControls col-10">
							<div class="uploader-list-container3 uploader-list-container"> 
								<div class="queueList">
									<div id="dndArea3" class="placeholder">
										<div id="filePicker-3"></div>
										<p>项目照片最多可选上传3张，会把之前的项目照片覆盖</p>
									</div>
								</div>
								<div class="statusBar" style="display:none;">
									<div class="progress"> <span class="text">0%</span> <span class="percentage"></span> </div>
									<div class="info"></div>
									<div class="btns">
										<div id="filePicker3"></div>
										<div class="uploadBtn">开始上传</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<input type="hidden" name="projPic" value="${project.projPic}" />
				</div>
				
				<div class="row cl">
					<span class="form-label col-2"><span class="c-red">*</span>发展规划：</span>
					<div class="formControls col-10">
						<textarea name="plan" class="textarea" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="textarealength(this,1000)">${project.plan}</textarea>
						<p class="textarea-numberbar"><em class="textarea-length">0</em>/1000</p>
					</div>
				</div>
				
				
				<div class="row cl pr">
					<span class="form-label col-2"><span class="c-red">*</span>团队照片：</span>
					<c:forEach items="${teams}" var="priteams">
						<div class="images_box">
							<div></div>
							<img alt="" class="images" src="${contextPath}/pics/${priteams}" />
						</div>
					</c:forEach>
					<div class="row cl" id="teams">
						<label class="form-label col-2"></label>
						<div class="formControls col-10">
							<div class="uploader-list-container4 uploader-list-container"> 
								<div class="queueList">
									<div id="dndArea4" class="placeholder">
										<div id="filePicker-4"></div>
										<p>团队照片最多可选上传3张，会把之前的团队照片覆盖</p>
									</div>
								</div>
								<div class="statusBar" style="display:none;">
									<div class="progress"> <span class="text">0%</span> <span class="percentage"></span> </div>
									<div class="info"></div>
									<div class="btns">
										<div id="filePicker4"></div>
										<div class="uploadBtn">开始上传</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<input type="hidden" name="teamPic" value="${project.teamPic}" />
				</div>
				
				<div class="row cl">
					<span class="form-label col-2"><span class="c-red">*</span>团队介绍：</span>
					<div class="formControls col-10">
						<textarea name="teamIntroduce" class="textarea" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="textarealength(this,1000)">${project.teamIntroduce}</textarea>
						<p class="textarea-numberbar"><em class="textarea-length">0</em>/1000</p>
					</div>
				</div>
				
				<c:if test="${project.mentorId==''}">
				<div  class="row cl">
					<span class="form-label col-2"><span class="c-red">*</span>项目导师：</span>
					<div class="formControls col-10">
						<p id="mentor"></p>
						<input name="mentor" type="text" class="input-text" style="width:250px;" placeholder="请输入导师手机号进行查询" />
						<input name="mentorId" type="hidden" />
						<button onclick="searchMentor();" class="btn btn-primary radius" type="button">查询</button>
					</div>
				</div>
				</c:if>
				<c:if test="${project.mentorId!=''}">
					<input name="mentorId" type="hidden" value="${project.mentorId}" />
				</c:if>
				
				<div  class="row cl">
					<span class="form-label col-2"><span class="c-red">*</span>是否SYE：</span>
					<div class="formControls col-10">
						<input type="radio" name="issye" value="1" <c:if test="${project.issye==1}">checked</c:if> />是&nbsp;&nbsp;&nbsp;&nbsp;
                    	<input type="radio" name="issye" value="0" <c:if test="${project.issye==0}">checked</c:if> />否
					</div>
				</div>
				
			</form>
			<br/>
			<div class="row cl">
				<div class="col-10 col-offset-2">
					<button onclick="submit();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 提交</button>
					<button onclick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
				</div>
			</div>
		</div>
	</body>
	
	<script type="text/javascript" src="${contextPath}/bg/lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/lib/layer/1.9.3/layer.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/lib/My97DatePicker/WdatePicker.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/lib/icheck/jquery.icheck.min.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/lib/Validform/5.3.2/Validform.min.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/lib/webuploader/0.1.5/webuploader.min.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/js/H-ui.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/js/H-ui.admin.js"></script> 
	
	<script type="text/javascript">
		var proImgs = "";//项目图片
		var teamImgs = "";//团队图片
		/* function delImg(t){
			$(t).parent().remove();
			console.info($(t).parent().next());
			$("#indexPic").show();
		} */
	
		//查询导师
		function searchMentor(){
			var mentor = $("input[name='mentor']").val();
			if(mentor != ""){
				$.ajax({
					url:'${contextPath}/bg/project/searchMentor',
					type:'post',
			 		dataType:'json',
					data:{"mentor":mentor},
					success:function(data){
						if(data.result==null){
							$("input[name='mentorId']").val("");
							$("#mentor").html("未查到相关导师信息");
						}else{
							var userName=data.result.userName;
							var role=data.result.role==1?'SYE导师':'非SYE导师';
							$("input[name='mentorId']").val(data.result.id);
							$("#mentor").html(userName+"&nbsp;&nbsp;&nbsp;&nbsp;"+role);
						}
					},
					error:function(data){
						$("input[name='mentorId']").val("");
						$("#mentor").html("未查到相关导师信息");
					}
				});
			}
		}
		
		$(function(){
			$("#status").find("option[value='${project.status}']").attr("selected",true);
			$("#business").find("option[value='${project.business}']").attr("selected",true);
			$("#zone").find("option[value='${project.zone}']").attr("selected",true);

			/*var proteamCount="${fn:length(teams)}";
			var proprojsCount="${fn:length(projs)}";
			if(proteamCount>=1){
				$("#teams").css("display","none");
			}
			if(proprojsCount>=1){
				$("#projs").css("display","none");
			}
			$("#indexPic").css("display","none");
			$("#logo").css("display","none"); */
		});
		
		var lock = false;
		/*验证表单信息*/
		function check(){
			if($("input[name='name']").val() == null || $("input[name='name']").val() == ""){
				layer.msg('请输入项目名称!',{icon:2,time:2000});
				return false;
			}
			return true;
		}
		
		function layer_close(){
			location.href="bgpro?start=${start}";
		}
		
		/*提交表单*/
		function submit(){
			if(lock){return;}
			//提交前验证
			if(!check()){return false;}
			lock = true;
			var url = "project-update";
			var method = $("#form-article-add").attr("method");
			var data = $("#form-article-add").serialize();
			$.ajax({
				url:url,
				type:method,
				data:data,
				success:function(result){
					layer.msg('提交成功!',{icon:1,time:1000});
					setTimeout('gotoResult()',1000);
				},
				error:function(result){
					layer.msg("系统错误",{icon:2,time:1000});
				}
			});
		}
		
		/*跳转*/
		function gotoResult(){
			location.href="bgpro?start=${start}";
		}
		
		//上传图片
		$(function(){
			$('.skin-minimal input').iCheck({
				checkboxClass: 'icheckbox-blue',
				radioClass: 'iradio-blue',
				increaseArea: '20%'
			});
			
			$list = $("#fileList"),
			$btn = $("#btn-star"),
			state = "pending",
			uploader1;
			uploader2;
			uploader3;
			uploader4;
		
		    var uploader1 = WebUploader.create({
				auto: true,
				swf: '../lib/webuploader/0.1.5/Uploader.swf',
				// 文件接收服务端。
				server: 'uploadImages',
				// 选择文件的按钮。可选。
				// 内部根据当前运行是创建，可能是input元素，也可能是flash.
				 pick: {
		             id: '#filePicker1',
		             label: '点击选择图片',
		             multiple:false
		         },
				// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
				resize: false,
				fileNumLimit: 1,
				// 只允许选择图片文件。
				accept: {
					title: 'Images',
					extensions: 'gif,jpg,jpeg,bmp,png',
					mimeTypes: 'image/*'
				}
			});
			uploader1.on( 'fileQueued', function( file ) {
				var $li = $(
					'<div id="' + file.id + '" class="item">' +
						'<div class="pic-box"><img></div>'+
						'<div class="info">' + file.name + '</div>' +
						'<p class="state">等待上传...</p>'+
					'</div>'
				),
				$img = $li.find('img');
				$list.append( $li );
				
				// 创建缩略图
				// 如果为非图片文件，可以不用调用此方法。
				// thumbnailWidth x thumbnailHeight 为 100 x 100
				uploader1.makeThumb( file, function( error, src ) {
					if ( error ) {
						$img.replaceWith('<span>不能预览</span>');
						return;
					}
			
					$img.attr( 'src', src );
				}, thumbnailWidth, thumbnailHeight );
			});
			// 文件上传过程中创建进度条实时显示。
			uploader1.on( 'uploadProgress', function( file, percentage ) {
				var $li = $( '#'+file.id ),
					$percent = $li.find('.progress-box .sr-only');
			
				// 避免重复创建
				if ( !$percent.length ) {
					$percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo( $li ).find('.sr-only');
				}
				$li.find(".state").text("上传中");
				$percent.css( 'width', percentage * 100 + '%' );
			});
			
			// 文件上传成功，给item添加成功class, 用样式标记上传成功。
			uploader1.on( 'uploadSuccess', function( file ) {
				$( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
			});
			
			// 文件上传失败，显示上传出错。
			uploader1.on( 'uploadError', function( file ) {
				$( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
			});
			
			// 完成上传完了，成功或者失败，先删除进度条。
			uploader1.on( 'uploadComplete', function( file ) {
				$( '#'+file.id ).find('.progress-box').fadeOut();
			});
			uploader1.on('all', function (type) {
		        if (type === 'startUpload') {
		            state = 'uploading';
		        } else if (type === 'stopUpload') {
		            state = 'paused';
		        } else if (type === 'uploadFinished') {
		            state = 'done';
		        }
		
		        if (state === 'uploading') {
		            $btn.text('暂停上传');
		        } else {
		            $btn.text('开始上传');
		        }
		    });
		
		    $btn.on('click', function () {
		        if (state === 'uploading') {
		        	uploader1.stop();
		        } else {
		        	uploader1.upload();
		        }
		    });

			var uploader2 = WebUploader.create({
				auto: true,
				swf: '../lib/webuploader/0.1.5/Uploader.swf',
				// 文件接收服务端。
				server: 'uploadImages',
				// 选择文件的按钮。可选。
				// 内部根据当前运行是创建，可能是input元素，也可能是flash.
				 pick: {
		             id: '#filePicker2',
		             label: '点击选择图片',
		             multiple:false
		         },
				// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
				resize: false,
				fileNumLimit: 1,
				// 只允许选择图片文件。
				accept: {
					title: 'Images',
					extensions: 'gif,jpg,jpeg,bmp,png',
					mimeTypes: 'image/*'
				},
			});
			uploader2.on( 'fileQueued', function( file ) {
				var $li = $(
					'<div id="' + file.id + '" class="item">' +
						'<div class="pic-box"><img></div>'+
						'<div class="info">' + file.name + '</div>' +
						'<p class="state">等待上传...</p>'+
					'</div>'
				),
				$img = $li.find('img');
				$list.append( $li );
				
				// 创建缩略图
				// 如果为非图片文件，可以不用调用此方法。
				// thumbnailWidth x thumbnailHeight 为 100 x 100
				uploader2.makeThumb( file, function( error, src ) {
					if ( error ) {
						$img.replaceWith('<span>不能预览</span>');
						return;
					}
			
					$img.attr( 'src', src );
				}, thumbnailWidth, thumbnailHeight );
			});
			// 文件上传过程中创建进度条实时显示。
			uploader2.on( 'uploadProgress', function( file, percentage ) {
				var $li = $( '#'+file.id ),
					$percent = $li.find('.progress-box .sr-only');
			
				// 避免重复创建
				if ( !$percent.length ) {
					$percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo( $li ).find('.sr-only');
				}
				$li.find(".state").text("上传中");
				$percent.css( 'width', percentage * 100 + '%' );
			});
			
			// 文件上传成功，给item添加成功class, 用样式标记上传成功。
			uploader2.on( 'uploadSuccess', function( file ) {
				$( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
			});
			
			// 文件上传失败，显示上传出错。
			uploader2.on( 'uploadError', function( file ) {
				$( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
			});
			
			// 完成上传完了，成功或者失败，先删除进度条。
			uploader2.on( 'uploadComplete', function( file ) {
				$( '#'+file.id ).find('.progress-box').fadeOut();
			});
			uploader2.on('all', function (type) {
		        if (type === 'startUpload') {
		            state = 'uploading';
		        } else if (type === 'stopUpload') {
		            state = 'paused';
		        } else if (type === 'uploadFinished') {
		            state = 'done';
		        }
		
		        if (state === 'uploading') {
		            $btn.text('暂停上传');
		        } else {
		            $btn.text('开始上传');
		        }
		    });
		
		    $btn.on('click', function () {
		        if (state === 'uploading') {
		            uploader2.stop();
		        } else {
		            uploader2.upload();
		        }
		    });

			var uploader3 = WebUploader.create({
				auto: true,
				swf: '../lib/webuploader/0.1.5/Uploader.swf',
				// 文件接收服务端。
				server: 'uploadImages',
				// 选择文件的按钮。可选。
				// 内部根据当前运行是创建，可能是input元素，也可能是flash.
				 pick: {
		             id: '#filePicker3',
		             label: '点击选择图片',
		             multiple:false
		         },
				// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
				resize: false,
				fileNumLimit: 3,
				// 只允许选择图片文件。
				accept: {
					title: 'Images',
					extensions: 'gif,jpg,jpeg,bmp,png',
					mimeTypes: 'image/*'
				},
			});
			uploader3.on( 'fileQueued', function( file ) {
				var $li = $(
					'<div id="' + file.id + '" class="item">' +
						'<div class="pic-box"><img></div>'+
						'<div class="info">' + file.name + '</div>' +
						'<p class="state">等待上传...</p>'+
					'</div>'
				),
				$img = $li.find('img');
				$list.append( $li );
				
				// 创建缩略图
				// 如果为非图片文件，可以不用调用此方法。
				// thumbnailWidth x thumbnailHeight 为 100 x 100
				uploader3.makeThumb( file, function( error, src ) {
					if ( error ) {
						$img.replaceWith('<span>不能预览</span>');
						return;
					}
			
					$img.attr( 'src', src );
				}, thumbnailWidth, thumbnailHeight );
			});
			// 文件上传过程中创建进度条实时显示。
			uploader3.on( 'uploadProgress', function( file, percentage ) {
				var $li = $( '#'+file.id ),
					$percent = $li.find('.progress-box .sr-only');
			
				// 避免重复创建
				if ( !$percent.length ) {
					$percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo( $li ).find('.sr-only');
				}
				$li.find(".state").text("上传中");
				$percent.css( 'width', percentage * 100 + '%' );
			});
			
			// 文件上传成功，给item添加成功class, 用样式标记上传成功。
			uploader3.on( 'uploadSuccess', function( file ) {
				$( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
			});
			
			// 文件上传失败，显示上传出错。
			uploader3.on( 'uploadError', function( file ) {
				$( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
			});
			
			// 完成上传完了，成功或者失败，先删除进度条。
			uploader3.on( 'uploadComplete', function( file ) {
				$( '#'+file.id ).find('.progress-box').fadeOut();
			});
			uploader3.on('all', function (type) {
		        if (type === 'startUpload') {
		            state = 'uploading';
		        } else if (type === 'stopUpload') {
		            state = 'paused';
		        } else if (type === 'uploadFinished') {
		            state = 'done';
		        }
		
		        if (state === 'uploading') {
		            $btn.text('暂停上传');
		        } else {
		            $btn.text('开始上传');
		        }
		    });
		
		    $btn.on('click', function () {
		        if (state === 'uploading') {
		            uploader3.stop();
		        } else {
		            uploader3.upload();
		        }
		    });

			var uploader4 = WebUploader.create({
				auto: true,
				swf: '../lib/webuploader/0.1.5/Uploader.swf',
				// 文件接收服务端。
				server: 'uploadImages',
				// 选择文件的按钮。可选。
				// 内部根据当前运行是创建，可能是input元素，也可能是flash.
				 pick: {
		             id: '#filePicker4',
		             label: '点击选择图片',
		             multiple:false
		         },
				// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
				resize: false,
				fileNumLimit: 3,
				// 只允许选择图片文件。
				accept: {
					title: 'Images',
					extensions: 'gif,jpg,jpeg,bmp,png',
					mimeTypes: 'image/*'
				},
			});
			uploader4.on( 'fileQueued', function( file ) {
				var $li = $(
					'<div id="' + file.id + '" class="item">' +
						'<div class="pic-box"><img></div>'+
						'<div class="info">' + file.name + '</div>' +
						'<p class="state">等待上传...</p>'+
					'</div>'
				),
				$img = $li.find('img');
				$list.append( $li );
				
				// 创建缩略图
				// 如果为非图片文件，可以不用调用此方法。
				// thumbnailWidth x thumbnailHeight 为 100 x 100
				uploader4.makeThumb( file, function( error, src ) {
					if ( error ) {
						$img.replaceWith('<span>不能预览</span>');
						return;
					}
			
					$img.attr( 'src', src );
				}, thumbnailWidth, thumbnailHeight );
			});
			// 文件上传过程中创建进度条实时显示。
			uploader4.on( 'uploadProgress', function( file, percentage ) {
				var $li = $( '#'+file.id ),
					$percent = $li.find('.progress-box .sr-only');
			
				// 避免重复创建
				if ( !$percent.length ) {
					$percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo( $li ).find('.sr-only');
				}
				$li.find(".state").text("上传中");
				$percent.css( 'width', percentage * 100 + '%' );
			});
			
			// 文件上传成功，给item添加成功class, 用样式标记上传成功。
			uploader4.on( 'uploadSuccess', function( file ) {
				$( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
			});
			
			// 文件上传失败，显示上传出错。
			uploader4.on( 'uploadError', function( file ) {
				$( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
			});
			
			// 完成上传完了，成功或者失败，先删除进度条。
			uploader4.on( 'uploadComplete', function( file ) {
				$( '#'+file.id ).find('.progress-box').fadeOut();
			});
			uploader4.on('all', function (type) {
		        if (type === 'startUpload') {
		            state = 'uploading';
		        } else if (type === 'stopUpload') {
		            state = 'paused';
		        } else if (type === 'uploadFinished') {
		            state = 'done';
		        }
		
		        if (state === 'uploading') {
		            $btn.text('暂停上传');
		        } else {
		            $btn.text('开始上传');
		        }
		    });
		
		    $btn.on('click', function () {
		        if (state === 'uploading') {
		            uploader4.stop();
		        } else {
		            uploader4.upload();
		        }
		    });
		    
		});
		
		
		(function( $ ){
		    // 当domReady的时候开始初始化
		    $(function() {
		        var $wrap = $('.uploader-list-container1'),
	            // 图片容器
	            $queue = $( '<ul class="filelist"></ul>' ).appendTo( $wrap.find( '.queueList' ) ),
	            // 状态栏，包括进度和控制按钮
	            $statusBar = $wrap.find( '.statusBar' ),
	            // 文件总体选择信息。
	            $info = $statusBar.find( '.info' ),
	            // 上传按钮
	            $upload = $wrap.find( '.uploadBtn' ),
	            // 没选择文件之前的内容。
	            $placeHolder = $wrap.find( '.placeholder' ),
	            $progress = $statusBar.find( '.progress' ).hide(),
	            // 添加的文件数量
	            fileCount = 0,
	            // 添加的文件总大小
	            fileSize = 0,
	            // 优化retina, 在retina下这个值是2
	            ratio = window.devicePixelRatio || 1,
	            // 缩略图大小
	            thumbnailWidth = 110 * ratio,
	            thumbnailHeight = 110 * ratio,
	            // 可能有pedding, ready, uploading, confirm, done.
	            state = 'pedding',
	            // 所有文件的进度信息，key为file id
	            percentages = {},
	            // 判断浏览器是否支持图片的base64
	            isSupportBase64 = ( function() {
	                var data = new Image();
	                var support = true;
	                data.onload = data.onerror = function() {
	                    if( this.width != 1 || this.height != 1 ) {
	                        support = false;
	                    }
	                }
	                data.src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
	                return support;
	            } )(),
	
	            // 检测是否已经安装flash，检测flash的版本
	            flashVersion = ( function() {
	                var version;
	                try {
	                    version = navigator.plugins[ 'Shockwave Flash' ];
	                    version = version.description;
	                } catch ( ex ) {
	                    try {
	                        version = new ActiveXObject('ShockwaveFlash.ShockwaveFlash')
	                                .GetVariable('$version');
	                    } catch ( ex2 ) {
	                        version = '0.0';
	                    }
	                }
	                version = version.match( /\d+/g );
	                return parseFloat( version[ 0 ] + '.' + version[ 1 ], 10 );
	            } )(),
	
	            supportTransition = (function(){
	                var s = document.createElement('p').style,
	                    r = 'transition' in s ||
	                            'WebkitTransition' in s ||
	                            'MozTransition' in s ||
	                            'msTransition' in s ||
	                            'OTransition' in s;
	                s = null;
	                return r;
	            })(),
	
	            // WebUploader实例
	            uploader1;
		
		        if ( !WebUploader.Uploader.support('flash') && WebUploader.browser.ie ) {
		            // flash 安装了但是版本过低。
		            if (flashVersion) {
		                (function(container) {
		                    window['expressinstallcallback'] = function( state ) {
		                        switch(state) {
		                            case 'Download.Cancelled':
		                                alert('您取消了更新！')
		                                break;
		                            case 'Download.Failed':
		                                alert('安装失败')
		                                break;
		                            default:
		                                alert('安装已成功，请刷新！');
		                                break;
		                        }
		                        delete window['expressinstallcallback'];
		                    };
		
		                    var swf = 'expressInstall.swf';
		                    // insert flash object
		                    var html = '<object type="application/' +
		                            'x-shockwave-flash" data="' +  swf + '" ';
		
		                    if (WebUploader.browser.ie) {
		                        html += 'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ';
		                    }
		
		                    html += 'width="100%" height="100%" style="outline:0">'  +
		                        '<param name="movie" value="' + swf + '" />' +
		                        '<param name="wmode" value="transparent" />' +
		                        '<param name="allowscriptaccess" value="always" />' +
		                    '</object>';
		
		                    container.html(html);
		
		                })($wrap);
		
		            // 压根就没有安转。
		            } else {
		                $wrap.html('<a href="http://www.adobe.com/go/getflashplayer" target="_blank" border="0"><img alt="get flash player" src="http://www.adobe.com/macromedia/style_guide/images/160x41_Get_Flash_Player.jpg" /></a>');
		            }
		
		            return;
		        } else if (!WebUploader.Uploader.support()) {
		            alert( 'Web Uploader 不支持您的浏览器！');
		            return;
		        }
		        
		        // 实例化
		        uploader1 = WebUploader.create({
		            pick: {
		                id: '#filePicker-1',
		                label: '点击选择图片',
		                multiple:false
		            },
		            formData: {
		                uid: 123
		            },
		            fileNumLimit:1,
		            dnd: '#dndArea1',
		            paste: '#uploader1',
		            swf: '../lib/webuploader/0.1.5/Uploader.swf',
		            chunked: false,
		            chunkSize: 512 * 1024,
		            server: 'uploadImages',
		
		            // 禁掉全局的拖拽功能。这样不会出现图片拖进页面的时候，把图片打开。
		            disableGlobalDnd: true,
		            fileSizeLimit: 200 * 1024 * 1024,    // 200 M
		            fileSingleSizeLimit: 50 * 1024 * 1024    // 50 M
		        });
		
		        // 拖拽时不接受 js, txt 文件。
		        uploader1.on( 'dndAccept', function( items ) {
		            var denied = false,
		                len = items.length,
		                i = 0,
		                // 修改js类型
		                unAllowed = 'text/plain;application/javascript ';
		
		            for ( ; i < len; i++ ) {
		                // 如果在列表里面
		                if ( ~unAllowed.indexOf( items[ i ].type ) ) {
		                    denied = true;
		                    break;
		                }
		            }
		
		            return !denied;
		        });
		
		        uploader1.on('dialogOpen', function() {
		            console.log('here');
		        });
		
		        // 添加“添加文件”的按钮，
		        $("#filePicker1").remove();
		        /* uploader1.addButton({
		            id: '#filePicker1',
		            label: '继续添加'
		        }); */
		  
		        uploader1.on('ready', function() {
		            window.uploader1 = uploader1;
		        });
		        uploader1.on('uploadSuccess',function(file,json){
		        	$("input[name='logo']").val(json.result);
		        });
		        // 当有文件添加进来时执行，负责view的创建
		        function addFile( file ) {
		            var $li = $( '<li id="' + file.id + '">' +
		                    '<p class="title">' + file.name + '</p>' +
		                    '<p class="imgWrap"></p>'+
		                    '<p class="progress"><span></span></p>' +
		                    '</li>' ),
		
		                $btns = $('<div class="file-panel">' +
		                    '<span class="cancel">删除</span>' +
		                    '<span class="rotateRight">向右旋转</span>' +
		                    '<span class="rotateLeft">向左旋转</span></div>').appendTo( $li ),
		                $prgress = $li.find('p.progress span'),
		                $wrap = $li.find( 'p.imgWrap' ),
		                $info = $('<p class="error"></p>'),
		
		                showError = function( code ) {
		                    switch( code ) {
		                        case 'exceed_size':
		                            text = '文件大小超出';
		                            break;
		                        case 'interrupt':
		                            text = '上传暂停';
		                            break;
		                        default:
		                            text = '上传失败，请重试';
		                            break;
		                    }
		                    $info.text( text ).appendTo( $li );
		                };
		
		            if ( file.getStatus() === 'invalid' ) {
		                showError( file.statusText );
		            } else {
		                // @todo lazyload
		                $wrap.text( '预览中' );
		                uploader1.makeThumb( file, function( error, src ) {
		                    var img;
		                    if ( error ) {
		                        $wrap.text( '不能预览' );
		                        return;
		                    }
		                    if( isSupportBase64 ) {
		                        img = $('<img src="'+src+'">');
		                        $wrap.empty().append( img );
		                    } else {
		                        $.ajax('../lib/webuploader/0.1.5/server/preview.php', {
		                            method: 'POST',
		                            data: src,
		                            dataType:'json'
		                        }).done(function( response ) {
		                            if (response.result) {
		                                img = $('<img src="'+response.result+'">');
		                                $wrap.empty().append( img );
		                            } else {
		                                $wrap.text("预览出错");
		                            }
		                        });
		                    }
		                }, thumbnailWidth, thumbnailHeight );
		
		                percentages[ file.id ] = [ file.size, 0 ];
		                file.rotation = 0;
		            }
		
		            file.on('statuschange', function( cur, prev ) {
		                if ( prev === 'progress' ) {
		                    $prgress.hide().width(0);
		                } else if ( prev === 'queued' ) {
		                    $li.off( 'mouseenter mouseleave' );
		                    $btns.remove();
		                }
		
		                // 成功
		                if ( cur === 'error' || cur === 'invalid' ) {
		                    console.log( file.statusText );
		                    showError( file.statusText );
		                    percentages[ file.id ][ 1 ] = 1;
		                } else if ( cur === 'interrupt' ) {
		                    showError( 'interrupt' );
		                } else if ( cur === 'queued' ) {
		                    percentages[ file.id ][ 1 ] = 0;
		                } else if ( cur === 'progress' ) {
		                    $info.remove();
		                    $prgress.css('display', 'block');
		                } else if ( cur === 'complete' ) {
		                    $li.append( '<span class="success"></span>' );
		                }
		                $li.removeClass( 'state-' + prev ).addClass( 'state-' + cur );
		            });
		            $li.on( 'mouseenter', function() {
		                $btns.stop().animate({height: 30});
		            });
		            $li.on( 'mouseleave', function() {
		                $btns.stop().animate({height: 0});
		            });
		            $btns.on( 'click', 'span', function() {
		                var index = $(this).index(),deg;
		                switch ( index ) {
		                    case 0:
		                    	uploader1.removeFile( file );
		                        return;
		                    case 1:
		                        file.rotation += 90;
		                        break;
		                    case 2:
		                        file.rotation -= 90;
		                        break;
		                }
		                if ( supportTransition ) {
		                    deg = 'rotate(' + file.rotation + 'deg)';
		                    $wrap.css({
		                        '-webkit-transform': deg,
		                        '-mos-transform': deg,
		                        '-o-transform': deg,
		                        'transform': deg
		                    });
		                } else {
		                    $wrap.css( 'filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation='+ (~~((file.rotation/90)%4 + 4)%4) +')');
		                }
		            });
		            $li.appendTo( $queue );
		        }
		        // 负责view的销毁
		        function removeFile( file ) {
		            var $li = $('#'+file.id);
		            delete percentages[ file.id ];
		            updateTotalProgress();
		            $li.off().find('.file-panel').off().end().remove();
		        }
		        function updateTotalProgress() {
		            var loaded = 0,total = 0,spans = $progress.children(),percent;
		            $.each( percentages, function( k, v ) {
		                total += v[ 0 ];
		                loaded += v[ 0 ] * v[ 1 ];
		            } );
		            percent = total ? loaded / total : 0;
		            spans.eq( 0 ).text( Math.round( percent * 100 ) + '%' );
		            spans.eq( 1 ).css( 'width', Math.round( percent * 100 ) + '%' );
		            updateStatus();
		        }
		
		        function updateStatus() {
		            var text = '', stats;
		            if ( state === 'ready' ) {
		                text = '选中' + fileCount + '张图片，共' +
		                        WebUploader.formatSize( fileSize ) + '。';
		            } else if ( state === 'confirm' ) {
		                stats = uploader1.getStats();
		                if ( stats.uploadFailNum ) {
		                    text = '已成功上传' + stats.successNum+ '张照片至服务器，'+
		                        stats.uploadFailNum + '张照片上传失败，<a class="retry" href="#">重新上传</a>失败图片或<a class="ignore" href="#">忽略</a>'
		                }
		            } else {
		                stats = uploader1.getStats();
		                text = '共' + fileCount + '张（' +
		                        WebUploader.formatSize( fileSize )  +
		                        '），已上传' + stats.successNum + '张';
		
		                if ( stats.uploadFailNum ) {
		                    text += '，失败' + stats.uploadFailNum + '张';
		                }
		            }
		            $info.html( text );
		        }
		
		        function setState( val ) {
		            var file, stats;
		            if ( val === state ) {return;}
		            $upload.removeClass( 'state-' + state );
		            $upload.addClass( 'state-' + val );
		            state = val;
		            switch ( state ) {
		                case 'pedding':
		                    $placeHolder.removeClass( 'element-invisible' );
		                    $queue.hide();
		                    $statusBar.addClass( 'element-invisible' );
		                    uploader1.refresh();
		                    break;
		                case 'ready':
		                    $placeHolder.addClass( 'element-invisible' );
		                    $( '#filePicker1' ).removeClass( 'element-invisible');
		                    $queue.show();
		                    $statusBar.removeClass('element-invisible');
		                    uploader1.refresh();
		                    break;
		                case 'uploading':
		                    $( '#filePicker1' ).addClass( 'element-invisible' );
		                    $progress.show();
		                    $upload.text( '暂停上传' );
		                    break;
		                case 'paused':
		                    $progress.show();
		                    $upload.text( '继续上传' );
		                    break;
		                case 'confirm':
		                    $progress.hide();
		                    $( '#filePicker1' ).removeClass( 'element-invisible' );
		                    $upload.text( '开始上传' );
		
		                    stats = uploader1.getStats();
		                    if ( stats.successNum && !stats.uploadFailNum ) {
		                        setState( 'finish' );
		                        return;
		                    }
		                    break;
		                case 'finish':
		                    stats = uploader1.getStats();
		                    if ( stats.successNum ) {
		                    	layer.msg('上传成功!',{icon:1,time:1000});
		                    } else {
		                        // 没有成功的图片，重设
		                        state = 'done';
		                        location.reload();
		                    }
		                    break;
		            }
		            updateStatus();
		        }
		        
		        uploader1.onUploadProgress = function( file, percentage ) {
		            var $li = $('#'+file.id),
		                $percent = $li.find('.progress span');
		
		            $percent.css( 'width', percentage * 100 + '%' );
		            percentages[ file.id ][ 1 ] = percentage;
		            updateTotalProgress();
		        };
		
		        uploader1.onFileQueued = function( file ) {
		            fileCount++;
		            fileSize += file.size;
		            if ( fileCount === 1 ) {
		                $placeHolder.addClass( 'element-invisible' );
		                $statusBar.show();
		            }
		            addFile( file );
		            setState( 'ready' );
		            updateTotalProgress();
		        };
		
		        uploader1.onFileDequeued = function( file ) {
		            fileCount--;
		            fileSize -= file.size;
		            if ( !fileCount ) {
		                setState( 'pedding' );
		            }
		            removeFile( file );
		            updateTotalProgress();
		        };
		
		        uploader1.on( 'all', function( type ) {
		            var stats;
		            switch( type ) {
		                case 'uploadFinished':
		                    setState( 'confirm' );
		                    break;
		                case 'startUpload':
		                    setState( 'uploading' );
		                    break;
		                case 'stopUpload':
		                    setState( 'paused' );
		                    break;
		            }
		        });
		
		        uploader1.onError = function( code ) {
		            alert( 'Eroor: ' + code );
		        };
		
		        $upload.on('click', function() {
		            if ( $(this).hasClass( 'disabled' ) ) {
		                return false;
		            }
		            if ( state === 'ready' ) {
		            	uploader1.upload();
		            } else if ( state === 'paused' ) {
		            	uploader1.upload();
		            } else if ( state === 'uploading' ) {
		            	uploader1.stop();
		            }
		        });
		        $info.on( 'click', '.retry', function() {
		        	uploader1.retry();
		        } );
		        $info.on( 'click', '.ignore', function() {
		            alert( 'todo' );
		        } );
		        $upload.addClass( 'state-' + state );
		        updateTotalProgress();
		    });
		})( jQuery );

		(function( $ ){
		    // 当domReady的时候开始初始化
		    $(function() {
		        var $wrap = $('.uploader-list-container2'),
	            // 图片容器
	            $queue = $( '<ul class="filelist"></ul>' ).appendTo( $wrap.find( '.queueList' ) ),
	            // 状态栏，包括进度和控制按钮
	            $statusBar = $wrap.find( '.statusBar' ),
	            // 文件总体选择信息。
	            $info = $statusBar.find( '.info' ),
	            // 上传按钮
	            $upload = $wrap.find( '.uploadBtn' ),
	            // 没选择文件之前的内容。
	            $placeHolder = $wrap.find( '.placeholder' ),
	            $progress = $statusBar.find( '.progress' ).hide(),
	            // 添加的文件数量
	            fileCount = 0,
	            // 添加的文件总大小
	            fileSize = 0,
	            // 优化retina, 在retina下这个值是2
	            ratio = window.devicePixelRatio || 1,
	            // 缩略图大小
	            thumbnailWidth = 110 * ratio,
	            thumbnailHeight = 110 * ratio,
	            // 可能有pedding, ready, uploading, confirm, done.
	            state = 'pedding',
	            // 所有文件的进度信息，key为file id
	            percentages = {},
	            // 判断浏览器是否支持图片的base64
	            isSupportBase64 = ( function() {
	                var data = new Image();
	                var support = true;
	                data.onload = data.onerror = function() {
	                    if( this.width != 1 || this.height != 1 ) {
	                        support = false;
	                    }
	                }
	                data.src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
	                return support;
	            } )(),
	
	            // 检测是否已经安装flash，检测flash的版本
	            flashVersion = ( function() {
	                var version;
	                try {
	                    version = navigator.plugins[ 'Shockwave Flash' ];
	                    version = version.description;
	                } catch ( ex ) {
	                    try {
	                        version = new ActiveXObject('ShockwaveFlash.ShockwaveFlash')
	                                .GetVariable('$version');
	                    } catch ( ex2 ) {
	                        version = '0.0';
	                    }
	                }
	                version = version.match( /\d+/g );
	                return parseFloat( version[ 0 ] + '.' + version[ 1 ], 10 );
	            } )(),
	
	            supportTransition = (function(){
	                var s = document.createElement('p').style,
	                    r = 'transition' in s ||
                            'WebkitTransition' in s ||
                            'MozTransition' in s ||
                            'msTransition' in s ||
                            'OTransition' in s;
	                s = null;
	                return r;
	            })(),
	
	            // WebUploader实例
	            uploader2;
		
		        if ( !WebUploader.Uploader.support('flash') && WebUploader.browser.ie ) {
		            // flash 安装了但是版本过低。
		            if (flashVersion) {
		                (function(container) {
		                    window['expressinstallcallback'] = function( state ) {
		                        switch(state) {
		                            case 'Download.Cancelled':
		                                alert('您取消了更新！')
		                                break;
		                            case 'Download.Failed':
		                                alert('安装失败')
		                                break;
		                            default:
		                                alert('安装已成功，请刷新！');
		                                break;
		                        }
		                        delete window['expressinstallcallback'];
		                    };
		
		                    var swf = 'expressInstall.swf';
		                    // insert flash object
		                    var html = '<object type="application/' +
		                            'x-shockwave-flash" data="' +  swf + '" ';
		
		                    if (WebUploader.browser.ie) {
		                        html += 'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ';
		                    }
		
		                    html += 'width="100%" height="100%" style="outline:0">'  +
		                        '<param name="movie" value="' + swf + '" />' +
		                        '<param name="wmode" value="transparent" />' +
		                        '<param name="allowscriptaccess" value="always" />' +
		                    '</object>';
		
		                    container.html(html);
		
		                })($wrap);
		
		            // 压根就没有安转。
		            } else {
		                $wrap.html('<a href="http://www.adobe.com/go/getflashplayer" target="_blank" border="0"><img alt="get flash player" src="http://www.adobe.com/macromedia/style_guide/images/160x41_Get_Flash_Player.jpg" /></a>');
		            }
		
		            return;
		        } else if (!WebUploader.Uploader.support()) {
		            alert( 'Web Uploader 不支持您的浏览器！');
		            return;
		        }
		        
		        // 实例化
		        uploader2 = WebUploader.create({
		            pick: {
		                id: '#filePicker-2',
		                label: '点击选择图片',
		                multiple:false
		            },
		            formData: {
		                uid: 123
		            },
		            fileNumLimit:1,
		            dnd: '#dndArea2',
		            paste: '#uploader2',
		            swf: '../lib/webuploader/0.1.5/Uploader.swf',
		            chunked: false,
		            chunkSize: 512 * 1024,
		            server: 'uploadImages',
		
		            // 禁掉全局的拖拽功能。这样不会出现图片拖进页面的时候，把图片打开。
		            disableGlobalDnd: true,
		            fileSizeLimit: 200 * 1024 * 1024,    // 200 M
		            fileSingleSizeLimit: 50 * 1024 * 1024    // 50 M
		        });
		
		        // 拖拽时不接受 js, txt 文件。
		        uploader2.on( 'dndAccept', function( items ) {
		            var denied = false,
		                len = items.length,
		                i = 0,
		                // 修改js类型
		                unAllowed = 'text/plain;application/javascript ';
		
		            for ( ; i < len; i++ ) {
		                // 如果在列表里面
		                if ( ~unAllowed.indexOf( items[ i ].type ) ) {
		                    denied = true;
		                    break;
		                }
		            }
		
		            return !denied;
		        });
		
		        uploader2.on('dialogOpen', function() {
		            console.log('here');
		        });
		
		        $("#filePicker2").remove();
		        // 添加“添加文件”的按钮，
		        /* uploader2.addButton({
		            id: '#filePicker2',
		            label: '继续添加'
		        }); */
		  
		        uploader2.on('ready', function() {
		            window.uploader2 = uploader2;
		        });
		        //图片上传成功后
		        uploader2.on('uploadSuccess',function(file,json){
		        	$("input[name='indexPic']").val(json.result);
		        });
		        // 当有文件添加进来时执行，负责view的创建
		        function addFile( file ) {
		            var $li = $( '<li id="' + file.id + '">' +
		                    '<p class="title">' + file.name + '</p>' +
		                    '<p class="imgWrap"></p>'+
		                    '<p class="progress"><span></span></p>' +
		                    '</li>' ),
		
		                $btns = $('<div class="file-panel">' +
		                    '<span class="cancel">删除</span>' +
		                    '<span class="rotateRight">向右旋转</span>' +
		                    '<span class="rotateLeft">向左旋转</span></div>').appendTo( $li ),
		                $prgress = $li.find('p.progress span'),
		                $wrap = $li.find( 'p.imgWrap' ),
		                $info = $('<p class="error"></p>'),
		                showError = function( code ) {
		                    switch( code ) {
		                        case 'exceed_size':
		                            text = '文件大小超出';
		                            break;
		                        case 'interrupt':
		                            text = '上传暂停';
		                            break;
		                        default:
		                            text = '上传失败，请重试';
		                            break;
		                    }
		                    $info.text( text ).appendTo( $li );
		                };
		
		            if ( file.getStatus() === 'invalid' ) {
		                showError( file.statusText );
		            } else {
		                // @todo lazyload
		                $wrap.text( '预览中' );
		                uploader2.makeThumb( file, function( error, src ) {
		                    var img;
		                    if ( error ) {
		                        $wrap.text( '不能预览' );
		                        return;
		                    }
		                    if( isSupportBase64 ) {
		                        img = $('<img src="'+src+'">');
		                        $wrap.empty().append( img );
		                    } else {
		                        $.ajax('../lib/webuploader/0.1.5/server/preview.php', {
		                            method: 'POST',
		                            data: src,
		                            dataType:'json'
		                        }).done(function( response ) {
		                            if (response.result) {
		                                img = $('<img src="'+response.result+'">');
		                                $wrap.empty().append( img );
		                            } else {
		                                $wrap.text("预览出错");
		                            }
		                        });
		                    }
		                }, thumbnailWidth, thumbnailHeight );
		
		                percentages[ file.id ] = [ file.size, 0 ];
		                file.rotation = 0;
		            }
		
		            file.on('statuschange', function( cur, prev ) {
		                if ( prev === 'progress' ) {
		                    $prgress.hide().width(0);
		                } else if ( prev === 'queued' ) {
		                    $li.off( 'mouseenter mouseleave' );
		                    $btns.remove();
		                }
		
		                // 成功
		                if ( cur === 'error' || cur === 'invalid' ) {
		                    console.log( file.statusText );
		                    showError( file.statusText );
		                    percentages[ file.id ][ 1 ] = 1;
		                } else if ( cur === 'interrupt' ) {
		                    showError( 'interrupt' );
		                } else if ( cur === 'queued' ) {
		                    percentages[ file.id ][ 1 ] = 0;
		                } else if ( cur === 'progress' ) {
		                    $info.remove();
		                    $prgress.css('display', 'block');
		                } else if ( cur === 'complete' ) {
		                    $li.append( '<span class="success"></span>' );
		                }
		                $li.removeClass( 'state-' + prev ).addClass( 'state-' + cur );
		            });
		            $li.on( 'mouseenter', function() {
		                $btns.stop().animate({height: 30});
		            });
		            $li.on( 'mouseleave', function() {
		                $btns.stop().animate({height: 0});
		            });
		
		            $btns.on( 'click', 'span', function() {
		                var index = $(this).index(),deg;
		                switch ( index ) {
		                    case 0:
		                    	uploader2.removeFile( file );
		                        return;
		                    case 1:
		                        file.rotation += 90;
		                        break;
		                    case 2:
		                        file.rotation -= 90;
		                        break;
		                }
		                if ( supportTransition ) {
		                    deg = 'rotate(' + file.rotation + 'deg)';
		                    $wrap.css({
		                        '-webkit-transform': deg,
		                        '-mos-transform': deg,
		                        '-o-transform': deg,
		                        'transform': deg
		                    });
		                } else {
		                    $wrap.css( 'filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation='+ (~~((file.rotation/90)%4 + 4)%4) +')');
		                }
		            });
		            $li.appendTo( $queue );
		        }
		        // 负责view的销毁
		        function removeFile( file ) {
		            var $li = $('#'+file.id);
		
		            delete percentages[ file.id ];
		            updateTotalProgress();
		            $li.off().find('.file-panel').off().end().remove();
		        }
		        function updateTotalProgress() {
		            var loaded = 0,
		                total = 0,
		                spans = $progress.children(),
		                percent;
		            $.each( percentages, function( k, v ) {
		                total += v[ 0 ];
		                loaded += v[ 0 ] * v[ 1 ];
		            } );
		            percent = total ? loaded / total : 0;
		            spans.eq( 0 ).text( Math.round( percent * 100 ) + '%' );
		            spans.eq( 1 ).css( 'width', Math.round( percent * 100 ) + '%' );
		            updateStatus();
		        }
		
		        function updateStatus() {
		            var text = '', stats;
		            if ( state === 'ready' ) {
		                text = '选中' + fileCount + '张图片，共' +
		                        WebUploader.formatSize( fileSize ) + '。';
		            } else if ( state === 'confirm' ) {
		                stats = uploader2.getStats();
		                if ( stats.uploadFailNum ) {
		                    text = '已成功上传' + stats.successNum+ '张照片至服务器，'+
		                        stats.uploadFailNum + '张照片上传失败，<a class="retry" href="#">重新上传</a>失败图片或<a class="ignore" href="#">忽略</a>'
		                }
		            } else {
		                stats = uploader2.getStats();
		                text = '共' + fileCount + '张（' +
		                        WebUploader.formatSize( fileSize )  +
		                        '），已上传' + stats.successNum + '张';
		
		                if ( stats.uploadFailNum ) {
		                    text += '，失败' + stats.uploadFailNum + '张';
		                }
		            }
		            $info.html( text );
		        }
		
		        function setState( val ) {
		            var file, stats;
		            if ( val === state ) {return;}
		            $upload.removeClass( 'state-' + state );
		            $upload.addClass( 'state-' + val );
		            state = val;
		            switch ( state ) {
		                case 'pedding':
		                    $placeHolder.removeClass( 'element-invisible' );
		                    $queue.hide();
		                    $statusBar.addClass( 'element-invisible' );
		                    uploader2.refresh();
		                    break;
		                case 'ready':
		                    $placeHolder.addClass( 'element-invisible' );
		                    $( '#filePicker2' ).removeClass( 'element-invisible');
		                    $queue.show();
		                    $statusBar.removeClass('element-invisible');
		                    uploader2.refresh();
		                    break;
		                case 'uploading':
		                    $( '#filePicker2' ).addClass( 'element-invisible' );
		                    $progress.show();
		                    $upload.text( '暂停上传' );
		                    break;
		                case 'paused':
		                    $progress.show();
		                    $upload.text( '继续上传' );
		                    break;
		                case 'confirm':
		                    $progress.hide();
		                    $( '#filePicker2' ).removeClass( 'element-invisible' );
		                    $upload.text( '开始上传' );
		
		                    stats = uploader2.getStats();
		                    if ( stats.successNum && !stats.uploadFailNum ) {
		                        setState( 'finish' );
		                        return;
		                    }
		                    break;
		                case 'finish':
		                    stats = uploader2.getStats();
		                    if ( stats.successNum ) {
		                    	layer.msg('上传成功!',{icon:1,time:1000});
		                    } else {
		                        // 没有成功的图片，重设
		                        state = 'done';
		                        location.reload();
		                    }
		                    break;
		            }
		            updateStatus();
		        }
		        
		        uploader2.onUploadProgress = function( file, percentage ) {
		            var $li = $('#'+file.id),
		                $percent = $li.find('.progress span');
		
		            $percent.css( 'width', percentage * 100 + '%' );
		            percentages[ file.id ][ 1 ] = percentage;
		            updateTotalProgress();
		        };
		
		        uploader2.onFileQueued = function( file ) {
		            fileCount++;
		            fileSize += file.size;
		            if ( fileCount === 1 ) {
		                $placeHolder.addClass( 'element-invisible' );
		                $statusBar.show();
		            }
		            addFile( file );
		            setState( 'ready' );
		            updateTotalProgress();
		        };
		
		        uploader2.onFileDequeued = function( file ) {
		            fileCount--;
		            fileSize -= file.size;
		            if ( !fileCount ) {
		                setState( 'pedding' );
		            }
		            removeFile( file );
		            updateTotalProgress();
		        };
		
		        uploader2.on( 'all', function( type ) {
		            var stats;
		            switch( type ) {
		                case 'uploadFinished':
		                    setState( 'confirm' );
		                    break;
		                case 'startUpload':
		                    setState( 'uploading' );
		                    break;
		                case 'stopUpload':
		                    setState( 'paused' );
		                    break;
		            }
		        });
		
		        uploader2.onError = function( code ) {
		            alert( 'Eroor: ' + code );
		        };
		
		        $upload.on('click', function() {
		            if ( $(this).hasClass( 'disabled' ) ) {
		                return false;
		            }
		            if ( state === 'ready' ) {
		            	uploader2.upload();
		            } else if ( state === 'paused' ) {
		            	uploader2.upload();
		            } else if ( state === 'uploading' ) {
		            	uploader2.stop();
		            }
		        });
		        $info.on( 'click', '.retry', function() {
		        	uploader2.retry();
		        } );
		        $info.on( 'click', '.ignore', function() {
		            alert( 'todo' );
		        } );
		        $upload.addClass( 'state-' + state );
		        updateTotalProgress();
		    });
		})( jQuery );

		(function( $ ){
		    // 当domReady的时候开始初始化
		    $(function() {
		        var $wrap = $('.uploader-list-container3'),
	            // 图片容器
	            $queue = $( '<ul class="filelist"></ul>' ).appendTo( $wrap.find( '.queueList' ) ),
	            // 状态栏，包括进度和控制按钮
	            $statusBar = $wrap.find( '.statusBar' ),
	            // 文件总体选择信息。
	            $info = $statusBar.find( '.info' ),
	            // 上传按钮
	            $upload = $wrap.find( '.uploadBtn' ),
	            // 没选择文件之前的内容。
	            $placeHolder = $wrap.find( '.placeholder' ),
	            $progress = $statusBar.find( '.progress' ).hide(),
	            // 添加的文件数量
	            fileCount = 0,
	            // 添加的文件总大小
	            fileSize = 0,
	            // 优化retina, 在retina下这个值是2
	            ratio = window.devicePixelRatio || 1,
	            // 缩略图大小
	            thumbnailWidth = 110 * ratio,
	            thumbnailHeight = 110 * ratio,
	            // 可能有pedding, ready, uploading, confirm, done.
	            state = 'pedding',
	            // 所有文件的进度信息，key为file id
	            percentages = {},
	            // 判断浏览器是否支持图片的base64
	            isSupportBase64 = ( function() {
	                var data = new Image();
	                var support = true;
	                data.onload = data.onerror = function() {
	                    if( this.width != 1 || this.height != 1 ) {
	                        support = false;
	                    }
	                }
	                data.src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
	                return support;
	            } )(),
	
	            // 检测是否已经安装flash，检测flash的版本
	            flashVersion = ( function() {
	                var version;
	                try {
	                    version = navigator.plugins[ 'Shockwave Flash' ];
	                    version = version.description;
	                } catch ( ex ) {
	                    try {
	                        version = new ActiveXObject('ShockwaveFlash.ShockwaveFlash')
	                                .GetVariable('$version');
	                    } catch ( ex2 ) {
	                        version = '0.0';
	                    }
	                }
	                version = version.match( /\d+/g );
	                return parseFloat( version[ 0 ] + '.' + version[ 1 ], 10 );
	            } )(),
	
	            supportTransition = (function(){
	                var s = document.createElement('p').style,
	                    r = 'transition' in s ||
                            'WebkitTransition' in s ||
                            'MozTransition' in s ||
                            'msTransition' in s ||
                            'OTransition' in s;
	                s = null;
	                return r;
	            })(),
	
	            // WebUploader实例
	            uploader3;
		
		        if ( !WebUploader.Uploader.support('flash') && WebUploader.browser.ie ) {
		            // flash 安装了但是版本过低。
		            if (flashVersion) {
		                (function(container) {
		                    window['expressinstallcallback'] = function( state ) {
		                        switch(state) {
		                            case 'Download.Cancelled':
		                                alert('您取消了更新！')
		                                break;
		                            case 'Download.Failed':
		                                alert('安装失败')
		                                break;
		                            default:
		                                alert('安装已成功，请刷新！');
		                                break;
		                        }
		                        delete window['expressinstallcallback'];
		                    };
		
		                    var swf = 'expressInstall.swf';
		                    // insert flash object
		                    var html = '<object type="application/' +
		                            'x-shockwave-flash" data="' +  swf + '" ';
		
		                    if (WebUploader.browser.ie) {
		                        html += 'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ';
		                    }
		
		                    html += 'width="100%" height="100%" style="outline:0">'  +
		                        '<param name="movie" value="' + swf + '" />' +
		                        '<param name="wmode" value="transparent" />' +
		                        '<param name="allowscriptaccess" value="always" />' +
		                    '</object>';
		
		                    container.html(html);
		
		                })($wrap);
		
		            // 压根就没有安转。
		            } else {
		                $wrap.html('<a href="http://www.adobe.com/go/getflashplayer" target="_blank" border="0"><img alt="get flash player" src="http://www.adobe.com/macromedia/style_guide/images/160x41_Get_Flash_Player.jpg" /></a>');
		            }
		
		            return;
		        } else if (!WebUploader.Uploader.support()) {
		            alert( 'Web Uploader 不支持您的浏览器！');
		            return;
		        }
		        
		        // 实例化
		        uploader3 = WebUploader.create({
		            pick: {
		                id: '#filePicker-3',
		                label: '点击选择图片',
		                multiple:false
		            },
		            formData: {
		                uid: 123
		            },
		            fileNumLimit:3,
		            dnd: '#dndArea3',
		            paste: '#uploader3',
		            swf: '../lib/webuploader/0.1.5/Uploader.swf',
		            chunked: false,
		            chunkSize: 512 * 1024,
		            server: 'uploadImages',
		
		            // 禁掉全局的拖拽功能。这样不会出现图片拖进页面的时候，把图片打开。
		            disableGlobalDnd: true,
		            fileSizeLimit: 200 * 1024 * 1024,    // 200 M
		            fileSingleSizeLimit: 50 * 1024 * 1024    // 50 M
		        });
		
		        // 拖拽时不接受 js, txt 文件。
		        uploader3.on( 'dndAccept', function( items ) {
		            var denied = false,
		                len = items.length,
		                i = 0,
		                // 修改js类型
		                unAllowed = 'text/plain;application/javascript ';
		
		            for ( ; i < len; i++ ) {
		                // 如果在列表里面
		                if ( ~unAllowed.indexOf( items[ i ].type ) ) {
		                    denied = true;
		                    break;
		                }
		            }
		
		            return !denied;
		        });
		
		        uploader3.on('dialogOpen', function() {
		            console.log('here');
		        });
		
		        // 添加“添加文件”的按钮，
		        uploader3.addButton({
		            id: '#filePicker3',
		            label: '继续添加'
		        });
		  
		        uploader3.on('ready', function() {
		            window.uploader3 = uploader3;
		        });
		        //图片上传成功后
		        uploader3.on('uploadSuccess',function(file,json){
		        	proImgs +=json.result;
		        	proImgs +=",";
		        	$("input[name='projPic']").val(proImgs);
		        });
		        // 当有文件添加进来时执行，负责view的创建
		        function addFile( file ) {
		            var $li = $( '<li id="' + file.id + '">' +
		                    '<p class="title">' + file.name + '</p>' +
		                    '<p class="imgWrap"></p>'+
		                    '<p class="progress"><span></span></p>' +
		                    '</li>' ),
		
		                $btns = $('<div class="file-panel">' +
		                    '<span class="cancel">删除</span>' +
		                    '<span class="rotateRight">向右旋转</span>' +
		                    '<span class="rotateLeft">向左旋转</span></div>').appendTo( $li ),
		                $prgress = $li.find('p.progress span'),
		                $wrap = $li.find( 'p.imgWrap' ),
		                $info = $('<p class="error"></p>'),
		
		                showError = function( code ) {
		                    switch( code ) {
		                        case 'exceed_size':
		                            text = '文件大小超出';
		                            break;
		                        case 'interrupt':
		                            text = '上传暂停';
		                            break;
		                        default:
		                            text = '上传失败，请重试';
		                            break;
		                    }
		                    $info.text( text ).appendTo( $li );
		                };
		
		            if ( file.getStatus() === 'invalid' ) {
		                showError( file.statusText );
		            } else {
		                // @todo lazyload
		                $wrap.text( '预览中' );
		                uploader3.makeThumb( file, function( error, src ) {
		                    var img;
		                    if ( error ) {
		                        $wrap.text( '不能预览' );
		                        return;
		                    }
		                    if( isSupportBase64 ) {
		                        img = $('<img src="'+src+'">');
		                        $wrap.empty().append( img );
		                    } else {
		                        $.ajax('../lib/webuploader/0.1.5/server/preview.php', {
		                            method: 'POST',
		                            data: src,
		                            dataType:'json'
		                        }).done(function( response ) {
		                            if (response.result) {
		                                img = $('<img src="'+response.result+'">');
		                                $wrap.empty().append( img );
		                            } else {
		                                $wrap.text("预览出错");
		                            }
		                        });
		                    }
		                }, thumbnailWidth, thumbnailHeight );
		
		                percentages[ file.id ] = [ file.size, 0 ];
		                file.rotation = 0;
		            }
		
		            file.on('statuschange', function( cur, prev ) {
		                if ( prev === 'progress' ) {
		                    $prgress.hide().width(0);
		                } else if ( prev === 'queued' ) {
		                    $li.off( 'mouseenter mouseleave' );
		                    $btns.remove();
		                }
		
		                // 成功
		                if ( cur === 'error' || cur === 'invalid' ) {
		                    console.log( file.statusText );
		                    showError( file.statusText );
		                    percentages[ file.id ][ 1 ] = 1;
		                } else if ( cur === 'interrupt' ) {
		                    showError( 'interrupt' );
		                } else if ( cur === 'queued' ) {
		                    percentages[ file.id ][ 1 ] = 0;
		                } else if ( cur === 'progress' ) {
		                    $info.remove();
		                    $prgress.css('display', 'block');
		                } else if ( cur === 'complete' ) {
		                    $li.append( '<span class="success"></span>' );
		                }
		                $li.removeClass( 'state-' + prev ).addClass( 'state-' + cur );
		            });
		            $li.on( 'mouseenter', function() {
		                $btns.stop().animate({height: 30});
		            });
		            $li.on( 'mouseleave', function() {
		                $btns.stop().animate({height: 0});
		            });
		
		            $btns.on( 'click', 'span', function() {
		                var index = $(this).index(),deg;
		                switch ( index ) {
		                    case 0:
		                    	uploader3.removeFile( file );
		                        return;
		                    case 1:
		                        file.rotation += 90;
		                        break;
		                    case 2:
		                        file.rotation -= 90;
		                        break;
		                }
		                if ( supportTransition ) {
		                    deg = 'rotate(' + file.rotation + 'deg)';
		                    $wrap.css({
		                        '-webkit-transform': deg,
		                        '-mos-transform': deg,
		                        '-o-transform': deg,
		                        'transform': deg
		                    });
		                } else {
		                    $wrap.css( 'filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation='+ (~~((file.rotation/90)%4 + 4)%4) +')');
		                }
		            });
		            $li.appendTo( $queue );
		        }
		        // 负责view的销毁
		        function removeFile( file ) {
		            var $li = $('#'+file.id);
		
		            delete percentages[ file.id ];
		            updateTotalProgress();
		            $li.off().find('.file-panel').off().end().remove();
		        }
		        function updateTotalProgress() {
		            var loaded = 0,
		                total = 0,
		                spans = $progress.children(),
		                percent;
		            $.each( percentages, function( k, v ) {
		                total += v[ 0 ];
		                loaded += v[ 0 ] * v[ 1 ];
		            } );
		            percent = total ? loaded / total : 0;
		            spans.eq( 0 ).text( Math.round( percent * 100 ) + '%' );
		            spans.eq( 1 ).css( 'width', Math.round( percent * 100 ) + '%' );
		            updateStatus();
		        }
		
		        function updateStatus() {
		            var text = '', stats;
		            if ( state === 'ready' ) {
		                text = '选中' + fileCount + '张图片，共' +
		                        WebUploader.formatSize( fileSize ) + '。';
		            } else if ( state === 'confirm' ) {
		                stats = uploader3.getStats();
		                if ( stats.uploadFailNum ) {
		                    text = '已成功上传' + stats.successNum+ '张照片至服务器，'+
		                        stats.uploadFailNum + '张照片上传失败，<a class="retry" href="#">重新上传</a>失败图片或<a class="ignore" href="#">忽略</a>'
		                }
		            } else {
		                stats = uploader3.getStats();
		                text = '共' + fileCount + '张（' +
		                        WebUploader.formatSize( fileSize )  +
		                        '），已上传' + stats.successNum + '张';
		
		                if ( stats.uploadFailNum ) {
		                    text += '，失败' + stats.uploadFailNum + '张';
		                }
		            }
		            $info.html( text );
		        }
		
		        function setState( val ) {
		            var file, stats;
		            if ( val === state ) {return;}
		            $upload.removeClass( 'state-' + state );
		            $upload.addClass( 'state-' + val );
		            state = val;
		            switch ( state ) {
		                case 'pedding':
		                    $placeHolder.removeClass( 'element-invisible' );
		                    $queue.hide();
		                    $statusBar.addClass( 'element-invisible' );
		                    uploader3.refresh();
		                    break;
		                case 'ready':
		                    $placeHolder.addClass( 'element-invisible' );
		                    $( '#filePicker3' ).removeClass( 'element-invisible');
		                    $queue.show();
		                    $statusBar.removeClass('element-invisible');
		                    uploader3.refresh();
		                    break;
		                case 'uploading':
		                    $( '#filePicker3' ).addClass( 'element-invisible' );
		                    $progress.show();
		                    $upload.text( '暂停上传' );
		                    break;
		                case 'paused':
		                    $progress.show();
		                    $upload.text( '继续上传' );
		                    break;
		                case 'confirm':
		                    $progress.hide();
		                    $( '#filePicker3' ).removeClass( 'element-invisible' );
		                    $upload.text( '开始上传' );
		
		                    stats = uploader3.getStats();
		                    if ( stats.successNum && !stats.uploadFailNum ) {
		                        setState( 'finish' );
		                        return;
		                    }
		                    break;
		                case 'finish':
		                    stats = uploader3.getStats();
		                    if ( stats.successNum ) {
		                    	layer.msg('上传成功!',{icon:1,time:1000});
		                    } else {
		                        // 没有成功的图片，重设
		                        state = 'done';
		                        location.reload();
		                    }
		                    break;
		            }
		            updateStatus();
		        }
		        
		        uploader3.onUploadProgress = function( file, percentage ) {
		            var $li = $('#'+file.id),
		                $percent = $li.find('.progress span');
		
		            $percent.css( 'width', percentage * 100 + '%' );
		            percentages[ file.id ][ 1 ] = percentage;
		            updateTotalProgress();
		        };
		
		        uploader3.onFileQueued = function( file ) {
		            fileCount++;
		            fileSize += file.size;
		            if ( fileCount === 1 ) {
		                $placeHolder.addClass( 'element-invisible' );
		                $statusBar.show();
		            }
		            addFile( file );
		            setState( 'ready' );
		            updateTotalProgress();
		        };
		
		        uploader3.onFileDequeued = function( file ) {
		            fileCount--;
		            fileSize -= file.size;
		            if ( !fileCount ) {
		                setState( 'pedding' );
		            }
		            removeFile( file );
		            updateTotalProgress();
		        };
		
		        uploader3.on( 'all', function( type ) {
		            var stats;
		            switch( type ) {
		                case 'uploadFinished':
		                    setState( 'confirm' );
		                    break;
		                case 'startUpload':
		                    setState( 'uploading' );
		                    break;
		                case 'stopUpload':
		                    setState( 'paused' );
		                    break;
		            }
		        });
		
		        uploader3.onError = function( code ) {
		            alert( 'Eroor: ' + code );
		        };
		
		        $upload.on('click', function() {
		            if ( $(this).hasClass( 'disabled' ) ) {
		                return false;
		            }
		            if ( state === 'ready' ) {
		            	uploader3.upload();
		            } else if ( state === 'paused' ) {
		            	uploader3.upload();
		            } else if ( state === 'uploading' ) {
		            	uploader3.stop();
		            }
		        });
		        $info.on( 'click', '.retry', function() {
		        	uploader3.retry();
		        } );
		        $info.on( 'click', '.ignore', function() {
		            alert( 'todo' );
		        } );
		        $upload.addClass( 'state-' + state );
		        updateTotalProgress();
		    });
		})( jQuery );

		(function( $ ){
		    // 当domReady的时候开始初始化
		    $(function() {
		        var $wrap = $('.uploader-list-container4'),
	            // 图片容器
	            $queue = $( '<ul class="filelist"></ul>' ).appendTo( $wrap.find( '.queueList' ) ),
	            // 状态栏，包括进度和控制按钮
	            $statusBar = $wrap.find( '.statusBar' ),
	            // 文件总体选择信息。
	            $info = $statusBar.find( '.info' ),
	            // 上传按钮
	            $upload = $wrap.find( '.uploadBtn' ),
	            // 没选择文件之前的内容。
	            $placeHolder = $wrap.find( '.placeholder' ),
	            $progress = $statusBar.find( '.progress' ).hide(),
	            // 添加的文件数量
	            fileCount = 0,
	            // 添加的文件总大小
	            fileSize = 0,
	            // 优化retina, 在retina下这个值是2
	            ratio = window.devicePixelRatio || 1,
	            // 缩略图大小
	            thumbnailWidth = 110 * ratio,
	            thumbnailHeight = 110 * ratio,
	            // 可能有pedding, ready, uploading, confirm, done.
	            state = 'pedding',
	            // 所有文件的进度信息，key为file id
	            percentages = {},
	            // 判断浏览器是否支持图片的base64
	            isSupportBase64 = ( function() {
	                var data = new Image();
	                var support = true;
	                data.onload = data.onerror = function() {
	                    if( this.width != 1 || this.height != 1 ) {
	                        support = false;
	                    }
	                }
	                data.src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
	                return support;
	            } )(),
	
	            // 检测是否已经安装flash，检测flash的版本
	            flashVersion = ( function() {
	                var version;
	                try {
	                    version = navigator.plugins[ 'Shockwave Flash' ];
	                    version = version.description;
	                } catch ( ex ) {
	                    try {
	                        version = new ActiveXObject('ShockwaveFlash.ShockwaveFlash')
	                                .GetVariable('$version');
	                    } catch ( ex2 ) {
	                        version = '0.0';
	                    }
	                }
	                version = version.match( /\d+/g );
	                return parseFloat( version[ 0 ] + '.' + version[ 1 ], 10 );
	            } )(),
	
	            supportTransition = (function(){
	                var s = document.createElement('p').style,
	                    r = 'transition' in s ||
                            'WebkitTransition' in s ||
                            'MozTransition' in s ||
                            'msTransition' in s ||
                            'OTransition' in s;
	                s = null;
	                return r;
	            })(),
	
	            // WebUploader实例
	            uploader4;
		
		        if ( !WebUploader.Uploader.support('flash') && WebUploader.browser.ie ) {
		            // flash 安装了但是版本过低。
		            if (flashVersion) {
		                (function(container) {
		                    window['expressinstallcallback'] = function( state ) {
		                        switch(state) {
		                            case 'Download.Cancelled':
		                                alert('您取消了更新！')
		                                break;
		                            case 'Download.Failed':
		                                alert('安装失败')
		                                break;
		                            default:
		                                alert('安装已成功，请刷新！');
		                                break;
		                        }
		                        delete window['expressinstallcallback'];
		                    };
		
		                    var swf = 'expressInstall.swf';
		                    // insert flash object
		                    var html = '<object type="application/' +
		                            'x-shockwave-flash" data="' +  swf + '" ';
		
		                    if (WebUploader.browser.ie) {
		                        html += 'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ';
		                    }
		
		                    html += 'width="100%" height="100%" style="outline:0">'  +
		                        '<param name="movie" value="' + swf + '" />' +
		                        '<param name="wmode" value="transparent" />' +
		                        '<param name="allowscriptaccess" value="always" />' +
		                    '</object>';
		
		                    container.html(html);
		
		                })($wrap);
		
		            // 压根就没有安转。
		            } else {
		                $wrap.html('<a href="http://www.adobe.com/go/getflashplayer" target="_blank" border="0"><img alt="get flash player" src="http://www.adobe.com/macromedia/style_guide/images/160x41_Get_Flash_Player.jpg" /></a>');
		            }
		
		            return;
		        } else if (!WebUploader.Uploader.support()) {
		            alert( 'Web Uploader 不支持您的浏览器！');
		            return;
		        }
		        
		        // 实例化
		        uploader4 = WebUploader.create({
		            pick: {
		                id: '#filePicker-4',
		                label: '点击选择图片',
		                multiple:false
		            },
		            formData: {
		                uid: 123
		            },
		            fileNumLimit:3,
		            dnd: '#dndArea4',
		            paste: '#uploader4',
		            swf: '../lib/webuploader/0.1.5/Uploader.swf',
		            chunked: false,
		            chunkSize: 512 * 1024,
		            server: 'uploadImages',
		
		            // 禁掉全局的拖拽功能。这样不会出现图片拖进页面的时候，把图片打开。
		            disableGlobalDnd: true,
		            fileSizeLimit: 200 * 1024 * 1024,    // 200 M
		            fileSingleSizeLimit: 50 * 1024 * 1024    // 50 M
		        });
		
		        // 拖拽时不接受 js, txt 文件。
		        uploader4.on( 'dndAccept', function( items ) {
		            var denied = false,
		                len = items.length,
		                i = 0,
		                // 修改js类型
		                unAllowed = 'text/plain;application/javascript ';
		
		            for ( ; i < len; i++ ) {
		                // 如果在列表里面
		                if ( ~unAllowed.indexOf( items[ i ].type ) ) {
		                    denied = true;
		                    break;
		                }
		            }
		
		            return !denied;
		        });
		
		        uploader4.on('dialogOpen', function() {
		            console.log('here');
		        });
		
		        // 添加“添加文件”的按钮，
		        uploader4.addButton({
		            id: '#filePicker4',
		            label: '继续添加'
		        });
		  
		        uploader4.on('ready', function() {
		            window.uploader4 = uploader4;
		        });
		        //图片上传成功后
		        uploader4.on('uploadSuccess',function(file,json){
		        	teamImgs +=json.result;
		        	teamImgs +=",";
		        	$("input[name='teamPic']").val(teamImgs);
		        });
		        // 当有文件添加进来时执行，负责view的创建
		        function addFile( file ) {
		            var $li = $( '<li id="' + file.id + '">' +
		                    '<p class="title">' + file.name + '</p>' +
		                    '<p class="imgWrap"></p>'+
		                    '<p class="progress"><span></span></p>' +
		                    '</li>' ),
		
		                $btns = $('<div class="file-panel">' +
		                    '<span class="cancel">删除</span>' +
		                    '<span class="rotateRight">向右旋转</span>' +
		                    '<span class="rotateLeft">向左旋转</span></div>').appendTo( $li ),
		                $prgress = $li.find('p.progress span'),
		                $wrap = $li.find( 'p.imgWrap' ),
		                $info = $('<p class="error"></p>'),
		
		                showError = function( code ) {
		                    switch( code ) {
		                        case 'exceed_size':
		                            text = '文件大小超出';
		                            break;
		                        case 'interrupt':
		                            text = '上传暂停';
		                            break;
		                        default:
		                            text = '上传失败，请重试';
		                            break;
		                    }
		                    $info.text( text ).appendTo( $li );
		                };
		
		            if ( file.getStatus() === 'invalid' ) {
		                showError( file.statusText );
		            } else {
		                // @todo lazyload
		                $wrap.text( '预览中' );
		                uploader4.makeThumb( file, function( error, src ) {
		                    var img;
		                    if ( error ) {
		                        $wrap.text( '不能预览' );
		                        return;
		                    }
		                    if( isSupportBase64 ) {
		                        img = $('<img src="'+src+'">');
		                        $wrap.empty().append( img );
		                    } else {
		                        $.ajax('../lib/webuploader/0.1.5/server/preview.php', {
		                            method: 'POST',
		                            data: src,
		                            dataType:'json'
		                        }).done(function( response ) {
		                            if (response.result) {
		                                img = $('<img src="'+response.result+'">');
		                                $wrap.empty().append( img );
		                            } else {
		                                $wrap.text("预览出错");
		                            }
		                        });
		                    }
		                }, thumbnailWidth, thumbnailHeight );
		
		                percentages[ file.id ] = [ file.size, 0 ];
		                file.rotation = 0;
		            }
		
		            file.on('statuschange', function( cur, prev ) {
		                if ( prev === 'progress' ) {
		                    $prgress.hide().width(0);
		                } else if ( prev === 'queued' ) {
		                    $li.off( 'mouseenter mouseleave' );
		                    $btns.remove();
		                }
		
		                // 成功
		                if ( cur === 'error' || cur === 'invalid' ) {
		                    console.log( file.statusText );
		                    showError( file.statusText );
		                    percentages[ file.id ][ 1 ] = 1;
		                } else if ( cur === 'interrupt' ) {
		                    showError( 'interrupt' );
		                } else if ( cur === 'queued' ) {
		                    percentages[ file.id ][ 1 ] = 0;
		                } else if ( cur === 'progress' ) {
		                    $info.remove();
		                    $prgress.css('display', 'block');
		                } else if ( cur === 'complete' ) {
		                    $li.append( '<span class="success"></span>' );
		                }
		                $li.removeClass( 'state-' + prev ).addClass( 'state-' + cur );
		            });
		            $li.on( 'mouseenter', function() {
		                $btns.stop().animate({height: 30});
		            });
		            $li.on( 'mouseleave', function() {
		                $btns.stop().animate({height: 0});
		            });
		
		            $btns.on( 'click', 'span', function() {
		                var index = $(this).index(),deg;
		                switch ( index ) {
		                    case 0:
		                    	uploader4.removeFile( file );
		                        return;
		                    case 1:
		                        file.rotation += 90;
		                        break;
		                    case 2:
		                        file.rotation -= 90;
		                        break;
		                }
		                if ( supportTransition ) {
		                    deg = 'rotate(' + file.rotation + 'deg)';
		                    $wrap.css({
		                        '-webkit-transform': deg,
		                        '-mos-transform': deg,
		                        '-o-transform': deg,
		                        'transform': deg
		                    });
		                } else {
		                    $wrap.css( 'filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation='+ (~~((file.rotation/90)%4 + 4)%4) +')');
		                }
		            });
		            $li.appendTo( $queue );
		        }
		        // 负责view的销毁
		        function removeFile( file ) {
		            var $li = $('#'+file.id);
		
		            delete percentages[ file.id ];
		            updateTotalProgress();
		            $li.off().find('.file-panel').off().end().remove();
		        }
		        function updateTotalProgress() {
		            var loaded = 0,
		                total = 0,
		                spans = $progress.children(),
		                percent;
		            $.each( percentages, function( k, v ) {
		                total += v[ 0 ];
		                loaded += v[ 0 ] * v[ 1 ];
		            } );
		            percent = total ? loaded / total : 0;
		            spans.eq( 0 ).text( Math.round( percent * 100 ) + '%' );
		            spans.eq( 1 ).css( 'width', Math.round( percent * 100 ) + '%' );
		            updateStatus();
		        }
		
		        function updateStatus() {
		            var text = '', stats;
		            if ( state === 'ready' ) {
		                text = '选中' + fileCount + '张图片，共' +
		                        WebUploader.formatSize( fileSize ) + '。';
		            } else if ( state === 'confirm' ) {
		                stats = uploader4.getStats();
		                if ( stats.uploadFailNum ) {
		                    text = '已成功上传' + stats.successNum+ '张照片至服务器，'+
		                        stats.uploadFailNum + '张照片上传失败，<a class="retry" href="#">重新上传</a>失败图片或<a class="ignore" href="#">忽略</a>'
		                }
		            } else {
		                stats = uploader4.getStats();
		                text = '共' + fileCount + '张（' +
		                        WebUploader.formatSize( fileSize )  +
		                        '），已上传' + stats.successNum + '张';
		
		                if ( stats.uploadFailNum ) {
		                    text += '，失败' + stats.uploadFailNum + '张';
		                }
		            }
		            $info.html( text );
		        }
		
		        function setState( val ) {
		            var file, stats;
		            if ( val === state ) {return;}
		            $upload.removeClass( 'state-' + state );
		            $upload.addClass( 'state-' + val );
		            state = val;
		            switch ( state ) {
		                case 'pedding':
		                    $placeHolder.removeClass( 'element-invisible' );
		                    $queue.hide();
		                    $statusBar.addClass( 'element-invisible' );
		                    uploader4.refresh();
		                    break;
		                case 'ready':
		                    $placeHolder.addClass( 'element-invisible' );
		                    $( '#filePicker4' ).removeClass( 'element-invisible');
		                    $queue.show();
		                    $statusBar.removeClass('element-invisible');
		                    uploader4.refresh();
		                    break;
		                case 'uploading':
		                    $( '#filePicker4' ).addClass( 'element-invisible' );
		                    $progress.show();
		                    $upload.text( '暂停上传' );
		                    break;
		                case 'paused':
		                    $progress.show();
		                    $upload.text( '继续上传' );
		                    break;
		                case 'confirm':
		                    $progress.hide();
		                    $( '#filePicker4' ).removeClass( 'element-invisible' );
		                    $upload.text( '开始上传' );
		
		                    stats = uploader4.getStats();
		                    if ( stats.successNum && !stats.uploadFailNum ) {
		                        setState( 'finish' );
		                        return;
		                    }
		                    break;
		                case 'finish':
		                    stats = uploader4.getStats();
		                    if ( stats.successNum ) {
		                    	layer.msg('上传成功!',{icon:1,time:1000});
		                    } else {
		                        // 没有成功的图片，重设
		                        state = 'done';
		                        location.reload();
		                    }
		                    break;
		            }
		            updateStatus();
		        }
		        
		        uploader4.onUploadProgress = function( file, percentage ) {
		            var $li = $('#'+file.id),
		                $percent = $li.find('.progress span');
		
		            $percent.css( 'width', percentage * 100 + '%' );
		            percentages[ file.id ][ 1 ] = percentage;
		            updateTotalProgress();
		        };
		
		        uploader4.onFileQueued = function( file ) {
		            fileCount++;
		            fileSize += file.size;
		            if ( fileCount === 1 ) {
		                $placeHolder.addClass( 'element-invisible' );
		                $statusBar.show();
		            }
		            addFile( file );
		            setState( 'ready' );
		            updateTotalProgress();
		        };
		
		        uploader4.onFileDequeued = function( file ) {
		            fileCount--;
		            fileSize -= file.size;
		            if ( !fileCount ) {
		                setState( 'pedding' );
		            }
		            removeFile( file );
		            updateTotalProgress();
		        };
		
		        uploader4.on( 'all', function( type ) {
		            var stats;
		            switch( type ) {
		                case 'uploadFinished':
		                    setState( 'confirm' );
		                    break;
		                case 'startUpload':
		                    setState( 'uploading' );
		                    break;
		                case 'stopUpload':
		                    setState( 'paused' );
		                    break;
		            }
		        });
		
		        uploader4.onError = function( code ) {
		            alert( 'Eroor: ' + code );
		        };
		
		        $upload.on('click', function() {
		            if ( $(this).hasClass( 'disabled' ) ) {
		                return false;
		            }
		            if ( state === 'ready' ) {
		            	uploader4.upload();
		            } else if ( state === 'paused' ) {
		            	uploader4.upload();
		            } else if ( state === 'uploading' ) {
		            	uploader4.stop();
		            }
		        });
		        $info.on( 'click', '.retry', function() {
		        	uploader4.retry();
		        } );
		        $info.on( 'click', '.ignore', function() {
		            alert( 'todo' );
		        } );
		        $upload.addClass( 'state-' + state );
		        updateTotalProgress();
		    });
		})( jQuery );
		
	</script>
</html>