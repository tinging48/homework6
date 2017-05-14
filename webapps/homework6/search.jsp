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
    String sql = "select * from person;";
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
    <title>查詢</title>
    <style>
      table,th {
        border: 1.5px solid black;
        padding: 3px;
        align="center";
        color: rgb(50,100,120);
        font-size: 16px;
      }
      td{
        border: 1px solid green;
        padding: 3px;
      }
    </style>
  </head>
  <body>
    <div class="login-form">
      <div class="header">
        <h1>帳號及姓名</h1>
        <span>請點選欲查詢詳細資料之帳號</span>
      </div>
    <table class="login-form">
      <div class="content">
      <tr>
        <th>帳號</th>
        <th>姓名</th>
      </tr>

      <%
        if(rs!=null){
          while(rs.next()){
            String account1=rs.getString("account");
            String name1=rs.getString("name");
      %>
      <tr>
        <td><a href="detail.jsp?account=<%=account1%>"><%=account1%></a></td>
        <td><%=name1%></td>
      </tr>

      <%}}%>
      </table><br>
        <div class="footer">
          <input type="button" class="button" onclick="window.open('index.jsp','_self')" value="返回"/>
        </div>
      </div>
    </div>
  </body>
</html>
