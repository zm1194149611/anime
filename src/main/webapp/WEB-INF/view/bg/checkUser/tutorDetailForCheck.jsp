<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="../css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="../css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="../lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<link href="../lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>导师身份认证</title>
</head>
<style type="text/css">
	.text-l ul li{
		text-align:center;
	}
</style>
<body>
<div class="pd-20">
	<h3>基本资料</h3>
	<!-- <div class="pd-20"> -->
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="30" style="display:none;">ID</th>
					<th width="40">姓名</th>
					<th width="30">性别</th>
					<th width="80">身份证号</th>					
					<th width="100">昵称</th>
					<th width="100">角色</th>
					<th width="75" style="display:none;">区域</th>
					<th width="120">公司</th>
					<th width="80">职位</th>
					<th width="80">手机</th>
					<th width="80">邮箱</th>
				</tr>
			</thead>
			<tbody>
				<tr class="text-c">
					<td style="display:none;">${userFullInfo.id}</td>
					<td>${userFullInfo.userName}</td>
					<c:if test="${userFullInfo.gender==1}">
					 <td>男</td>
				    </c:if>
					<c:if test="${userFullInfo.gender==2}">
					 <td>女</td>
				    </c:if>
				     <c:if test="${user.gender==null||user.gender==''}">
				    	<td></td>
				    </c:if>
					<td>${userFullInfo.certification}</td>					
					<td>${userFullInfo.nickName}</td>
					<c:if test="${userFullInfo.role==5}">
					 <td>待认证导师</td>
				    </c:if>
				    <c:if test="${userFullInfo.role==6}">
					 <td >待认证创业者</td>
				    </c:if>	
					<td style="display:none;">${userFullInfo.zone}</td>
					<td>${userFullInfo.companyName}</td>
					<td>${userFullInfo.position}</td>
					<td>${userFullInfo.telphoneNumber}</td>
					<td>${userFullInfo.emailAddress}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<br/>
	<h3>身份认证</h3>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="15%">头像</th>
					<th width="15%">座右铭</th>
					<th width="20%">导师头衔</th>
					<th width="30%">书籍和文章</th>
					<th width="20%">我的标签</th>
				</tr>
			</thead>
			<tbody>
				<tr class="text-c">
					<td><img src="${userFullInfo.headImgUrl}" class="identity_add_text_c_img"/></td>
					<td>${userFullInfo.motto}</td>
					<td>${userFullInfo.rank}</td>
					<td class="text-l">
							<ul>
								<li>${userFullInfo.writtenbook}</li>
								<!-- <li>新闻标题</li>
								<li>娱乐标题</li> -->
							</ul>
					</td>
					<td>软件行业，评审导师，公众演讲</td>
				</tr>
			</tbody>
		</table>
	</div>
	<h3>添加关键字搜索</h3>
	<div class="form-label col-5 companyName" id="head-list"></div>
		<div class="row cl">
			<input type="hidden" name=keySearch value="${userFullInfo.keySearch}" />
			<!-- <label class="form-label col-2"><span class="c-red">*</span>请输入关键字：</label> -->
				<div class="formControls col-10" id="head-input">
					<input class="input-text" style="width:250px;" id="head-rank" type="text" onblur="lostfocus('head-rank');"
						placeholder="输入导师姓名,昵称，电话等"> <span id="head-bottom" class="bottom-company">确认</span>
				</div>
		</div>
		
	<!-- 单选按钮 -->
	<span class="identity_add_footer" style="margin-top:20px;">
		SYE:<input type="radio" name="choice" value="1" checked="checked" />是
		<input type="radio" name="choice" value="0" />否
	</span>
	<!-- 按钮 -->
	<div class="identity_add_footer">
		<a class="identity_add_btn" onClick="approve('${userFullInfo.id}')" href="javascript:;" title="审核通过">通过</a>
        <%-- <a class="identity_add_btn" onClick="approve(0,'${userFullInfo.id}')" href="javascript:;" title="审核不通过">不通过</a> --%>
        <a class="identity_add_btn" href="javascript:history.back();" title="取消">取消</a>
	</div>
</div>
<script type="text/javascript" src="../lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="../lib/layer/1.9.3/layer.js"></script> 
<script type="text/javascript" src="../lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="../lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="../lib/Validform/5.3.2/Validform.min.js"></script> 
<script type="text/javascript" src="../lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="../lib/ueditor/1.4.3/ueditor.config.js"></script> 
<script type="text/javascript" src="../lib/ueditor/1.4.3/ueditor.all.min.js"> </script> 
<script type="text/javascript" src="../lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script> 
<script type="text/javascript" src="../js/H-ui.js"></script> 
<script type="text/javascript" src="../js/H-ui.admin.js"></script>
<script type="text/javascript" src="${contextPath}/js/approve.js"></script> 
<script type="text/javascript">
$(function(){
	addHead('head-rank','head-bottom','head-list');
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$list = $("#fileList"),
	$btn = $("#btn-star"),
	state = "pending",
	uploader;

	var uploader = WebUploader.create({
		auto: true,
		swf: 'lib/webuploader/0.1.5/Uploader.swf',
	
		// 文件接收服务端。
		server: 'http://lib.h-ui.net/webuploader/0.1.5/server/fileupload.php',
	
		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick: '#filePicker',
	
		// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		resize: false,
		// 只允许选择图片文件。
		accept: {
			title: 'Images',
			extensions: 'gif,jpg,jpeg,bmp,png',
			mimeTypes: 'image/*'
		}
	});
	uploader.on( 'fileQueued', function( file ) {
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
		uploader.makeThumb( file, function( error, src ) {
			if ( error ) {
				$img.replaceWith('<span>不能预览</span>');
				return;
			}
	
			$img.attr( 'src', src );
		}, thumbnailWidth, thumbnailHeight );
	});
	// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
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
	uploader.on( 'uploadSuccess', function( file ) {
		$( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
	});
	
	// 文件上传失败，显示上传出错。
	uploader.on( 'uploadError', function( file ) {
		$( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
	});
	
	// 完成上传完了，成功或者失败，先删除进度条。
	uploader.on( 'uploadComplete', function( file ) {
		$( '#'+file.id ).find('.progress-box').fadeOut();
	});
	uploader.on('all', function (type) {
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
            uploader.stop();
        } else {
            uploader.upload();
        }
    });

	
	
	var ue = UE.getEditor('editor');
	
});

/*身份-审核*/
function article_shenhe(obj,id){
	layer.confirm('审核文章？', {
		btn: ['通过','不通过'], 
		shade: false
	},
	function(){
		// $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已审核</span>');
		$(obj).remove();
		layer.msg('已审核', {icon:6,time:1000});
	},
	function(){
		// $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
		$(obj).remove();
    	layer.msg('未通过', {icon:5,time:1000});
	});	
}
function mobanxuanze(){
	
}

function approve(userid){
	addList();
	var choice=$('input[name="choice"]:checked ').val();
	var keySearch=$("input[name='keySearch']").val();
	/* if(flag==1){ */
		window.location.href="approve?userId="+userid+"&keySearch="+keySearch+"&choice="+choice;
	/* }else{
		window.location.href="unapprove?userId="+userid;
	} */
}

function addList(){
	var keySearch="";//入驻公司
	var divList=$("#head-list div");
	for(var i=0;i<divList.length;i++){
		var value=divList[i].getElementsByTagName("p")[0].innerHTML+",";
		keySearch +=value;
	}
	if(keySearch==""){
		keySearch +="${userFullInfo.userName},<spring:message code='project.zone.zone${userFullInfo.zone}' />,";
	}
	$("input[name='keySearch']").val(keySearch.substring(0,keySearch.lastIndexOf(',')));
}


</script>
</body>
</html>