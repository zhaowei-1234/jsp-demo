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
String cat = request.getParameter("cat");
System.out.println(cat);
String name=request.getParameter("name");
String price=request.getParameter("price");
String img=request.getParameter("img");
String pn = "价格";
String imn = "网址";
String sql="UPDATE "+cat+" SET "+cat+"='"+name+"',"+pn+"='"+price+"',"+imn+"='"+img+"' WHERE "+cat+"='"+name+"'";

Connection conn=null;// 连接对象
Statement stmt=null;//stmt对象用于发送sql
ResultSet rs=null;// 结果集对象
String str=";
String user="";//访问数据库的用户名
String ps=""; //访问数据库的密码


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
	conn.close();
	out.write("<div style='text-align:center;vertical-align:middle;'><h1>修改成功</h1></div>");

}
catch(SQLException e){
	System.out.println(e);
}

%>

</body>
</html>