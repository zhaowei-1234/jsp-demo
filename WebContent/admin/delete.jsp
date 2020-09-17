<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String cat=request.getParameter("cat");
String name = request.getParameter("ids");
String sql="delete from "+cat+" where "+cat+"='"+name+"'";
System.out.println("sql = " + sql);
Connection conn=null;// 连接对象
Statement stmt=null;//stmt对象用于发送sql
ResultSet rs=null;// 结果集对象
<<<<<<< HEAD
String str=";//数据库物理地址
String user=";//访问数据库的用户名
String ps="; //访问数据库的密码
=======
String str="";//数据库物理地址
String user="";//访问数据库的用户名
String ps=""; //访问数据库的密码
>>>>>>> 8c752376ea5361894080f986a3cb00b7fc797414


try{
Class.forName("com.mysql.jdbc.Driver");//加载驱动程序
   }
catch(ClassNotFoundException e){
	System.out.println(e);
}
try{
	conn=DriverManager.getConnection(str, user, ps);//创建连接
	stmt=conn.createStatement();//创建stmt对象
	//rs=stmt.executeQuery(sql);
	int i=stmt.executeUpdate(sql);
	out.print("<div style='text-align:center;vertical-align:middle;'><h1>成功删除"+i+"条记录</h1></div>");
	
	conn.close();
}
catch(SQLException e){
	System.out.println(e);
}


%>

</body>
</html>
