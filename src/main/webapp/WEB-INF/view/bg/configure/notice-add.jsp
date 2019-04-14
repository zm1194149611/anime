<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		
		<title>公告</title>
	</head>
	
	<body>
		<div class="pd-20">
			<form  method="post" class="form form-horizontal" id="form-article-add">
				<!-- <div class="row cl">
					<label class="form-label col-2"><span class="c-red">*</span>公告位置：</label>
					<div class="formControls col-10">
						<select name="sysNoticeLocal" id="sysNoticeLocal">
							<option value="1">首页</option>
							<option value="2">首页1</option>
							<option value="3">首页2</option>
						</select>
					</div>
				</div> -->
				
				<div class="row cl">
					<span class="form-label col-2"><span class="c-red">*</span>公告内容：</span>
					<div class="formControls col-10">
						<input type="text" class="input-text" style="width:250px;" placeholder="" id="" name="syeNoticeContent" value="${sye.syeNoticeContent}" />
					</div>
				</div>
				
			</form>
			<br/>
			<div class="row cl">
					<div class="col-10 col-offset-2">
						<button onClick="submit();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 提交</button>
						<button onClick="history.back();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
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
	<script type="text/javascript" src="${contextPath}/js/approve.js"></script> 
	<script type="text/javascript">
	var lock = false;
	/*验证表单信息*/
	function check(){
		if($("input[name='syeNoticeContent']").val() == null || $("input[name='syeNoticeContent']").val() == ""){
			layer.msg('请输入公告内容!',{icon:2,time:2000});
			return false;
		}
		return true;
	}
	function layer_close(){
		location.href="notice?start=${start}";
	}
	
	/*提交表单*/
	function submit(){
		var syeNoticeId="${sye.syeNoticeId}";
		if(lock){
			return;
		}
		//提交前验证
		if(!check()){
			return false;
		}
		lock = true;
		var url = "notice-add";
		if(syeNoticeId!=""){
			$("input[name='syeNoticeContent']").append("<input type='hidden' name='syeNoticeId' value='${sye.syeNoticeId}' />");
			url = "notice-update";
		}
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
		location.href="notice?start=${start}";
	}
	</script>
</html>