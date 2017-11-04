<%--
  Created by IntelliJ IDEA.
  User: 22948
  Date: 2017/11/1
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    session.removeAttribute("user");
    session.invalidate();
%>
    <script type="text/javascript">
        alert("退出成功！");
        window.location.href = 'index.jsp';
    </script>
