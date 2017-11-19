
<%@ page import="cn.xu419.DatabaseHelp" %>

<%--
  Created by IntelliJ IDEA.
  User: 22948
  Date: 2017/10/15
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>
<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("Username");
    String passwd = request.getParameter("Password");
    DatabaseHelp databaseHelp = new DatabaseHelp();
    if(databaseHelp.isAccountAllowed(name,passwd)){
        session.setAttribute("user",name);
        response.sendRedirect("main.jsp");
    }else {
        if(databaseHelp.isAccountExist(name)){
            //密码错误，提示重新输入
            %>
            <script type="text/javascript">
                alert("密码错误，请重新输入");
                window.location.href='index.jsp';
            </script>
            <%
        }
        else {
            //账号不存在
            %>
            <script type="text/javascript">
                alert("账号不存在，请联系管理员");
                window.location.href='index.jsp';
            </script>
            <%
        }
    }
%>