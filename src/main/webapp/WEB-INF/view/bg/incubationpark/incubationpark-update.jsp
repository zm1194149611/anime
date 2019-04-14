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
<title>修改孵化园</title>
</head>
<body>
<div class="pd-20">
<!-- 用于回显行业 -->
 <c:forEach var="industryFromPark" items="${incubationPark.listIndustryLabel}">
	<input type="hidden" class="hidden_industry" value="${industryFromPark.industryLabelName}"/>
</c:forEach>
<!-- 用于回显服务 -->
 <c:forEach var="serviceFromPark" items="${incubationPark.listServiceLabel}">
	<input type="hidden" class="hidden_service" value="${serviceFromPark.serviceLabelName}"/>
</c:forEach>
	<form  method="post" class="form form-horizontal" id="form-article-add">
	<input type="hidden" value="${incubationPark.softParkId}" name="softParkId"/>
		<div class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>孵化园名称：</span>
			<div class="formControls col-10">
				<input type="text" class="input-text" style="width:180px;" onblur="ipnameCheck(this);" value="${incubationPark.softName }" placeholder="" id="" name="softName">
			</div>
		</div>
		
		<div class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>孵化园地址：</span>
			<div class="formControls col-10">
				<input type="text" class="input-text" style="width:250px;" onblur="ipaddressCheck(this);" value="${incubationPark.softParkAddress }" placeholder="" id="" name="softParkAddress">
			</div>
		</div>
		
		<div class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>园区性质：</span>
			<div class="formControls col-10">
				<input type="text" class="input-text" style="width:250px;"  placeholder="" id="" name="softParkCharacter" value="${incubationPark.softParkCharacter}" />
			</div>
		</div>
		
		<div class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>工位总量：</span>
			<div class="formControls col-10">
				<input type="text" class="input-text" style="width:50px;" value="${incubationPark.totalCount }" placeholder="" id="" name="totalCount">&nbsp;个
			</div>
			
		</div>
		<div  class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>工位单价：</span>
			<div class="formControls col-10">
				<input type="text" class="input-text" style="width:50px;" value="${incubationPark.stationPrice }" placeholder="" id="" name="stationPrice">&nbsp;元
			</div>
			
		</div>
		<div id = "industry" class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>所属行业：</span>
			<c:forEach var="industryName" items="${industryNameList}">
				<span class="">
			<input type="checkbox" value="${industryName}" onclick="industryCheck(this);" name="industryList" id="user-Character-1-0-0">
				${industryName}
			</span>
			&nbsp;
			</c:forEach>
			
		</div>
		
		<div id="service" class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>提供服务：</span>
			<c:forEach var="serviceName" items="${serviceNameList}">
				<span class="">
			<input type="checkbox" value="${serviceName}" onclick="serviceCheck(this);" name="serviceList" id="user-Character-1-0-0">
				${serviceName}
			</span>
			&nbsp;
			</c:forEach>
		</div>
		
		<div class="form-label col-5 companyName" id="head-list"></div>
		<div class="row cl">
			<input type="hidden" name="companyName" value="${incubationPark.companyName}" />
			<span class="form-label col-2"><span class="c-red">*</span>入驻企业：</span>
				<div class="formControls col-10" id="head-input">
					<input class="input-text" style="width:250px;" id="head-rank" type="text" onblur="lostfocus('head-rank');"
						placeholder="请输公司名称"> <span id="head-bottom" class="bottom-company">确认</span>
				</div>
		</div>
		
		<div class="form-label col-5 companyName" id="companyRequest-list"></div>
		<div class="row cl">
			<input type="hidden" name="projectRequire" value="${incubationPark.projectRequire}" />
			<span class="form-label col-2"><span class="c-red">*</span>入驻企业要求：</span>
				<div class="formControls col-10" id="request-input">
					<input class="input-text" style="width:250px;" id="companyRequest" type="text" onblur="lostfocus('head-rank');"
						placeholder="请输入驻企业要求"> <span id="companyRequest-bottom" class="bottom-company">确认</span>
				</div>
		</div>
		
		<div class="form-label col-5 companyName" id="goodPolicy-list"></div>
		<div class="row cl">
			<input type="hidden" name="privilegePolicy" value="${incubationPark.privilegePolicy}" />
			<span class="form-label col-2"><span class="c-red">*</span>优惠政策：</span>
				<div class="formControls col-10" id="head-input">
					<input class="input-text" style="width:250px;" id="goodPolicy" type="text" onblur="lostfocus('head-rank');"
						placeholder="请输优惠政策"> <span id="goodPolicy-bottom" class="bottom-company">确认</span>
				</div>
		</div>
		
		<div class="form-label col-5 companyName" id="keySearch-list"></div>
		<div class="row cl">
			<input type="hidden" name="keySearch" />
			<span class="form-label col-2"><span class="c-red">*</span>关键字：</span>
				<div class="formControls col-10" id="head-input">
					<input class="input-text" style="width:250px;" id="keySearch" type="text" onblur="lostfocus('head-rank');"
						placeholder="请输入关键字"> <span id="keySearch-bottom" class="bottom-company">确认</span>
				</div>
		</div>
		
		
		<div class="row cl">
			<span class="form-label col-2"><span class="c-red">*</span>孵化园简介：</span>
			<div class="formControls col-10">
				<textarea name="softParkIntroduce" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="textarealength(this,200)">${incubationPark.softParkIntroduce}</textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
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
<script type="text/javascript" src="${contextPath}/js/approve.js"></script> 
<script type="text/javascript">
var ipnameold = "${incubationPark.softName}";
var ipaddressold = "${incubationPark.softParkAddress}";
/*验证表单信息*/
function check(){
	if($("input[name='softName']").val() == null || $("input[name='softName']").val() == ""){
		layer.msg('请输入孵化园名称!',{icon:2,time:2000});
		return false;
	}else if($("input[name='softParkAddress']").val() == null || $("input[name='softParkAddress']").val() == ""){
		layer.msg('请输入孵化园地址!',{icon:2,time:2000});
		return false;
	}else if($("input[name='softParkCharacter']").val() == null ||$("input[name='softParkCharacter']").val() == ""){
		layer.msg('请输入园区性质!',{icon:2,time:2000});
		return false;
	}else if($("input[name='companyName']").val() == null ||$("input[name='companyName']").val() == ""){
		layer.msg('请输入入驻公司!',{icon:2,time:2000});
		return false;
	}else if($("input[name='projectRequire']").val() == null ||$("input[name='projectRequire']").val() == ""){
		layer.msg('请输入入驻公司要求!',{icon:2,time:2000});
		return false;
	}else if($("input[name='privilegePolicy']").val() == null ||$("input[name='privilegePolicy']").val() == ""){
		layer.msg('请输入优惠政策!',{icon:2,time:2000});
		return false;
	}else if($("input[name='totalCount']").val() == "" || isNaN($("input[name='totalCount']").val())){
		layer.msg('工位总量必须为数字类型!',{icon:2,time:2000});
		return false;
	}else if($("input[name='stationPrice']").val() == "" || isNaN($("input[name='stationPrice']").val())){
		layer.msg('工位单价必须为数字类型!',{icon:2,time:2000});
		return false;
	}else if($("input[name='industryList']:checked").length < 1){
		layer.msg('请选择所属行业!',{icon:2,time:2000});
		return false;
	}else if($("input[name='serviceList']:checked").length < 1){
		layer.msg('请选择提供服务!',{icon:2,time:2000});
		return false;
	}else if($("textarea[name='softParkIntroduce']").val() == null || $("textarea[name='softParkIntroduce']").val() == ""){
		layer.msg('请输入孵化园简介!',{icon:2,time:2000});
		return false;
	}
	return true;
}

function addList(){
	var companyName="";//入驻公司
	var projectRequire="";//入驻公司要求
	var privilegePolicy="";//优惠政策
	var keySearch="";//关键字
	var divList=$("#head-list div");
	for(var i=0;i<divList.length;i++){
		var name=divList[i].getElementsByTagName("p")[0].innerHTML+",";
		companyName +=name;
	}
	$("input[name='companyName']").val(companyName.substring(0,companyName.lastIndexOf(',')));
	
	var divList=$("#companyRequest-list div");
	for(var i=0;i<divList.length;i++){
		var name=(i+1)+"."+divList[i].getElementsByTagName("p")[0].innerHTML+",";
		projectRequire +=name;
	}
	$("input[name='projectRequire']").val(projectRequire.substring(0,projectRequire.lastIndexOf(',')));
	
	var divList=$("#goodPolicy-list div");
	for(var i=0;i<divList.length;i++){
		var name=(i+1)+"."+divList[i].getElementsByTagName("p")[0].innerHTML+",";
		privilegePolicy +=name;
	}
	$("input[name='privilegePolicy']").val(privilegePolicy.substring(0,privilegePolicy.lastIndexOf(',')));

	var divList=$("#keySearch-list div");
	for(var i=0;i<divList.length;i++){
		var name=divList[i].getElementsByTagName("p")[0].innerHTML+",";
		keySearch +=name;
	}
	$("input[name='keySearch']").val(keySearch.substring(0,keySearch.lastIndexOf(',')));
	
}

function submit(){
	
	addList();
	
	//添加判断
	if(!check()){
		return false;
	}
	layer.confirm("确认修改?",function(){
		var url = "incubationpark-update-process";//$("#incubationpark-add").attr("action");
		var method = $("#form-article-add").attr("method");
		var data = $("#form-article-add").serialize();
		//alert(data);
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
	});
	
}
/*跳转*/
function gotoResult(){
	location.href="incubationpark-list?pageIndex=1";
}

function layer_close(){
	location.href="incubationpark-list?pageIndex=1";
}
$(function(){

	addHead('head-rank','head-bottom','head-list');
	addHead('companyRequest','companyRequest-bottom','companyRequest-list');
	addHead('goodPolicy','goodPolicy-bottom','goodPolicy-list');
	addHead('keySearch','keySearch-bottom','keySearch-list');
	
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
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
	//回显服务checkbox
	var service = $(":checkbox");
	var serviceFromPark = $(".hidden_service");
	for(var i=0;i < serviceFromPark.length; i++){
		for(var j = 0; j < service.length; j++){
			if($(serviceFromPark[i]).attr("value") == $(service[j]).attr("value")){
				$(service[j]).attr("checked","checked");
			}
		}
	}
	
	//回显入驻公司
	var companyName="${incubationPark.companyName}".split(",");
	var head_list=document.getElementById("head-list");
	if("${incubationPark.companyName}"!=""){
	    for(var i=0;i<companyName.length;i++){
	    	var div=document.createElement('div');
	        var p = document.createElement('p');
	        var label=document.createElement('label');
	        label.innerHTML="&#10005";
	        p.innerHTML = companyName[i];
	        head_list.appendChild(div);
	        div.appendChild(p);
	        div.appendChild(label);
	    }
		removeHead("head-list");
	}
	
	//回显入驻公司要求
	var projectRequire="${incubationPark.projectRequire}".split(",");
	var companyRequest_list=document.getElementById("companyRequest-list");
	if("${incubationPark.projectRequire}"!=""){
	    for(var i=0;i<projectRequire.length;i++){
	    	var div=document.createElement('div');
	        var p = document.createElement('p');
	        var label=document.createElement('label');
	        label.innerHTML="&#10005";
	        p.innerHTML = projectRequire[i].substring(projectRequire[i].indexOf(".")+1);
	        companyRequest_list.appendChild(div);
	        div.appendChild(p);
	        div.appendChild(label);
	    }
		removeHead("companyRequest-list");
	}

	//回显优惠政策
	var privilegePolicy="${incubationPark.privilegePolicy}".split(",");
	var goodPolicy_list=document.getElementById("goodPolicy-list");
	if("${incubationPark.privilegePolicy}"!=""){
	    for(var i=0;i<privilegePolicy.length;i++){
	    	var div=document.createElement('div');
	        var p = document.createElement('p');
	        var label=document.createElement('label');
	        label.innerHTML="&#10005";
	        p.innerHTML = privilegePolicy[i].substring(privilegePolicy[i].indexOf(".")+1);
	        goodPolicy_list.appendChild(div);
	        div.appendChild(p);
	        div.appendChild(label);
	    }
		removeHead("goodPolicy-list");
	}
	
	//回显关键字
	var keySearch="${incubationPark.keySearch}".split(",");
	var keySearch_list=document.getElementById("keySearch-list");
	if("${incubationPark.keySearch}"!=""){
	    for(var i=0;i<keySearch.length;i++){
	    	var div=document.createElement('div');
	        var p = document.createElement('p');
	        var label=document.createElement('label');
	        label.innerHTML="&#10005";
	        p.innerHTML = keySearch[i];
	        keySearch_list.appendChild(div);
	        div.appendChild(p);
	        div.appendChild(label);
	    }
		removeHead("keySearch-list");
	}
});


//动态生成入驻行业——关键字
function industryCheck(t){
	$("#keySearch-list").find("div").each(function (i){
		if($(t).val()==$(this).find("p").text()){
			$(this).remove();
		}
	});
	if($(t).is(':checked')){
		var div=document.createElement('div');
      	var p = document.createElement('p');
      	var label=document.createElement('label');
      	label.innerHTML="&#10005";
      	p.innerHTML = $(t).val();
      	document.getElementById("keySearch-list").appendChild(div);
      	div.appendChild(p);
      	div.appendChild(label);
	}else{
		$("#keySearch-list").find("div").each(function (i){
			if($(t).val()==$(this).find("p").text()){
				$(this).remove();
			}
		});
	}
	removeHead("keySearch-list");
}

//动态生成提供服务——关键字
function serviceCheck(t){
	$("#keySearch-list").find("div").each(function (i){
		if($(t).val()==$(this).find("p").text()){
			$(this).remove();
		}
	});
	if($(t).is(':checked')){
		var div=document.createElement('div');
      	var p = document.createElement('p');
     	var label=document.createElement('label');
      	label.innerHTML="&#10005";
      	p.innerHTML = $(t).val();
      	document.getElementById("keySearch-list").appendChild(div);
      	div.appendChild(p);
      	div.appendChild(label);
	}else{
		$("#keySearch-list").find("div").each(function (i){
			if($(t).val()==$(this).find("p").text()){
				$(this).remove();
			}
		});
	}
	removeHead("keySearch-list");
}

//获取孵化园名称
function ipnameCheck(t){
	var ipname=$(t).val();
	$("#keySearch-list").find("div").each(function (i){
		if(ipnameold==$(this).find("p").text()){
			$(this).remove();
		}
	});
  	ipnameold = ipname;
	if(ipname!=""&&ipname!=ipaddressold){
		var div=document.createElement('div');
      	var p = document.createElement('p');
      	var label=document.createElement('label');
      	label.innerHTML="&#10005";
      	p.innerHTML = ipname;
      	document.getElementById("keySearch-list").appendChild(div);
      	div.appendChild(p);
      	div.appendChild(label);
	}
	removeHead("keySearch-list");
}

//获取孵化园地址
function ipaddressCheck(t){
	var ipaddress=$(t).val();
	$("#keySearch-list").find("div").each(function (i){
		if(ipaddressold==$(this).find("p").text()){
			$(this).remove();
		}
	});
  	ipaddressold = ipaddress;
	if(ipaddress!=""&&ipaddress!=ipnameold){
		var div=document.createElement('div');
      	var p = document.createElement('p');
      	var label=document.createElement('label');
      	label.innerHTML="&#10005";
      	p.innerHTML = ipaddress;
      	document.getElementById("keySearch-list").appendChild(div);
      	div.appendChild(p);
      	div.appendChild(label);
	}
	removeHead("keySearch-list");
}
</script>
</body>
</html>