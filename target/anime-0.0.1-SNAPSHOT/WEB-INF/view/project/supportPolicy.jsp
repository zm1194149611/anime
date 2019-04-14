<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name='apple-mobile-web-app-capable' content='yes'/>
    <title>扶持政策</title>
    <link href="${contextPath}/css/support policy.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
    var contextPath = '${contextPath}';
    var userId='${userId}';
    var domain = '${domainName}';
    var isUpdateUser = '${isUpdateUser}';
    var type = "footerAddSubMenu";
    </script>
    <script src="${contextPath}/js/footer.js" type="text/javascript"></script>
    <script>
        window.onload= function () {
            footer.footerAddSubMenu();
        }
    </script>
</head>
<body>
<header>
    <img src="${contextPath}/image/top_line.png">
</header><section>
    <div>
    	<p class="sup_tit">SYE是什么</p>
    	<p class="sup_is">SYE是一个扶持创业的教育性公益项目，通过构建SYE创业体系，促进改善创业环境，为缺乏条件启动创业和发展企业的创业者提供专业化的公益帮抉。</p>
    	<p class="sup_tit">SYE帮扶对象</p>
    	<ul>
    		<li><img src="${contextPath}/image/point.png" />&nbsp;&nbsp;全省18-40岁的青年人</li>
    		<li><img src="${contextPath}/image/point.png" />&nbsp;&nbsp;有创业梦想和创业激情</li>
    		<li><img src="${contextPath}/image/point.png" />&nbsp;&nbsp;有很好的商业点子</li>
    		<li><img src="${contextPath}/image/point.png" />&nbsp;&nbsp;筹措不到创业启动资金</li>
    		<li><img src="${contextPath}/image/point.png" />&nbsp;&nbsp;缺乏商业经验</li>
    		<li><img src="${contextPath}/image/point.png" />&nbsp;&nbsp;创业一年以内</li>
    	</ul>
    	<p class="sup_tit">SYE核心服务内容</p>
    	<ul>
    		<li><img src="${contextPath}/image/point.png" />&nbsp;&nbsp;提供3-10万元免息、免担保的创业启动资金贷款</li>
    		<li><img src="${contextPath}/image/point.png" />&nbsp;&nbsp;咨询培训和“一对一”志愿者导师陪伴式导师辅导3年</li>
    		<li><img src="${contextPath}/image/point.png" />&nbsp;&nbsp;引导创业青年进入工商网络，帮助青年创业成功。</li>
    	</ul>
        <!--  <p>&nbsp;&nbsp;&nbsp;&nbsp;今日头条是一款基于数据挖掘的推荐引擎产品，它为用户推荐有价值的、个性化的信息，提供连接人与信息的新型服务，是国内移动互联网领域成长最快的产品服务之一。</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;它由国内互联网创业者张一鸣于2012年3月创建，于2012年8月发布第一个版本，截止2016年4月，今日头条累计激活用户数已达4.7亿，日活跃人数超过4700万，月活跃人数超过1亿2千万，单用户每日使用时长超过57分钟。其中，“头条号”平台的账号数量已超过6.5万个，与今日头条合作的各类媒体、政府、机构总计超过16000家，签约合作的传统媒体机构过2000家。</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;它由国内互联网创业者张一鸣于2012年3月创建，于2012年8月发布第一个版本，截止2016年4月，今日头条累计激活用户数已达4.7亿，日活跃人数超过4700万，月活跃人数超过1亿2千万，单用户每日使用时长超过57分钟。其中，“头条号”平台的账号数量已超过6.5万个，与今日头条合作的各类媒体、政府、机构总计超过16000家，签约合作的传统媒体机构过2000家。</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;它由国内互联网创业者张一鸣于2012年3月创建，于2012年8月发布第一个版本，截止2016年4月，今日头条累计激活用户数已达4.7亿，日活跃人数超过4700万，月活跃人数超过1亿2千万，单用户每日使用时长超过57分钟。其中，“头条号”平台的账号数量已超过6.5万个，与今日头条合作的各类媒体、政府、机构总计超过16000家，签约合作的传统媒体机构过2000家。</p>-->
    </div>
</section><aside>
    <img src="${contextPath}/image/bottom_line.png">
</aside>
<div class="footer-fill"></div>
</body>
</html>