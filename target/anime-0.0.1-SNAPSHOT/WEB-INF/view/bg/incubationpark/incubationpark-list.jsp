<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="${contextPath}/bg/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/bg/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/bg/css/style.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/bg/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<title>孵化园列表</title>
</head>
<body>
<nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe67f;</i> 首页 
	<span class="c-gray en">&gt;</span> 孵化园管理 
	<span class="c-gray en">&gt;</span> 孵化园列表 
</nav>
<div class="pd-20">
<div class="text-c"> 
	<form action="searchList" method="post">
		<input type="text" name="key" id="" placeholder=" 输入孵化园名称" style="width:250px" class="input-text">
		<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜孵化园</button>
	</form>
	</div>
	<br/>
	<div class="text-c"> 
	<form action="searchListAddress" method="post">
		<input type="text" name="key" id="" placeholder=" 输入所属地区" style="width:250px" class="input-text">
		<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜孵化园</button>
	</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="deleteList()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" onclick="picture_add('添加孵化园','incubationpark-addUI')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加孵化园</a></span> <span class="r">共有数据：<strong>${page.totalNumber}</strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover">
			<thead>
				<tr class="text-c">
					<th width="40"><input name="" type="checkbox" value="-1"></th>
					<th width="80">编号</th>
					<th width="100">名称</th>
					<th width="100">行业</th>
					<th width="80">分享数</th>
					<th width="80">点赞数</th>
					<th width="80">浏览量</th>
					<th>预览图片</th>		
					<th width="150">所属地区</th>
					<th width="150">园区服务</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="incubationpark" items="${incubationParkList}" varStatus="status">
				<tr class="text-c">
					<td><input name="" type="checkbox" value="${incubationpark.softParkId}"></td>
					<td>${status.index+1}</td>
					<td>${incubationpark.softName}</td>
					<td>
						<c:forEach var="industry" items="${incubationpark.listIndustryLabel}" varStatus="statusIndustry">
							${industry.industryLabelName}
							<c:if test="${!statusIndustry.last}">,</c:if>
						</c:forEach>
					</td>
					<td>${incubationpark.totalShareCount}</td>
					<td>${incubationpark.totalVoteUpCount}</td>
					<td class="text-c">${incubationpark.browseCount}</td>
					<td><a href="javascript:;" onClick="picture_edit('图库编辑','editImage?incubationParkId=${incubationpark.softParkId}','10001')"><img width="100" class="picture-thumb" src="<%=basePath %>pics/incubationpark/${incubationpark.softParkImgUrl}"></a></td>					
					<td>${incubationpark.softParkAddress}</td>
					<td class="td-status">
					<c:forEach var="serviceLabel" items="${incubationpark.listServiceLabel}">
						<p class="label-success radius" style="width:70%;margin:0 auto;color:#fff;margin-bottom:5px;">${serviceLabel.serviceLabelName}</p>
					</c:forEach>
					</td>
					<td class="td-manage"> 
						<a style="text-decoration:none" class="ml-5"  href="incubationpark-update-detail?incubationParkId=${incubationpark.softParkId }" title="修改">
						<span class="label label-success radius" id="b">修改</span></a> 
						<a style="text-decoration:none" class="ml-5" onclick="deletePark(this,'${incubationpark.softParkId}');" href="javascript:;" title="删除">
						<span class="label label-primary radius" id="b">删除</span></a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>

</div>
<!--start- 分页 -->
<jsp:include page="page.jsp"></jsp:include>
<!--end- 分页  -->

<script type="text/javascript" src="${contextPath}/bg/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/lib/layer/1.9.3/layer.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/js/H-ui.js"></script> 
<script type="text/javascript" src="${contextPath}/bg/js/H-ui.admin.js"></script> 
<script type="text/javascript">

/*图片-编辑*/
function picture_edit(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*图片-添加*/
function picture_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*删除孵化园*/
function deletePark(obj,parkId){
	var parkIdInt = parseInt(parkId);
	layer.confirm('确认要删除吗？该操作不可恢复',function(parkId){
		$.ajax({
		url:"incubationpark-delete",
		type:"Post",
		data:{"incubationParkId":parkIdInt},
		success:function(result){
			$(obj).parents("tr").remove();
			layer.msg('已删除!',{icon:1,time:1000});
		}
	}); 
		
	});
}

/*批量删除*/
 function deleteList(){
	var idList = $("input[type='checkbox']:checked");
	var ids = "";
	var ind = 1;
	for(var i=0;i < idList.length; i++){
		if($(idList[i]).attr("value") != -1){
			if(ind == 1){
				ids = ids + $(idList[i]).attr("value");
				ind++;
			}else{
				ids = ids + "," + $(idList[i]).attr("value");
			}
		}
	}
	if(ids == ""){
		layer.msg('没有选择任何数据!',{icon:2,time:1000});
		return  false;
	}
	//alert(ids);
	layer.confirm("确定要删除吗?该操作不可恢复!",function(){
		$.ajax({
			url:"deletelist",
			type:"post",
			data:{"ids":ids},
			dataType:"json",
			success:function(resultData){
				//alert(resultData.result);
				if(resultData.exceptionCode == -1001){
					layer.msg(resultData.exceptionMsg,{icon:2,time:1000});
				}else{
					for(var i=0;i < idList.length; i++){
						if($(idList[i]).attr("value") != -1){
							$(idList[i]).parent("td").parent("tr").remove();
						}
					}
					
					layer.msg('已删除!',{icon:1,time:1000});
				}
			}
		});
	});
	
}

</script>
</body>
</html>