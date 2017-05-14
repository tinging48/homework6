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
 int x = 0;int y = 0;
 String message="";
 if(account !=null && password !=null && name !=null && birth !=null && email !=null && phone !=null){
   try{
     database.connectDB();
     String sql = "select * from person;";
     database.query(sql);
     rs = database.getRS();
     if(rs!=null){
       while(rs.next()){
         String accountData = rs.getString("account");
         if(account.equals(accountData)){ //帳號已註冊過
           y+=1;
           break;
         }
       }
       if(y!=0){
         message="註冊失敗！";
       }else{
         database.insertData(account,password,name,birth,email,phone);
         message="註冊成功！";
        }
      }
     }catch(Exception ex){
       out.println(ex);
      }
   }else{
      message="登入成功！";
    }
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
    <title>會員管理</title>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.min.js"></script>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
    <div class="login-form">
      <div class="header">
      <h1 id="test"><%=message%></h1>
      </div>

      <div class="content">
      <%
      if(rs!=null && y==0){
        while(rs.next()){
          if(account.equals(rs.getString("account"))){
            if(password.equals(rs.getString("password"))){
              String name1=rs.getString("name");
              String birth1=rs.getString("birth");
              String email1=rs.getString("email");
              String phone1=rs.getString("phone");
      %>
            <div class="words">
              姓名：<%=name1%><br>
              生日：<%=birth1%><br>
              E-Mail：<%=email1%><br>
              電話號碼：<%=phone1%><br>
            </div>

            <div class="footer">
            <input type="button" class="button" id="login" onclick="window.open('index.jsp','_self')" value="回到登入畫面"/>
            <input type="button" class="button" onclick="window.open('search.jsp','_self')" value="搜尋"/>
            </div>
        <%
              x+=1;
              break;
            }
          }
        }
      }
        %>
        <%if(x==0 && y==0){%>
          <script>$("#test").html("登入失敗！");</script>
          <p class="words">帳號或密碼輸入錯誤</p>
          <div class="footer">
          <input type="button" class="button" onclick="window.open('new.jsp','_self')" value="創建新賬號"/>
          </div>
        <%}%>
          <%if(y!=0){%>
            <p class="words">帳號已註冊過</p><br>
            <div class="footer">
              <input type="button" class="button" onclick="history.back()" value="返回註冊頁面"/>
              <input type="button" class="button" onclick="window.open('index.jsp','_self')" value="回到登入畫面"/>
            </div>
        <%}%>
      </form>
    </div>
  </div>
  </body>
</html>
