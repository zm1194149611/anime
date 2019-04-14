<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>回复</title>
    <link href="${contextPath}/css/question1.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/js/question.js" type="text/javascript"></script>
    <script src="${contextPath}/js/scroll/TouchLine.js"></script>
    <script src="${contextPath}/js/jquery-2.1.4.min.js"></script>
    <script src="${contextPath}/js/box.js"></script>
</head>
<body>
    <section>
        <div class="question">
            <textarea id="syeQuestionContentTemp" name="replyContent"></textarea>
            <span>还可以输入<label>200</label>字</span>
            <input type="hidden" value="${questionId}" name="questionId">
            <input type="hidden" value="${replyUserId}" name="replyUserId">
        </div>
        <div class="submit" onclick="addOrUpdate()">
            <span>提交</span>
        </div>
        <div class="fill"></div>
    </section>
	<script type="text/javascript">
		var contextPath="${contextPath}";
		//发布互动
		function addOrUpdate(){
			var questionId = $("input[name='questionId']").val();//问题ID
			var activityId = $("input[name='activityId']").val();//活动ID
			var replyUserId = $("input[name='replyUserId']").val();//回复用户ID
			var replyContent = $("#syeQuestionContentTemp").val();//回复内容
			if(replyContent==""){
				Box.autoClose('请填写回复内容');
				return;
			}
			Box.noAutoClose('正在提交，请稍候');
			$.ajax({
				url:"addQuestionReply",
				type:'post',
				data:{
					"activityId":activityId,
					"questionId":questionId,
					"replyUserId":replyUserId,
					"replyContent":replyContent,
					"url":"${url}"
				},
				dataType:'json',
				success:function(data, status){
					Box.close();
					if(data.exceptionMsg){
						Box.autoClose(data.exceptionMsg);
					}else{
						Box.autoClose('回复成功');
						//Box.alert('回复成功，点击确定返回',function(){
							window.location.href="${contextPath}/${url}";
						//});
						/* if(activityId==""){
							Box.alert('回复成功，点击确定返回俱乐部',function(){
								window.location.href="${contextPath}/communication/interaction";
							});
						}else{
							Box.alert('回复成功，点击确定返回活动详情',function(){
								window.location.href="${contextPath}/activity/activityDetails?activityId="+activityId;
							});
						}  */
				 	}
				},
				error:function(result){
					Box.close();
                    Box.autoClose('提交失败，请检查网络');
				}
			});
		}
	</script>
</body>
</html>
