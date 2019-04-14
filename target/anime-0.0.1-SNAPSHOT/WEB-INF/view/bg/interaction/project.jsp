<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		
		<title>项目审核</title>
	</head>
	
	<body>
		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页 
			<span class="c-gray en">&gt;</span> 审核管理
			<span class="c-gray en">&gt;</span> 项目审核
			<span class="pd-20"></span>
			认证状态：
			<select class="foo" name="auditstatus" onchange="goToAuditstatus(this.value)">
				<option <c:if test="${auditstatus==0}">selected="selected"</c:if> value="0">全部</option>
				<option <c:if test="${auditstatus==1}">selected="selected"</c:if>  value="1">未审核</option>
				<option <c:if test="${auditstatus==2}">selected="selected"</c:if>  value="2">已审核</option>
			</select>
			<span class="pd-20"></span>
			行业：
			<select class="foo" name="business" id="business"  onchange="goToBusiness(this.value)">
				<option <c:if test="${business==''}">selected="selected"</c:if> value="">全部</option>
				<c:forEach var="i" begin="1" end="9" step="1">
                    <option value="business${i}"><spring:message code="project.business.business${i}" /></option>
                </c:forEach>
			</select>
			<span class="pd-20"></span>
			区域：
			<select class="foo" name="zone" id="zone" onchange="goToZone(this.value)">
				<option <c:if test="${zone==''}">selected="selected"</c:if> value="">全部</option>
				<c:forEach var="i" begin="1" end="21" step="1"> 
					<option value="zone${i}"><spring:message code="project.zone.zone${i}" /></option>
		    	</c:forEach>
			</select>
			<span class="pd-20"></span>
			类型：
			<select class="foo" name="status" id="status" onchange="goToStatus(this.value)">
				<option <c:if test="${status==''}">selected="selected"</c:if> value="">全部</option>
				<c:forEach var="i" begin="1" end="3" step="1"> 
					<option value="status${i}"><spring:message code="project.status.status${i}" /></option>
		    	</c:forEach>
			</select>
		</nav>
		<div class="cl pd-5 bg-1 bk-gray mt-20" style="padding:5px 20px 5px 20px"> 
			 <div class="l"> 
				<input type="text" name="keySearch" id="keySearch" placeholder="请输入项目名称、负责人等" style="width:250px" class="input-text">
				<button class="btn btn-success" onclick="goSearch();"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
			</div>
			<div class="text-r"> 
				<a href="exportProject?start=${page.pageIndex}" class="btn btn-success" > 批量导出 </a>
			</div>
		</div>
		
		<div class="pd-20">	
			<div class="mt-20">
				<table class="table table-border table-bordered table-bg table-hover" id="projlist">
					<thead>			
						<tr class="text-c">
							<th width="120">项目LOGO</th>
							<th width="100">项目名称</th>
							<th width="70">负责人</th>
							<th width="70">负责电话</th>
							<!-- <th width="90">上传时间</th> -->
							<th width="70">区域</th>
							<th width="70">类型</th>
							<th width="70">行业</th>
							<th width="70">投票数</th>
							<th width="70">分享数</th>
							<th width="70">点赞数</th>
							<th width="70">状态</th>
							<th width="150">操作</th>
						</tr>
					</thead>
					<tbody>	
					<c:forEach items="${page.list}" var="project">
						<tr class="text-c">
							<td><img alt="" width="110px" height="50px;" src="${contextPath}/pics/${project.logo}" /></td>
							<td>${project.name}</td>				
							<td>${project.resPerson}</td>
							<td>${project.resPersonPhone}</td>
							<%-- <td><fmt:formatDate value="${project.addTime}" pattern="yyyy-MM-dd hh:mm:ss" type="date" /></td> --%>
							<td><spring:message code="project.zone.${project.zone}" /></td>
							<td><spring:message code="project.status.${project.status}" /></td>
							<td><spring:message code="project.business.${project.business}"/></td>
							<td>${project.visitCount}</td>
							<td>${project.shareCount}</td>
							<td>${project.likeCount}</td>
							<td class="td-status">
								<c:if test="${project.passed==false}">
									<span class="label label-success radius">未审核</span>
								</c:if>
								<c:if test="${project.passed==true}">
									<span class="label label-primary radius">已审核</span>
								</c:if>
							</td>
							<td class="f-14 td-manage" style="text-align:left;">
								<c:if test="${project.passed==false}">
								<a style="text-decoration:none" class="ml-5" 
									href="bgProDetail?projectId=${project.id}&start=${page.pageIndex}&type=0&auditstatus=${auditstatus}" title="审核">
								<span class="label label-primary radius" id="b">审核</span>
								</a>
								</c:if>
								<a style="text-decoration:none" class="ml-5" 
									href="bgProDetail?projectId=${project.id}&start=${page.pageIndex}&type=&auditstatus=${auditstatus}" title="修改">
								<span class="label label-success radius" id="b">修改</span>
								</a>
								<a style="text-decoration:none" class="ml-5" 
									href="javascript:del('${project.id}');" title="删除">
								<span class="label label-error radius" id="b">删除</span>
								</a> 
							</td>							
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			
			<!-- 分页start -->
			<div style="margin-top: 20px;"><span class="foo">共${page.pageCount}页 ${page.pageIndex+1}/${page.pageCount}页</span>
				<c:if test="${page.pageIndex>0 }">
					<a class="foo" href="bgpro?start=0&auditstatus=${auditstatus}&business=${business}&zone=${zone}&status=${status}&keySearch=${keySearch}">首页</a>
					<a class="foo" href="bgpro?start=${page.pageIndex-1}&auditstatus=${auditstatus}&business=${business}&zone=${zone}&status=${status}&keySearch=${keySearch}">上一页</a>
				</c:if>
				<c:if test="${page.pageIndex+1<page.pageCount }">				
					<a class="foo" href="bgpro?start=${page.pageIndex+1}&auditstatus=${auditstatus}&business=${business}&zone=${zone}&status=${status}&keySearch=${keySearch}">下一页</a>
					<a class="foo" href="bgpro?start=${page.pageCount-1}&auditstatus=${auditstatus}&business=${business}&zone=${zone}&status=${status}&keySearch=${keySearch}">尾页</a>
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
			$("#business").find("option[value='${business}']").attr("selected",true);
			$("#zone").find("option[value='${zone}']").attr("selected",true);
			$("#status").find("option[value='${status}']").attr("selected",true);
		});	
	
		//根据选择的页码 跳转页面
		function goToPage(pageNo){
			document.location.href="bgpro?start="+pageNo+"&auditstatus=${auditstatus}&business=${business}&zone=${zone}&status=${status}&keySearch=${keySearch}";
		}
		
		//条件查询
		function goSearch(){
			var keySearch = $("input[name='keySearch']").val();
			if(keySearch.trim()!=""){
				document.location.href="bgpro?keySearch="+keySearch;
			}
		}
		
		//按状态查询
		function goToAuditstatus(auditstatus){
			document.location.href="bgpro?auditstatus="+auditstatus+"&business=${business}&zone=${zone}&status=${status}";
		}

		//按行业查询
		function goToBusiness(business){
			document.location.href="bgpro?auditstatus=${auditstatus}&business="+business+"&zone=${zone}&status=${status}";
		}

		//按区域查询
		function goToZone(zone){
			document.location.href="bgpro?auditstatus=${auditstatus}&business=${business}&zone="+zone+"&status=${status}";
		}

		//按类型查询
		function goToStatus(status){
			document.location.href="bgpro?auditstatus=${auditstatus}&business=${business}&zone=${zone}&status="+status;
		}
		
		//删除项目
		function del(projectId){
			layer.confirm('确认要删除吗？该操作不可恢复',function(){
				location.href="delProject?projectId="+projectId+"&start=${page.pageIndex}&auditstatus=${auditstatus}";
			});
		}
	</script>
	
</html>	