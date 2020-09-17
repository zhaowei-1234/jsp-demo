<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录/注册页面</title>
<link type="text/css" rel="styleSheet" href="index.css">
</head>
<body style="background:bisque;">
<div class="head">
    <a style="margin-left: 60px;margin-right: 90px;">欢迎来到网上购物商城！</a>
    <ul>
        <li><a href="index.html">首页</a></li>
        <li><a href="login.jsp %>">登录/注册</a></li>
        <li><a href="buy.jsp">购物车</a></li>
        <li><a href="payform.jsp %>">已支付订单</a></li>
    </ul>
</div>
<div><br><br><br>
<h2 align="center">登录/注册页面</h2>
<form action="" method="get" class="f1">
请输入用户名：<input name="username" type="text" >(用户名不超过8位！)<br>
请输入密码：<input name="password" type="text" style="margin-top:10%;">(密码只能为数字或字母！)<br><br><br>
<select name="www">
<option>ww</option>
</select>
<input id="button" type="submit" value="注册/登录" style="margin-right:20%;margin-left:20%;">
<input id="button" type="reset" value="重置">
</form>
</div>
<%
ResultSet rs=null;
ResultSet rsq=null;
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=utf-8");
request.setCharacterEncoding("utf-8");
String name = request.getParameter("username");
String ps = request.getParameter("password");
System.out.print(request.getParameter("www"));
if (null != name) { 
	
System.out.println("name = " + name);
System.out.println("password = " + ps);
String sql="insert into user(username,password)values('"+name+"','"+ps+"')";
String sq0="SELECT * FROM user where username = '" +name+"'";
String sq= "SELECT * FROM user where username = '" +name+"' and password='"+ps+"'";
PreparedStatement preparedStatement = null;
try{
Class.forName("com.mysql.jdbc.Driver");
   }
catch(ClassNotFoundException e){
System.out.println(e);
}
String url = "";	
Connection conn = DriverManager.getConnection(url, );
Statement stat = conn.createStatement();
rsq=stat.executeQuery(sq0);
if (rsq.next()) {
	rs=stat.executeQuery(sq);
	if(rs.next()){
		HttpSession s1 = request.getSession();
		s1.setAttribute("login", "yes");
		out.print("<br><center>登录成功!</center>");
		if (name.equals("admin")) {
			s1.setAttribute("admin", "yes");
			response.sendRedirect(request.getContextPath()+"/admin/fenye.jsp");
		}
   }
	else{ 
		out.print("<br><center>登录失败,密码错误!</center>");
	}
} else  {
	
	stat.execute(sql);
	HttpSession s1 = request.getSession();
	s1.setAttribute("login", "yes");
	out.print("<br><center>注册成功!</center>");
}
conn.close();
stat.close();
}
%>
<a href="index.html?username=<%=name %>">去首页看看</a>  
</body>
</html>