<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>开发团队介绍-IT干货技术分享网</title>
<link rel="stylesheet" href="<%=path%>/css/style.css" />
<link rel="stylesheet" href="<%=path%>/css/responsive.css" />
<style type="text/css">
.area{
	width:100%;
	margin:20px;
}
.context{
	width:100px;
	margin:15px;
	float: left;
}
.context p{
	text-align: center;
	margin: 5px 0 5px 0;
}
.title{
	width:130px;
}
</style>
</head>

<body id="body">

<%@ include file="common/f_header1.jsp" %>
<%@ include file="common/f_header2.jsp" %>

<div class="container">
	<div class="area">
		<div class="title"><h2>设计开发</h2></div>
		<div class="context">
			<div><img alt="北京-C&B" src="<%=path%>/imgs/t4.png" width="100px" height="100px" /></div>
			<div><p>北京-C&B</p></div>
		</div>
		<div class="context">
			<div><img alt="深圳-夕落" src="<%=path%>/imgs/t5.png" width="100px" height="100px" /></div>
			<div><p>深圳-夕落</p></div>
		</div>
		<div class="context">
			<div><img alt="深圳-小兴" src="<%=path%>/imgs/t1.png" width="100px" height="100px" /></div>
			<div><p>深圳-小兴</p></div>
		</div>
		<div class="context">
			<div><img alt="天津-朱塞佩" src="<%=path%>/imgs/t2.png" width="100px" height="100px" /></div>
			<div><p>天津-朱塞佩</p></div>
		</div>
	</div>
	<div class="area">
		<div class="title"><h2>服务器支持</h2></div>
		<div class="context">
			<div><img alt="北京-胜子" src="<%=path%>/imgs/t3.png" width="100px" height="100px" /></div>
			<div><p>北京-胜子</p></div>
		</div>
		<div class="context">
			<div><img alt="长春-零度" src="<%=path%>/imgs/t6.png" width="100px" height="100px" /></div>
			<div><p>长春-零度</p></div>
		</div>
	</div>
</div>

<%@ include file="common/f_footer.jsp" %>

</body>
</html>
