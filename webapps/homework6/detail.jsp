<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205" />
  <jsp:setProperty property="port" name="database" value="3306" />
  <jsp:setProperty property="db" name="database" value="4104029033" />
  <jsp:setProperty property="user" name="database" value="4104029033" />
  <jsp:setProperty property="password" name="database" value="Ss4104029033!" />
</jsp:useBean>
<%
request.setCharacterEncoding("UTF-8");
  String url = "";
  String driver = "com.mysql.jdbc.Driver";
  ResultSet rs = null;
  String account = request.getParameter("account");
  String password = request.getParameter("password");
  String name = request.getParameter("name");
  String birth = request.getParameter("birth");
  String email = request.getParameter("email");
  String phone = request.getParameter("phone");
  try{
    database.connectDB();
    String sql = "select * from person where account = " + "\""+account+"\"" ;
    database.query(sql);
    rs = database.getRS();
  }catch(Exception ex){
    out.println(ex);
  }
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="style.css">
    <title>詳細資訊</title>
    <style>
      table,th,td {
        border: 1px solid black;
        padding: 3px;
        align="center";
        color: rgb(120,50,140);
      }
    </style>
  </head>
  <body>
    <div class="login-form">
      <div class="header">
        <h1>帳戶資料</h1>
      </div>
    <table class="login-form" align="center">
      <tr>
        <th>帳號</th>
        <th>密碼</th>
        <th>姓名</th>
        <th>生日</th>
        <th>Email</th>
        <th>電話</th>
      </tr>

    <%
      if(rs!=null){
        while(rs.next()){
          String account1=rs.getString("account");
          String password1=rs.getString("password");
          String name1=rs.getString("name");
          String birth1=rs.getString("birth");
          String email1=rs.getString("email");
          String phone1=rs.getString("phone");
    %>

    <tr>
      <td><%=account1%></td>
      <td><%=password1%></td>
      <td><%=name1%></td>
      <td><%=birth1%></td>
      <td><%=email1%></td>
      <td><%=phone1%></td>
    </tr>

    <%}}%>

    </table><br>

      <div class="footer">
        <input type="button" class="button" onclick="window.open('search.jsp','_self')" value="返回"/>
      </div>
    </div>
  </body>
</html>
