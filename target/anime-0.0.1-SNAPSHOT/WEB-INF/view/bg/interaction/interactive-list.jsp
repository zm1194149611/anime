<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=request.getContextPath()%>/"/>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="bg/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="bg/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="bg/css/style.css" rel="stylesheet" type="text/css" />
<link href="bg/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<title>互动列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 互动管理 <span class="c-gray en">&gt;</span> 互动列表
	<select class="foo" onchange="goToChooce(this.value)">
		<option <c:if test="${qState==3 }">selected="selected"</c:if> value="3" >全部</option>
		<option <c:if test="${qState==2 }">selected="selected"</c:if> value="2">未审核</option>
		<option <c:if test="${qState==1 }">selected="selected"</c:if> value="1">已通过</option>
		<option <c:if test="${qState==0 }">selected="selected"</c:if> value="0">未通过</option>
	</select>
 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>

<!--搜索 -->
<div class="cl pd-5 bg-1 bk-gray mt-20" style="padding:5px 20px 5px 20px;text-align:center;"> 
	 <div> 
		<input type="text" name="keySearch" id="keySearch" placeholder="请输入问题或评论的关键字" style="width:250px" class="input-text">
		<button class="btn btn-success" onclick="goSearch(${qState});"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	</div>
</div>

	 <div class="mt-20">
	 <c:forEach items="${questionList.list }" varStatus="s" var="question">
	 	<div style="padding:10px;margin-bottom:15px">
	 		<div class="interactive_all">
		 		<p class="interactive_reply">
		 			<label class="interactive_pro" >问题:</label>
		 			<input type="hidden" value="${question.questionState }" class="questionState">
		 			<span>
			 			<a style="text-decoration:none;" onClick="article_shenhe(this,${question.questionId})" href="javascript:;" title="审核">
			 				<span class="label label-primary radius" id="b">审核</span>&nbsp;
			 			</a>
			 			
		 			</span>
		 			<a style="text-decoration:none;" onClick="topmost(this,${question.questionId})" href="javascript:;" title="审核">
		 				
		 				<c:if test="${question.standbyOne==0||question.standbyOne==null}">
		 				<span class="label label-primary radius">置顶</span>
		 				</c:if>
		 				<c:if test="${question.standbyOne==1}">
		 				<span class="label label-success radius">取消置顶</span></c:if>
		 				
		 			</a>
		 		</p>
		 		<p class="interactive_con interactive_bg interactive_p">
		 			${question.questionContent }
		 			<%-- <c:if test="${question.questionState!=null}"> --%>
		 			<span style="margin-right:-10px;">
 						<a style="text-decoration:none" class="ml-5" onClick="question_del(this,${question.questionId})" href="javascript:;" title="删除">
							<i class="Hui-iconfont">&#xe6e2;</i>
						</a>
					</span>
					<%-- </c:if> --%>
		 		</p>
		 		<c:if test="${question.imgOne!=null&&question.imgOne!='' }">
		 			<div class="interactiveImg" >
		 			<img src="${question.imgOne }">
		 			</div>
		 		</c:if>
		 		<c:if test="${question.imgTwo!=null&&question.imgTwo!='' }">
		 			<div class="interactiveImg" >
		 			<img src="${question.imgTwo }">
		 			</div>
		 		</c:if>
		 		<c:if test="${question.imgThree!=null&&question.imgThree!='' }">
		 			<div class="interactiveImg" >
		 			<img src="${question.imgThree }">
		 			</div>
		 		</c:if>
		 		<c:if test="${question.imgFour!=null&&question.imgFour!='' }">
		 			<div class="interactiveImg" >
		 			<img src="${question.imgFour }">
		 			</div>
		 		</c:if>
		 		<div class="interactive_addTag">
		 		<span class="interactive_tag">
		 		添加标签：<input maxlength="2">&nbsp;
		 		<button onclick="addLabel(this,${question.questionId})">确定</button>
		 		</span>
		 		<span onclick="deleteLabel(this,${question.questionId})" class="label label-success radius interactiveTagShow">${question.standbyTwo }</span>
		 		</div>
		 		<div style="clear:both"></div>
	 		</div>
	 		<div class="interactive_all">
	 			<c:if test="${s.count==1 }">
				<c:forEach items="${reply1}" var="reply" varStatus="s1">
	 			<p class="interactive_reply">
		 			<label class="interactive_rp">回复:</label>
				</p>
	 			<table>
	 				<tr style="width:97%">
	 					<td class="interactive_con interactive_bg interactive_p" style="width:98%">
	 						${reply.syeReplyContent }
	 						<div style="text-align:right">
		 						<a style="text-decoration:none" class="ml-5" onClick="article_del(this,${reply.syeReplyId})" href="javascript:;" title="删除">
									<i class="Hui-iconfont">&#xe6e2;</i>
								</a>
							</div>
	 					</td>
	 				</tr>
	 			</table>
	 			</c:forEach>
	 			</c:if>
	 			<c:if test="${s.count==2 }">
				<c:forEach items="${reply2}" var="reply" varStatus="s1">
				<p class="interactive_reply">
		 			<label class="interactive_rp">回复:</label>
				</p>
	 			<table>
	 				<tr style="width:97%">
	 					<td class="interactive_con interactive_bg interactive_p" style="width:98%">
	 						${reply.syeReplyContent }
	 						<div style="text-align:right">
		 						<a style="text-decoration:none" class="ml-5" onClick="article_del(this,${reply.syeReplyId})" href="javascript:;" title="删除">
									<i class="Hui-iconfont">&#xe6e2;</i>
								</a>
							</div>
	 					</td>
	 				</tr>
	 			</table>
	 			</c:forEach>
	 			</c:if>
	 			<c:if test="${s.count==3 }">
				<c:forEach items="${reply3}" var="reply" varStatus="s1">
				<p class="interactive_reply">
		 			<label class="interactive_rp">回复:</label>
				</p>
	 			<table>
	 				<tr style="width:97%">
	 					<td class="interactive_con interactive_bg interactive_p" style="width:98%">
	 						${reply.syeReplyContent }
	 						<div style="text-align:right">
		 						<a style="text-decoration:none" class="ml-5" onClick="article_del(this,${reply.syeReplyId})" href="javascript:;" title="删除">
									<i class="Hui-iconfont">&#xe6e2;</i>
								</a>
							</div>
	 					</td>
	 				</tr>
	 			</table>
	 			</c:forEach>
	 			</c:if>
	 			<c:if test="${s.count==4 }">
				<c:forEach items="${reply4}" var="reply" varStatus="s1">
				<p class="interactive_reply">
		 			<label class="interactive_rp">回复:</label>
				</p>
	 			<table>
	 				<tr style="width:97%">
	 					<td class="interactive_con interactive_bg interactive_p" style="width:98%">
	 						${reply.syeReplyContent }
	 						<div style="text-align:right">
		 						<a style="text-decoration:none" class="ml-5" onClick="article_del(this,${reply.syeReplyId})" href="javascript:;" title="删除">
									<i class="Hui-iconfont">&#xe6e2;</i>
								</a>
							</div>
	 					</td>
	 				</tr>
	 			</table>
	 			</c:forEach>
	 			</c:if>
	 			<c:if test="${s.count==5 }">
				<c:forEach items="${reply5}" var="reply" varStatus="s1">
				<p class="interactive_reply">
		 			<label class="interactive_rp">回复:</label>
				</p>
	 			<table>
	 				<tr style="width:97%">
	 					<td class="interactive_con interactive_bg interactive_p" style="width:98%">
	 						${reply.syeReplyContent }
	 						<div style="text-align:right">
		 						<a style="text-decoration:none" class="ml-5" onClick="article_del(this,${reply.syeReplyId})" href="javascript:;" title="删除">
									<i class="Hui-iconfont">&#xe6e2;</i>
								</a>
							</div>
	 					</td>
	 				</tr>
	 			</table>
	 			</c:forEach>
	 			</c:if>
	 			<c:if test="${s.count==6 }">
				<c:forEach items="${reply6}" var="reply" varStatus="s1">
				<p class="interactive_reply">
		 			<label class="interactive_rp">回复:</label>
				</p>
	 			<table>
	 				<tr style="width:97%">
	 					<td class="interactive_con interactive_bg interactive_p" style="width:98%">
	 						${reply.syeReplyContent }
	 						<div style="text-align:right">
		 						<a style="text-decoration:none" class="ml-5" onClick="article_del(this,${reply.syeReplyId})" href="javascript:;" title="删除">
									<i class="Hui-iconfont">&#xe6e2;</i>
								</a>
							</div>
	 					</td>
	 				</tr>
	 			</table>
	 			</c:forEach>
	 			</c:if>
	 			<c:if test="${s.count==7 }">
				<c:forEach items="${reply7}" var="reply" varStatus="s1">
				<p class="interactive_reply">
		 			<label class="interactive_rp">回复:</label>
				</p>
	 			<table>
	 				<tr style="width:97%">
	 					<td class="interactive_con interactive_bg interactive_p" style="width:98%">
	 						${reply.syeReplyContent }
	 						<div style="text-align:right">
		 						<a style="text-decoration:none" class="ml-5" onClick="article_del(this,${reply.syeReplyId})" href="javascript:;" title="删除">
									<i class="Hui-iconfont">&#xe6e2;</i>
								</a>
							</div>
	 					</td>
	 				</tr>
	 			</table>
	 			</c:forEach>
	 			</c:if>
	 			<c:if test="${s.count==8 }">
				<c:forEach items="${reply8}" var="reply" varStatus="s1">
				<p class="interactive_reply">
		 			<label class="interactive_rp">回复:</label>
				</p>
	 			<table>
	 				<tr style="width:97%">
	 					<td class="interactive_con interactive_bg interactive_p" style="width:98%">
	 						${reply.syeReplyContent }
	 						<div style="text-align:right">
		 						<a style="text-decoration:none" class="ml-5" onClick="article_del(this,${reply.syeReplyId})" href="javascript:;" title="删除">
									<i class="Hui-iconfont">&#xe6e2;</i>
								</a>
							</div>
	 					</td>
	 				</tr>
	 			</table>
	 			</c:forEach>
	 			</c:if>
	 			<c:if test="${s.count==9 }">
				<c:forEach items="${reply9}" var="reply" varStatus="s1">
				<p class="interactive_reply">
		 			<label class="interactive_rp">回复:</label>
				</p>
	 			<table>
	 				<tr style="width:97%">
	 					<td class="interactive_con interactive_bg interactive_p" style="width:98%">
	 						${reply.syeReplyContent }
	 						<div style="text-align:right">
		 						<a style="text-decoration:none" class="ml-5" onClick="article_del(this,${reply.syeReplyId})" href="javascript:;" title="删除">
									<i class="Hui-iconfont">&#xe6e2;</i>
								</a>
							</div>
	 					</td>
	 				</tr>
	 			</table>
	 			</c:forEach>
	 			</c:if>
	 			<c:if test="${s.count==10 }">
				<c:forEach items="${reply10}" var="reply" varStatus="s1">
				<p class="interactive_reply">
		 			<label class="interactive_rp">回复:</label>
				</p>
	 			<table>
	 				<tr style="width:97%">
	 					<td class="interactive_con interactive_bg interactive_p" style="width:98%">
	 						${reply.syeReplyContent }
	 						<div style="text-align:right">
		 						<a style="text-decoration:none" class="ml-5" onClick="article_del(this,${reply.syeReplyId})" href="javascript:;" title="删除">
									<i class="Hui-iconfont">&#xe6e2;</i>
								</a>
							</div>
	 					</td>
	 				</tr>
	 			</table>
	 			</c:forEach>
	 			</c:if>
	 		</div>

	 		
	 	</div>
		</c:forEach>
		<!-- 分页实现 -->
		
		<div style="margin:0 0 10px 20px;"><span class="foo">共${questionList.pageCount}页 ${questionList.pageIndex+1}/${questionList.pageCount}页</span>
			<c:if test="${questionList.pageIndex>0 }">
				<a href="bg/interaction/questionlist?start=0&pageSize=${questionList.pageSize }&state=${qState}&key=${key}" class="foo">首页</a>
				<a href="bg/interaction/questionlist?start=${questionList.pageIndex-1 }&pageSize=${questionList.pageSize }&state=${qState}&key=${key}" class="foo">上一页</a>
			</c:if>
			<c:if test="${questionList.pageIndex+1<questionList.pageCount }">				
				<a href="bg/interaction/questionlist?start=${questionList.pageIndex+1 }&pageSize=${questionList.pageSize }&state=${qState}&key=${key}" class="foo">下一页</a>
				<a href="bg/interaction/questionlist?start=${questionList.pageCount-1 }&pageSize=${questionList.pageSize }&state=${qState}&key=${key}" class="foo">尾页</a>
			</c:if>
			
			<span class="foo">第
			<select onchange="goToPage(this.value)">
				<c:forEach begin="1" end="${questionList.pageCount}" varStatus="i">
					<option <c:if test="${questionList.pageIndex+1==i.count}">selected="selected"</c:if> value="${i.count-1}">${i.count}</option>
				</c:forEach>
			</select>页</span>
		</div>
		<!-- <span style="margin-left: 20px;">共&nbsp;${questionList.totalSize}&nbsp;条数据&nbsp;&nbsp;&nbsp;${questionList.pageIndex+1 }/${questionList.pageCount }</span>
		&nbsp;&nbsp;&nbsp;
		<span style="margin-right: 20px;">
			<a href="bg/interaction/questionlist?start=${questionList.pageIndex-1 }&pageSize=2">上一页</a>
			&nbsp;&nbsp;&nbsp;
			<c:if test="${questionList.pageIndex+1>=questionList.pageCount }">
				<a href="bg/interaction/questionlist?start=${questionList.pageCount-1 }&pageSize=2">下一页</a>
			</c:if>
			<c:if test="${questionList.pageIndex+1<questionList.pageCount }">
				<a href="bg/interaction/questionlist?start=${questionList.pageIndex+1 }&pageSize=2">下一页</a>
			</c:if>
		</span> -->
	 	<div style="background-color:"></div>
		<!--<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="80">ID</th>
					<th>标题</th>
					<th width="80">分类</th>
					<th width="80">来源</th>
					<th width="120">更新时间</th>
					<th width="75">浏览次数</th>
					<th width="60">发布状态</th>
					<th width="120">操作</th>
				</tr>
			</thead>
			<tbody>
				<tr class="text-c">
					<td><input type="checkbox" value="" name=""></td>
					<td>10001</td>
					<td class="text-l"><u style="cursor:pointer" class="text-primary" onClick="article_edit('查看','article-zhang.html','10001')" title="查看">资讯标题</u></td>
					<td>行业动态</td>
					<td>H-ui</td>
					<td>2014-6-11 11:11:42</td>
					<td>21212</td>
					<td class="td-status"><span class="label label-success radius">已发布</span></td>
					<td class="f-14 td-manage"><a style="text-decoration:none" onClick="article_stop(this,'10001')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a> <a style="text-decoration:none" class="ml-5" onClick="article_edit('资讯编辑','article-add.html','10001')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="article_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
				</tr>
				<tr class="text-c">
					<td><input type="checkbox" value="" name=""></td>
					<td>10002</td>
					<td class="text-l"><u style="cursor:pointer" class="text-primary" onClick="article_edit('查看','article-zhang.html','10002')" title="查看">资讯标题</u></td>
					<td>行业动态</td>
					<td>H-ui</td>
					<td>2014-6-11 11:11:42</td>
					<td>21212</td>
					<td class="td-status"><span class="label label-success radius">草稿</span></td>
					<td class="f-14 td-manage"><a style="text-decoration:none" onClick="article_shenhe(this,'10001')" href="javascript:;" title="审核">审核</a> <a style="text-decoration:none" class="ml-5" onClick="article_edit('资讯编辑','article-add.html','10001')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="article_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
				</tr>
			</tbody>
		</table>-->
	</div> 
</div>
<script type="text/javascript" src="bg/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="bg/lib/layer/1.9.3/layer.js"></script> 
<script type="text/javascript" src="bg/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="bg/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="bg/js/H-ui.js"></script> 
<script type="text/javascript" src="bg/js/H-ui.admin.js"></script>
<script type="text/javascript">
$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,8]}// 制定列不参与排序
	]
});

window.onload=function(){
	if($(".interactive_con").text() == ""){
		$(".a").html('<td class="interactive_con interactive_bg interactive_p" style="width:98%">暂时没有评论 </td>');
	}
	$(".questionState").each(function(){
		if(this.value=="1"){
			$(this).next().html('<span class="label label-success radius">已通过</span>&nbsp;')
		}else if(this.value=="0"){
			$(this).next().html('<span class="label label-danger radius">未通过</span>&nbsp;')
		}
	});
}
/*根据问题或评论关键字进行查询*/
function goSearch(qstate){
	var key = $("#keySearch").val().trim();
	console.log("关键字的值："+key);
	location.href="${contextPath}/bg/interaction/questionlist?start=0&pageSize=10&key="+key;
}
/*动态选择分页页面 */
function goToPage(pageNo)
{
	//bg/interaction/questionlist?start=${questionList.pageIndex+1 }&pageSize=${questionList.pageSize }
	document.location.href="${contextPath}/bg/interaction/questionlist?start="+pageNo+"&pageSize=${questionList.pageSize }&state=${qState}&key=${key}";
}
/*筛选*/
function goToChooce(state){
	document.location.href="${contextPath}/bg/interaction/questionlist?start=0&pageSize=${questionList.pageSize }&state="+state;
}
/*置顶*/
function topmost(obj,id){
	var state = $(obj).children().html();
	if(state == "置顶"){
		layer.confirm('确定要置顶吗？',function(index){
			$.ajax({
					type:"POST",
					url:"${contextPath}/bg/interaction/modifylabel",
					data:{
						"questionId":id,
						"top":"1"
					},
					dataType:"text",
					cache:false,
					success:function(data){
						
					}
			});
			$(obj).html('<span class="label label-success radius">取消置顶</span>')
			layer.msg('已将该问题置顶!',{icon:6,time:1000});
		});
	}else if(state=="取消置顶"){
		layer.confirm('确定要取消置顶吗？',function(index){
			$.ajax({
					type:"POST",
					url:"${contextPath}/bg/interaction/modifylabel",
					data:{
						"questionId":id,
						"top":"0"
					},
					dataType:"text",
					cache:false,
					success:function(data){
						
					}
			});
			$(obj).html('<span class="label label-primary radius">置顶</span>')
			layer.msg('已将该问题取消置顶!',{icon:5,time:1000});
		});
	}
	
}
/*为问题添加展示标签*/
function addLabel(obj,id){
	var label = $(obj).prev().val().trim();
	if(label==null||label==""){
		layer.msg('请先输入标签！',{icon:2,time:1000});
		return;
	}
	console.log("标签的值为："+label);
	var oldLabel = $(obj).parent().next().html();
	var splitLabel = oldLabel.split(",");
	if(splitLabel.length>1){
		layer.msg('最多输入两个标签！',{icon:2,time:1000});
		return;
	}
	$.ajax({
			type:"GET",
			url:"${contextPath}/bg/interaction/modifylabel",
			data:{
				"questionId":id,
				"label":label
			},
			dataType:"json",
			success:function(data){
				layer.msg('标签添加成功！', {icon:6,time:1000});
				$(obj).prev().val("");
				$(obj).parent().next().html(data.result);
			}
	});
	
	
}
/*为问题删除标签*/
function deleteLabel(obj,id){
	$.ajax({
		type:"GET",
		url:"${contextPath}/bg/interaction/modifylabel",
		data:{
			"questionId":id,
			"label":"0"//标签为0时代表删除标签
		},
		dataType:"json",
		success:function(data){
			layer.msg('标签已删除！', {icon:6,time:1000});
			$(obj).html("");
		}
});
}
/*互动问题-审核*/
function article_shenhe(obj,id){
	layer.confirm('该互动问题是否通过？', {
		btn: ['通过','不通过','取消'], 
		shade: false,
		closeBtn:!1
	},
	function(){
		// $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$.ajax({
   				type:"GET",
   				url:"${contextPath}/bg/interaction/updateQuestionState",
   				data:{
   					"questionId":id,
   					"state":"1"
   				},
   				dataType:"text",
   				cache:false,
   				success:function(data){
   					
   				}
   			});
		$(obj).parent().html('<span class="label label-success radius">已通过</span>')
		// $(obj).remove();
		layer.msg('已通过', {icon:6,time:1000});
	},
	function(){
		// $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$.ajax({
   				type:"GET",
   				url:"${contextPath}/bg/interaction/updateQuestionState",
   				data:{
   					"questionId":id,
   					"state":"0"
   				},
   				dataType:"text",
   				cache:false,
   				success:function(data){
   					
   				}
   			});
		$(obj).parent().html('<span class="label label-danger radius">未通过</span>');
		//$(obj).remove();
    	layer.msg('未通过', {icon:5,time:1000});
	});	
}

/*互动提问-删除*/
function question_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
				type:"GET",
				url:"${contextPath}/bg/interaction/deleteQuestion",
				data:{
					"questionId":id
				},
				dataType:"text",
				cache:false,
				success:function(data){
					
				}
		});
		window.location.href="${contextPath}/bg/interaction/questionlist?start= ${questionList.pageIndex}&pageSize=0&state=${qState}";
		/* $(obj).parents("table").prev().remove();
		$(obj).parents("table").remove();	 */	
		layer.msg('已删除!',{icon:2,time:1000});
	});
}
/*互动回复-删除*/
function article_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
				type:"GET",
				url:"${contextPath}/bg/interaction/deleteReply",
				data:{
					"replyId":id,
				},
				dataType:"text",
				cache:false,
				success:function(data){
					
				}
		});
		$(obj).parents("table").prev().remove();
		$(obj).parents("table").remove();		
		layer.msg('已删除!',{icon:2,time:1000});
	});
}

/*互动-添加*/
function article_add(title,url,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*互动-编辑*/
function article_edit(title,url,id,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*互动-下架*/
function article_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
		$(obj).remove();
		layer.msg('已下架!',{icon: 5,time:1000});
	});
}

/*互动-发布*/
function article_start(obj,id){
	layer.confirm('确认要发布吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布!',{icon: 6,time:1000});
	});
}
/*互动-申请上线*/
function article_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
}

</script> 
</body>
</html>