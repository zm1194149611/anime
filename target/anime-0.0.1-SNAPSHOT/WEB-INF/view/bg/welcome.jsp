<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE HTML>
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
		
		<title>我的桌面</title>
	</head>
	
	<body>
		<div class="pd-20">
	  		<p class="text-r">当前登录IP：<span id="nowip"></span>&nbsp;&nbsp;&nbsp;&nbsp;
	  		当前时间：<span id="nowdate"></span></p>
	  		<div style="clear:both"></div>
	  
		  	<!-- 柱状图 -->
			<div style="height:25px;"></div>
			<div id="container" style="min-width:700px;height:400px"></div>
		  	<div style="height:40px;"></div> 
		
		  	<!-- 用户数据 -->
		  	<div class="welcome_userData">
			  	<p class="welcome_p">用户数据</p>
			  	<div class="mt-20 welcome_con">
				  	<table class="table table-border table-bordered table-bg">
				    	<thead>
				      		<tr class="text-c">
				        		<th width="10%">年</th>
				        		<th width="10%">月</th>
						        <th width="10%">用户注册数</th>
						        <th width="10%">SYE导师</th>
						        <th width="10%">SYE创业者</th>
						        <th width="10%">非SYE导师</th>
						        <th width="10%">非SYE创业者</th>
						        <th width="10%">待认证导师</th>
						        <th width="10%">待认证创业者</th>
						        <th width="10%">游客</th>
				      		</tr>
				    	</thead>
				    	<tbody>
				      		<c:forEach items="${userData}" var="user">
				      			<tr class="text-c">
							        <td>${user.year}</td>
							        <td>${user.month}</td>
							        <td>${user.userCount}</td>
							        <td>${user.syeTutorCount}</td>
							        <td>${user.syeFounderCount}</td>
							        <td>${user.tutorCount}</td>
							        <td>${user.founderCount}</td>
							        <td>${user.certifiedTutorCount}</td>
							        <td>${user.certifiedFounderCount}</td>
							        <td>${user.tourist}</td>
				      			</tr>
				      		</c:forEach>
				    	</tbody>
				  	</table>
				  	<div style="height:70px;border-bottom:1px solid #CDCD9A"></div>
				  	<div style="height:70px;"></div>
				  	
				
				  	<!-- 柱状图数据 -->
				  	<p class="welcome_p">柱状图数据</p>
				  	<table class="table table-border table-bordered table-bg">
				    	<thead>
					      	<tr class="text-c">
						        <th>年</th>
						        <th>月</th>
						        <th>用户注册数</th>
						        <th>项目上传数</th>
						        <th>孵化园入驻数</th>
				      		</tr>
				    	</thead>
				    	<tbody>
					    	<c:forEach items="${data}" var="d">
					      		<tr class="text-c">
							        <td>${d.year}</td>
							        <td>${d.month}</td>
							        <td>${d.userCount}</td>
							        <td>${d.projectCount}</td>
							        <td>${d.incubationParkCount}</td>
							    </tr>
					    	</c:forEach>
				    	</tbody>
				  	</table>
				</div>
			</div>
		</div>
	</body>
	
	<script type="text/javascript" src="${contextPath}/bg/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="${contextPath}/bg/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="${contextPath}/bg/js/H-ui.js"></script>
	<script type="text/javascript" src="${contextPath}/bg/lib/layer/1.9.3/layer.js"></script>
	<script type="text/javascript" src="${contextPath}/bg/js/H-ui.admin.js"></script>
	<script type="text/javascript" src="${contextPath}/bg/lib/Highcharts/4.1.7/js/highcharts.js"></script>
	<script type="text/javascript" src="${contextPath}/bg/lib/Highcharts/4.1.7/js/modules/exporting.js"></script>
	<script type="text/javascript" src="${contextPath}/bg/lib/Highcharts/4.1.7/js/highcharts-3d.js"></script>
	<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script> 
	<script type="text/<A class=infotextkey href="http://www.jb51.net/" target=_blank>javascript</A>"></script>
	<script>	
		//当前时间
		var t = null;
	    t = setTimeout(time,1000);//开始执行
	    function time(){
	       clearTimeout(t);//清除定时器
	       dt = new Date();
	       var date = new Date();
		   var seperator1 = "-";
		   var seperator2 = ":";
		   var month = date.getMonth() + 1;
		   var strDate = date.getDate();
		   if (month >= 1 && month <= 9) {
		       month = "0" + month;
		   }
		   if (strDate >= 0 && strDate <= 9) {
		       strDate = "0" + strDate;
		   }
		   var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
		           + " " + date.getHours() + seperator2 + date.getMinutes()
		           + seperator2 + date.getSeconds();
		    
		   $("#nowdate").html(currentdate);
	       t = setTimeout(time,1000); //设定定时器，循环执行             
	    } 
		
	    var userdata = new Array(12);
	    var projectdata = new Array(12);
	    var incubationParkdata = new Array(12);
	    
	    <c:forEach items="${data}" var="d" varStatus="status">
	    	userdata["${status.index}"]=${d.userCount}
	    	projectdata["${status.index}"]=${d.projectCount}
	    	incubationParkdata["${status.index}"]=${d.incubationParkCount}
	    </c:forEach>
	    
		// 柱状图
		$(function () {
			$("#nowip").html(returnCitySN["cip"]);
		    $('#container').highcharts({
		        chart: {
		            type: 'column'
		        },
		        title: {
		            text: '统计每月注册数，入驻数和上传数'
		        },
		        xAxis: {
		            categories: [
		                '一月',
		                '二月',
		                '三月',
		                '四月',
		                '五月',
		                '六月',
		                '七月',
		                '八月',
		                '九月',
		                '十月',
		                '十一月',
		                '十二月'
		            ]
		        },
		        yAxis: {
		            min: 0,
		        },
		        tooltip: {
		            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		                '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
		            footerFormat: '</table>',
		            shared: true,
		            useHTML: true
		        },
		        exporting : {
		        	enabled:false
		        },
		        credits : {
		        	enabled:false
		        },
		        plotOptions: {
		            column: {
		                pointPadding: 0.2,
		                borderWidth: 0
		            }
		        },
		        series: [{
		            name: '用户注册数',
		            data: userdata
		        },{
		            name: '项目上传数',
		            data: projectdata
		        },{
		            name: '孵化园入驻数',
		            data: incubationParkdata
		        }]
		    });
		});       
	</script>
</html>