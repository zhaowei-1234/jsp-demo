<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="head.jsp"%>

<%
Connection conn=null;// 连接对象
Statement stmt=null;//stmt对象用于发送sql
ResultSet rs=null;// 结果集对象
String str="";//数据库物理地址
String user="";//访问数据库的用户名
String ps=""; //访问数据库的密码

String sql="select * from 电器";
String sqlNum="select count(*) as number from 电器";//定义查询总条数的sql 

String sql1 = "select * from 服饰";
String sql1Num="select count(*) as number from 服饰";

String sql2 = "select * from 零食";
String sql2Num="select count(*) as number from 零食";

String sql3 = "select * from 美妆";
String sql3Num="select count(*) as number from 零食";

String sql4 = "select * from 图书";
String sql4Num="select count(*) as number from 图书";

int pagesize=5;//定义每页现实的条数
int p=1;//定义当前页数
int totalpage=1;//定义总共页数
int totalrecord=1;//定义所有条数
//int id=1;//判定当前传递的id
String ids = null;
try{
Class.forName("com.mysql.jdbc.Driver");//加载驱动程序
   }
catch(ClassNotFoundException e){
	System.out.println(e);
}
try{
	conn=DriverManager.getConnection(str, user, ps);//创建连接
	stmt=conn.createStatement();//创建stmt对象
	
	rs=stmt.executeQuery(sql1Num);
	rs.next();
	//System.out.println("getINt()"+rs.getInt(1));
	totalrecord=rs.getInt(1);
	
	rs=stmt.executeQuery(sql1);// 发送sql语句返回结果集
	if(totalrecord%pagesize==0){
		totalpage=totalrecord/pagesize;//确定总的页数
	}else{
		totalpage=totalrecord/pagesize+1;
	}
	if(request.getParameter("p")==null||request.getParameter("p").equals("")){
		p=1;//判断是否有参数传入 
	}
	try{
		p=Integer.parseInt(request.getParameter("p"));//获得想要跳转的页面 
	}
	catch(NumberFormatException e){
		p=1;// 捕获格式化异常 
		
	}
	if(p>totalpage)p=totalpage;
	if(p<1)p=1;
	out.print("<table border=1 width=100% ><tr><th>电器</th><th>价格</th><th>图片</th><th>修改</th><th>删除</th></tr>");
	rs.absolute((p-1)*pagesize+1);
	for(int i=0;i<5;i++){
		//id=rs.getInt(1);
		ids = rs.getString(1);
		out.print("<tr><td align='center' valign='middle'>"+ids+"</td><td align='center' valign='middle'>"+rs.getFloat(2)+"</td><td align='center' valign='middle'><img src='"+rs.getString(3)+"' width='180' height='170' style='display: inline-block;'/>"+"</td><td align='center' valign='middle'><a href=modify.jsp?cat=服饰&ids="+ids+">修改</a></td><td align='center' valign='middle'><a href=delete.jsp?cat=服饰&ids="+ids+">删除</a> </td></tr>");
	    if(!rs.next())break;
	}
	out.print("</table>");
	rs=stmt.executeQuery(sql);
	conn.close();
}
catch(SQLException e){
	System.out.println(e);
}


%>

<hr>
<form action="fushi.jsp">
共有<%=totalrecord %>数据|第<%=p %>/<%=totalpage %>页   转向<input type="text" size="1" name=p>
<input type="submit" value="跳转"></form>
<hr>
<%
if(p==1){
	%>
 <a href=fushi.jsp?p=<%=p+1 %>>下一页</a>   <a href=fushi.jsp?p=<%=totalpage%>>尾页</a> 
<%}
else if(p==totalpage){
	%>	
	<a href=fushi.jsp>首页</a>   <a href=fushi.jsp?p=<%=p-1 %>>上一页</a> 
	
	<%
} else{
	%>
	<a href=fushi.jsp>首页</a>   <a href=fushi.jsp?p=<%=p-1 %>>上一页</a> 
	<a href=fushi.jsp?p=<%=p+1 %>>下一页</a>   <a href=fushi.jsp?p=<%=totalpage%>>尾页</a> 
	<%
}
%>
<a href="insert.jsp">新增数据</a>
</body>
</html>