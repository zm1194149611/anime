<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
		<link href="${contextPath}/bg/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
		
		<title>banner页面配置</title>
	</head>
	
	<body>
		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页
			<span class="c-gray en">&gt;</span> 配置管理
			<span class="c-gray en">&gt;</span> banner页面配置
		</nav>
		<div class="cl pd-5 bg-1 bk-gray mt-20"> 
			<div class="l" style="margin-left:20px;">
				<a class="btn btn-primary radius" onclick="picture_add('新增banner','banner-add?start=${page.pageIndex}')"><i class="Hui-iconfont">&#xe600;</i> 新增 banner</a>
			</div> 
			<div class="text-r" style="margin-top:4px;margin-right:20px;"> 
				<select class="foo" name="syeBannerLocal" onchange="goToChooce(this.value)" id="syeBannerLocal" style="width:150px;">
					<option value="">全部</option>
					<c:forEach var="i" begin="1" end="5" step="1"> 
						<option value="${i}"><spring:message code="banner.location.local${i}" /></option>
			    	</c:forEach>
				</select>
			</div>
		</div>
		
		<div class="pd-20">	
			<div class="mt-20">
				<table class="table table-border table-bordered table-bg table-hover">
					<thead>			
						<tr class="text-c">
							<!-- <th width="75">bannerID</th> -->
							<th width="75">banner位置</th>
							<th width="150">banner</th>
							<th width="100">banner时间</th>
							<th width="120">操作</th>
						</tr>
					</thead>
					<tbody>	
						<c:forEach items="${page.list}" var="banner">
						<tr class="text-c">
							<%-- <td>${banner.syeBannerId}</td> --%>
							<td><spring:message code="banner.location.local${banner.syeBannerLocal}" /></td>
							<td>
								<img alt="" class="picture-thumb" width="150px" height="100px" src="<%=basePath %>pics/${banner.syeBannerUrl}" />
							</td>
							<td><fmt:formatDate value="${banner.syeBannerTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date" /></td>
							<td>
								<a onClick="picture_edit('Banner图片编辑','banner-add?syeBannerId=${banner.syeBannerId}&start=${page.pageIndex}','10001')">
								<span class="label label-success radius" id="b">修改</span>
								</a>
								<a style="text-decoration:none" class="ml-5" 
									href="javascript:del(${banner.syeBannerId});" title="删除">
									<span class="label label-primary radius" id="b">删除</span>
								</a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<!-- 分页start -->
			<div style="margin-top: 20px;"><span class="foo">共${page.pageCount}页 ${page.pageIndex+1}/${page.pageCount}页</span>
				<c:if test="${page.pageIndex>0}">
					<a class="foo" href="banner?start=0&keySearch=${keySearch}">首页</a>
					<a class="foo" href="banner?start=${page.pageIndex-1}&keySearch=${keySearch}">上一页</a>
				</c:if>
				<c:if test="${page.pageIndex+1<page.pageCount}">				
					<a class="foo" href="banner?start=${page.pageIndex+1}&keySearch=${keySearch}">下一页</a>
					<a class="foo" href="banner?start=${page.pageCount-1}&keySearch=${keySearch}">尾页</a>
				</c:if>
				<span class="foo">第
				<select onchange="goToPage(this.value)">
					<c:forEach begin="1" end="${page.pageCount}" varStatus="i">
						<option <c:if test="${page.pageIndex+1==i.count}">selected="selected"</c:if> value="${i.count-1}">${i.count}</option>
					</c:forEach>
				</select>页</span>
			</div>
			<!-- 分页end-->
			
		</div>
	</body>
	
	<script type="text/javascript" src="${contextPath}/bg/lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/lib/layer/1.9.3/layer.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/lib/My97DatePicker/WdatePicker.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/js/H-ui.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/js/H-ui.admin.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#syeBannerLocal option[value='${syeBannerLocal}']").attr("selected","selected");
		});
		
		//按位置查询
		function goToChooce(syeBannerLocal){
			document.location.href="banner?syeBannerLocal="+syeBannerLocal;
		}
	
		//根据选择的页码 跳转页面
		function goToPage(pageNo){
			document.location.href="banner?start="+pageNo+"&syeBannerLocal=${syeBannerLocal}";
		}
		
		//图片-编辑
		function picture_edit(title,url,id){
			var index = layer.open({
				type: 2,
				title: title,
				content: url
			});
			layer.full(index);
		}
		
		//图片-添加
		function picture_add(title,url){
			var index = layer.open({
				type: 2,
				title: title,
				content: url
			});
			layer.full(index);
		}
		
		//删除
		function del(syeBannerId){
			layer.confirm('确认要删除吗？该操作不可恢复',function(){
				location.href="delBanner?syeBannerId="+syeBannerId+"&start=${page.pageIndex}";
			});
		}
	</script>
	
</html>