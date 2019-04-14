<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach var="point" items="${pointlist}">
<li>
<div class="jfborder">
                <div class="jfleft">
                    <p>${point.desc}<span>+${point.value}</span></p>
                    <p>${point.date}</p>
                </div>
                <div style="clear: both"></div>
</div>
</li>
</c:forEach>
<script type="text/javascript">showClickMore('${hasMore}');</script>