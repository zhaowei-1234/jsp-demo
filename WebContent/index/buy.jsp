<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*" import="java.util.*" import="java.net.*" %>
    
    
    <% float nn=0;%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>购物车</title>
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
<body style="background:bisque;">
<div class="head">
    <a style="margin-left: 60px;margin-right: 90px;">欢迎来到网上购物商城！</a>
    <ul>
        <li><a href="index.html">首页</a></li>
        <li><a href="login.jsp">登录/注册</a></li>
        <li><a href="buy.jsp">购物车</a></li>
        <li><a href="payform.jsp">已支付订单</a></li>
        <li><a id="logout" href ="login.jsp">退出登录</a></li>
    </ul>
</div>
<%
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=utf-8");
request.setCharacterEncoding("utf-8");
String num= request.getParameter("zz");

String name=request.getParameter("za");
String prize=request.getParameter("zb");
String username=request.getParameter("usr");  
if(num != null) {
if(Integer.parseInt(num)<=0) {
	out.print("<h1>数量不能小于0！三秒后返回主页</h1>");
	String encoder = "utf-8";
	String a = "服饰";
	//String s = URLEncoder.encode("服饰",encoder); 
	
	//response.sendRedirect("/bigtest/index/index.jsp?username="+username);
	response.setHeader("refresh", "3;URL=/bigtest/index/index.html?username="+username);
} else {

try{
int num1= Integer.parseInt(num);
System.out.print("num1 = "+num1);
 float p1=Float.parseFloat(prize);
 ResultSet rs=null;
 String sql="SELECT * FROM buy where name= '" +name+"' and username = '" + username+"'";
 String sq="insert into buy values('"+name+"','"+p1+"','"+num1+"','"+username+"')";
 
 try{
 Class.forName("com.mysql.jdbc.Driver");
    }
 catch(ClassNotFoundException e){
 System.out.println(e);
 }
 String url = ;	
 Connection conn = DriverManager.getConnection(url, ");
 Statement stat = conn.createStatement();
 rs=stat.executeQuery(sql);
 if(rs.next()){
	 System.out.println("enter update");
	 num1=num1+rs.getInt(3);
	 String ssq="update buy set num="+num1+" where name= '" +name+"' and username = '" + username+"'";
	 System.out.println("ssq = " + ssq);
	 PreparedStatement pstmt=conn.prepareStatement(ssq);
	 int res=pstmt.executeUpdate();
		if(res>0){
			System.out.println("更新数据成功");
		}
		pstmt.close();

 }
 else{
	 System.out.println("enter insert ");
	 stat.execute(sq);
	 System.out.println("插入数据成功");
 }}
catch(Exception e){
System.out.println(e);}}}
%>
<div class="buy">
<h2>购物车宝贝清单：</h2>
<% 
if(username!=null){
String sql1="SELECT * FROM buy where username= '" +username+"'";
out.println("用户"+username+",您好,您的购物车清单如下：");
out.println("<table style='text-align:center;margin: auto;'>");
out.println("<tr><th>宝贝名称</th><th>单价</th><th>数量</th><th>删除</th></tr>");
try{
Class.forName("com.mysql.jdbc.Driver");
   }
catch(ClassNotFoundException e){
System.out.println(e);
}
String url = "";	
Connection conn = DriverManager.getConnection(url, "");
Statement stat = conn.createStatement();
ResultSet re1=stat.executeQuery(sql1);
nn=0;
while(re1.next()){
	nn=nn+re1.getFloat("prize")*re1.getInt("num");
out.println("<tr><td>"+re1.getString("name")+"</td><td>"+re1.getFloat("prize")+"</td><td>"+re1.getInt("num")+"</td><td><a href=/bigtest/index/delete.jsp?name="+re1.getString("name")+"&username="+username+">删除</a></td></tr>"); }
}
else{
	out.println("<tr><td>"+"亲亲，需要先登录才能查看您的购物车哦！</td></tr>");
}
out.println("</table>");
%>
<button type="button"  value="点击购买"  onclick="alert('您需要支付的金额为<%=nn%>')">点击购买<tton>

</div>
</body>
</html>