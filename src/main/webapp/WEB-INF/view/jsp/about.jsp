<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>关于我们-IT干货技术分享网</title>
<link rel="stylesheet" href="<%=path%>/css/style.css" />
<link rel="stylesheet" href="<%=path%>/css/responsive.css" />
</head>

<body id="body">

<%@ include file="common/f_header1.jsp" %>
<%@ include file="common/f_header2.jsp" %>

<div class="container">
<div style="height: 300px">
<h3>关于我们</h3>
<p>我们是一群有梦想的年轻人，我们拥有活力、拥有激情，我们敢于挑战，善于创新。</p>
<p>梦想这东西和经典一样，不会随着时间褪色，反而更显珍贵。</p>
<p>我们可以遇到困境，但不可以因此而止步不前。我们总是可以做些什么，因为世界比我们想象中的要好很多。当我们为了脱离困境而努力了，幸福便会找上门来。</p>
</div>
</div>

<%@ include file="common/f_footer.jsp" %>

</body>
</html>
