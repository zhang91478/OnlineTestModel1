<%@ page import="cn.xu419.DatabaseHelp" %><%--
  Created by IntelliJ IDEA.
  User: 22948
  Date: 2017/10/20
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>
<%@include file="islogin.jsp"%>
<html>
<head>
    <title>result</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int result =0;
    int amount = Integer.parseInt(request.getParameter("amount"));
    DatabaseHelp databaseHelp = new DatabaseHelp();
    for (int i = 0; i < amount; i++) {
        String option = request.getParameter("question"+i);
        String num = request.getParameter("num"+i);
        result = result + databaseHelp.getAnswerScore(num,option);
    }
    out.print("你的最终得分为"+result);
%>
<a href="quit.jsp">退出</a>
</body>
</html>
