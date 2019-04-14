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
<title>配置孵化园</title>
</head>
<body>
<div class="pd-20">
<%-- <c:forEach var="industryFromPark" items="${incubationPark.listIndustryLabel}">
	<input type="hidden" class="hidden_industry" value="${industryFromPark.industryLabelName}"/>
</c:forEach> --%>
	<form  method="post" class="form form-horizontal" id="form-article-add">
	<input type="hidden" value="${incubationPark.softParkId}" name="softParkId"/>
		<div class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>孵化园名称：</span>
			<div class="formControls col-10">
				<input type="text" class="input-text" style="width:180px;" value="${incubationPark.softName }" placeholder="" id="" name="softName">
			</div>
		</div>
		<div class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>工位剩余：</span>
			<div class="formControls col-10">
				<input type="text" class="input-text" style="width:50px;" value="${incubationPark.freeCount}" placeholder="" id="" name="freeCount">&nbsp;个
			</div>
			
		</div>
		
		<div class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>工位总量：</span>
			<div class="formControls col-10">
				<input type="text" class="input-text" style="width:50px;" value="${incubationPark.totalCount}" placeholder="" id="" name="totalCount">&nbsp;个
			</div>
			
		</div>
		<div  class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>工位单价：</span>
			<div class="formControls col-10">
				<input type="text" class="input-text" style="width:50px;" value="${incubationPark.stationPrice}" placeholder="" id="" name="stationPrice">&nbsp;元
			</div>
			
		</div>
		
		<div  class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>入驻项目数量：</label>
			<div class="formControls col-10">
				<input type="text" class="input-text" style="width:50px;" value="${incubationPark.projectCount}" placeholder="" id="" name="projectCount">&nbsp;个
			</div>
			
		</div>
		
	</form>
	<br/>
	<div class="row cl">
			<div class="col-10 col-offset-2">
				<button onClick="submit();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 提交</button>
				<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
</div>
<script type="text/javascript" src="${contextPath}/bg/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/lib/layer/1.9.3/layer.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/lib/Validform/5.3.2/Validform.min.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/js/H-ui.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/js/H-ui.admin.js"></script> 
<script type="text/javascript">
/* $(function(){
	//回显行业checkbox
	var industry = $(":checkbox");
	var industryFromPark = $(".hidden_industry");
	for(var i=0;i < industryFromPark.length; i++){
		for(var j = 0; j < industry.length; j++){
			if($(industryFromPark[i]).attr("value") == $(industry[j]).attr("value")){
				$(industry[j]).attr("checked","checked");
			}
		}
	}
}); */

/*验证表单信息*/
function check(){
	//alert($("input[name='stationPrice']").val());
	if($("input[name='softName']").val() == null || $("input[name='softName']").val() == ""){
		layer.msg('请输入孵化园名称!',{icon:2,time:2000});
		return false;
	}else if($("input[name='freeCount']").val() == "" || isNaN($("input[name='freeCount']").val())){
		layer.msg('工位剩余必须为数字类型!',{icon:2,time:2000});
		return false;
	}else if($("input[name='totalCount']").val() == "" || isNaN($("input[name='totalCount']").val())){
		layer.msg('工位总量必须为数字类型!',{icon:2,time:2000});
		return false;
	}else if($("input[name='stationPrice']").val() == "" || isNaN($("input[name='stationPrice']").val())){
		layer.msg('工位单价必须为数字类型!',{icon:2,time:2000});
		return false;
	}else if($("input[name='projectCount']").val() == "" || isNaN($("input[name='projectCount']").val())){
		layer.msg('入驻项目数量必须为数字类型!',{icon:2,time:2000});
		return false;
	}
	return true;
}

//跳转到指定页面
function gotoResult(){
	location.href = 'incubationpark-setUI?pageIndex=1';
}

function submit(){
	if(!check()){
		return false;
	}
	var url = "incubationpark-update";//$("#incubationpark-add").attr("action");
	var method = $("#form-article-add").attr("method");
	var data = $("#form-article-add").serialize();
	$.ajax({
		url:url,
		type:method,
		data:data,
		success:function(result){
			layer.msg('修改成功!',{icon:1,time:1000});
			setTimeout('gotoResult()',1000);
			//location.href = result;
		}
	});
	
}

function layer_close(){
	location.href="incubationpark-setUI?pageIndex=1";
}
</script>

</body>
</html>