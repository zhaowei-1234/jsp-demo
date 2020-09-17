<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%String cate=""; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("ids");
String cat="";
cat = request.getParameter("cat");
cate=cat;
System.out.println(name+", "+cat);
float price=0;
String img="";
Connection conn=null;// 连接对象
Statement stmt=null;//stmt对象用于发送sql
ResultSet rs=null;// 结果集对象
String str=";
String user=";//访问数据库的用户名
String ps=""; //访问数据库的密码
String sql="select * from "+cat+" where "+cat+" = '"+name+"'";//查询的sql语句

try{
Class.forName("com.mysql.jdbc.Driver");//加载驱动程序
   }
catch(ClassNotFoundException e){
	System.out.println(e);
}
try{
	conn=DriverManager.getConnection(str, user, ps);//创建连接
	stmt=conn.createStatement();//创建stmt对象
	rs=stmt.executeQuery(sql);
	rs.next();
	price=rs.getFloat(2);
	img = rs.getString(3);
	%>
	<div style="background:url('https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1923814068,3052770400&fm=26&gp=0.jpg');text-align:center;vertical-align:middle;height:100%;width: 100%;">
	
	<form action="msave.jsp">
	
	<br><br><br><br><br><br><br><br><div style="text-align:center;vertical-align:middle;">
	<h2>名称:  </h2> <input type="text" name="name"  align="center" value=<%=name %> readonly><br><br></div>
	
	<div style="text-align:center;vertical-align:middle;">
	<h2>价格：</h2><input type="text" name="price"  align="center" value=<%=price %>><br><br></div>
	
	
	<div style="text-align:center;vertical-align:middle;">
	<h2>图片：</h2><input type="text" name="img"  align="center" value=<%=img %>><br><br><br></div>
	
	<div style="text-align:center;vertical-align:middle;">
	<h2>图片预览：</h2><br><br><img src = "<%=img %>" width="200" height="200" style="display: inline-block;"/><br><br>
	</div>
	<input type="hidden" name="cat" value=<%=cate%> readonly/>
	
	<div style="text-align:center;vertical-align:middle;">
	<input type="submit" value="修改"><br><br><br><br><br></div>
	</form>
	</div>
	<%
	
	conn.close();
}
catch(SQLException e){
	System.out.println(e);
}





%>

</body>
</html>