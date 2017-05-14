<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>登入頁面</title>
    <link rel="stylesheet" href="style.css">
  </head>

  <body>
    <form class="login-form" action="member.jsp" method="post">
      <div class="header">
        <h1>請登入</h1>
        <span>請輸入帳號及密碼，密碼為6~12字元</span>
      </div>

      <div class="content">
        <input type="text" name="account" class="input username" placeholder="帳號" autocomplete="off" />
        <div class="user-icon"></div><br>
        <input type="password" name="password" class="input password" placeholder="密碼" required pattern="[A-Za-z0-9]{6,12}" title="6-12字元"/>
        <div class="pass-icon"></div><br><br>
      </div>

      <div class="footer">
        <input type="submit" class="button" value="登入"/>
        <input type="button" class="button" onclick="window.open('new.jsp','_self')" value="註冊"/>
      </div>
    </form>
  </body>
</html>
