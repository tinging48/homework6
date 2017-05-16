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
    <title>註冊新帳號</title>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
    <div class="login-form">
      <div class="header">
      <h1>註冊</h1>
      </div>
      <form action="member.jsp" method="post">
        <div class="content">
          <input name="account" type="text" class="input" placeholder="帳號" autocomplete="off" autofocus required/><br>
          <input name="password" type="password" class="input" placeholder="密碼（請輸入6-12字元）" pattern="[A-Za-z0-9]{6,12}" title="請輸入6-12字元" required/><br>
          <input name="name" type="text" class="input" placeholder="姓名" autocomplete="off"/><br>
          <input name="birth" type="text" class="input" placeholder="生日" autocomplete="off"/><br>
          <input name="email" type="text" class="input" placeholder="電子郵件" autocomplete="off"/><br>
          <input name="phone" type="text" class="input" placeholder="電話號碼" autocomplete="off"/><br>
        </div>
        <div class="footer">
          <input type="submit" class="button" value="提交"/>
        </div>
      </form>
    </div>
  </body>
</html>
