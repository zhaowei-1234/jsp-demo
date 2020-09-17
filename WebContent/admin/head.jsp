<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<% int ff = 1;%>
<script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js"></script>

</head>
<style type="text/css">

	.menu
	{
		font-size: 0;
		padding: 0;
		height: 50px;
		padding-left: 40%;
		background-color: #00a2ca;
		position: relative;
	}
	.menubar
	{
		margin: 0 auto;
		position: absolute;
		list-style-type: none;
		width: 100%;
		overflow-y: auto;
	}
 
	.menubar li
	{
		padding:0px 5px;
		display:inline-block;
		cursor: pointer;
		line-height: 50px;	
		margin:0px 15px;	
	}
	.menubar li:hover
	{
	background-color:#0095bb;
	}
	.menubar li.menu-value
	{
		background-color: #0095bb;	
	}
 
	.menubar a
	{
		display: block;
		height: 50px;
		font-family: "微软雅黑","Microsoft Yahei","Hiragino Sans GB",tahoma,arial,"宋体" ;
		font-size: 20px;
		text-align: center;
		text-decoration: none;
		color: #fff;
	}
 
</style>

<body>

<div class="menu">
	<ul class="menubar">
		<li class="menu-value" ><a href="${pageContext.request.contextPath}/admin/fenye.jsp">电器</a></li>
		<li class="" ><a href="${pageContext.request.contextPath}/admin/fushi.jsp">服饰</a></li>
		<li class="" ><a href="${pageContext.request.contextPath}/admin/lingshi.jsp">零食</a></li>
		<li class="" ><a href="${pageContext.request.contextPath}/admin/mz.jsp">美妆</a></li>
		<li class="" ><a href="${pageContext.request.contextPath}/admin/tushu.jsp">图书</a></li>
		<li class="" ><a id = "logout" onclick = "logout()" href="${pageContext.request.contextPath}/exit">退出登录</a></li>
	</ul>
</div>

</body>
</html>
