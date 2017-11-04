<%--
  Created by IntelliJ IDEA.
  User: 22948
  Date: 2017/10/15
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>
<html>
  <head>
    <title>JavaWeb</title>
  </head>
  <body>
  <div >
      <h1>Welcome</h1>
      <form class="form" action="checkLogin.jsp" method="post">
          <input type="text" placeholder="Username" name="Username"><br/>
          <input type="password" placeholder="Password" name="Password"><br/>
          <button type="submit">Login</button><br/>
      </form>
  </div>
  </body>
</html>
