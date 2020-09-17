<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.sql.*" import="java.util.*" %>
<!DOCTYPE html>
<%String usr=request.getParameter("username");%>
<html>
<head>
<meta charset="UTF-8">
<title>网上购物商城</title>
<link type="text/css" rel="styleSheet" href="./index.css">
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">

		$("#logout").click(function(){
			<% session.invalidate();%>
			sessionStorage.clear();
			window.location.reload()
	    })
	</script>
	
</head>
<body>
<div class="contian" style="display: flex;flex-direction: row;flex-wrap:wrap;" >
<div class="head">
    <a style="margin-left: 60px;margin-right: 90px;">欢迎来到网上购物商城！</a>
    <ul>
        <li><a href="index.html">首页</a></li>
        <li><a href="login.jsp">登录/注册</a></li>
        <li><a href="buy.jsp?usr=<%=usr%>">购物车</a></li>
        <li><a href="payform.jsp">已支付订单</a></li>
        <li><a id="logout" href ="login.jsp">退出登录</a></li>
    </ul>
</div>
 <form class="list" method="post" action="" style=" height:600px">
        <ul id="a" style="height:600px">
            <li><br>宝贝分类<hr></li>
            <li><button value="服饰" type="submit" name="button">服饰</button></li>
            <li><button value="美妆" type="submit" name="button">美妆</button></li>
            <li><button value="零食" type="submit" name="button">零食</button></li>
            <li><button value="图书" type="submit" name="button">图书</button></li>
            <li><button value="电器" type="submit" name="button">电器</button></li>
        </ul>
 
   </form>
   
</div>
<%
ResultSet rs=null;
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=utf-8");
request.setCharacterEncoding("utf-8");
String table= new String(request.getParameter("button").getBytes("iso-8859-1"), "utf-8");
String sql="select * from "+table;
System.out.println(sql);
PreparedStatement preparedStatement = null;
try{
Class.forName("com.mysql.jdbc.Driver");
   }
catch(ClassNotFoundException e){
System.out.println(e);
}
String url = "	
Connection conn = DriverManager.getConnection(url, ");
Statement stat = conn.createStatement();
rs=stat.executeQuery(sql);
out.print("<div style='text-align:center;height:600px;background:bisque;margin-top:-600px;width:80%;float: right;display: flex;flex-direction: row;flex-wrap: wrap;'>");
while(rs.next()){
	String name = rs.getString(1);
	float  prize=rs.getFloat(2);
	String uu=rs.getString(3);
	out.print("<form style='text-align:center;height:33%;width:20%;float: right;background:white;margin-left:30px;' action='buy.jsp';method='post'>");
	out.print("<img style='width:120px;height:120px;' src="+uu+" ><br>");
	out.println("商品名称："+name+"<br>商品价格："+prize+"元/件<br>");
	out.print("<input type='hidden' name='za' value="+name+">");
	out.print("<input type='hidden' name='zb' value="+prize+">");
	out.print("购买数量:<input type='text' value='1' name=zz style='width:20%'>&nbsp<input type='submit' value='加入购物车'>");
	out.print("<input type='hidden' name='usr' value="+usr+">");
	out.print("</form>");
}
out.print("</div>");
rs.close();
conn.close();
stat.close();
%>
</body>
</html>