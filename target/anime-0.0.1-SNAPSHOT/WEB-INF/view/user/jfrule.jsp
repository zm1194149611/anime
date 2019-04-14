<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>积分详情</title>
    <link href="${contextPath}/css/jfrule.css" rel="stylesheet" type="text/css">
<%--     <link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css"> --%>
<%-- 	<script type="text/javascript" src="${contextPath}/js/footer.js"></script> --%>
	<script type="text/javascript" src="${contextPath}/js/jquery.js"></script>
	<script type="text/javascript">
// 	var contextPath = '${contextPath}';
	function consulting(){
		Box.alert("还在开发中……");
	}
// 	$(function(){
// 		footer.footerAddSubMenu();
// 	});
	</script>
</head>

<body>
<section>
    <div class="jfqestion">积分拥有者：</div>
    <div class="jfanswer">
        <p>积分与平台用户的个人账户一一对应，只有注册到SYE创业四川微信平台的用户，才有权获取和使用积分。</p>
    </div>
</section>
<section>
    <div class="jfqestion">积分等级说明：</div>
    <div class="jfanswer">
        <p>针对不同的积分值，设置不同的积分等级，详细的对应关系如下：</p>
        <ul>
            <li>LV1：<span>1~80</span></li>
            <li>LV2：<span>81~200</span></li>
            <li>LV3：<span>201~350</span></li>
            <li>LV4：<span>351~550</span></li>
            <li>LV5：<span>551~800</span></li>
            <li>LV6：<span>1200及以上</span></li>
        </ul>
    </div>
</section>
<section>
    <div class="jfqestion">积分获取途径：</div>
    <div class="jfanswer">
        <ol class="way">
            <li>登录：每日首次登录SYE创业四川微信平台+2分。</li>
            <li>互动评论：用户参与互动中心的评论，每评论一次+2分，每日最多10分。</li>
            <li>点赞：用户针对平台的互动内容、创业项目、创业导师等进行点赞或投票，每操作一次+1分，每日最多10分。</li>
            <li>分享：针对SYE创业四川微信平台中的创业项目、互动解答、孵化园详情等进行分享，每操作一次+2分，每日最多加10分。</li>
            <li>发布话题：用户在互动中心发布一个话题+5分，每日最多加10分。</li>
        </ol>
    </div>
</section>
<section class="qestion">
    <div class="jfqestion">积分使用：</div>
    <div class="jfanswer">
        <p>SYE创业四川微信平台将不定期提供积分兑换商品服务，请注意阅读每周的平台推文。</p>
    </div>
</section>
<section>
    <div class="Power"><p>积分规则的最终解释权归SYE创业四川微信平台所有。</p></div>
</section>
</body>
</html>