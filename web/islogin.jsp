<%--
  Created by IntelliJ IDEA.
  User: 22948
  Date: 2017/10/15
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    if(session.getAttribute("user") == null){
%>
<script type="text/javascript">
    alert("请先登录");
    window.location.href='index.jsp';
</script>
<%
    }
%>
