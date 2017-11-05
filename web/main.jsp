<%@ page import="java.util.ArrayList" %>
<%@ page import="cn.xu419.Redio" %>
<%@ page import="cn.xu419.DatabaseHelp" %><%--
  Created by IntelliJ IDEA.
  User: 22948
  Date: 2017/10/15
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="islogin.jsp"%>
<html>
<head>
    <title>在线答题系统</title>
</head>
<body>
<p>hello <%=session.getAttribute("user")%></p>
<div>
    <form action="checkResult.jsp" method="post">
        <%
            DatabaseHelp dbhelp = new DatabaseHelp();
            String sql = "SELECT * FROM t_question";
            ArrayList<Redio> list = dbhelp.getRediosBySql(sql);
            for (int i = 0; i < list.size(); i++) {
        %>
        <input type="hidden" name="amount" value="<%=list.size()%>">
        <jsp:useBean id="question" class="cn.xu419.Redio" scope="page"/>
        <jsp:setProperty
                name="question" property="num" value="<%=list.get(i).getNum()%>"/>
        <jsp:setProperty
                name="question" property="stem" value="<%=list.get(i).getStem()%>"/>
        <jsp:setProperty
                name="question" property="score" value="<%=list.get(i).getScore()%>"/>
        <jsp:setProperty
                name="question" property="optionOne" value="<%=list.get(i).getOptionOne()%>"/>
        <jsp:setProperty
                name="question" property="optionTwo" value="<%=list.get(i).getOptionTwo()%>"/>
        <jsp:setProperty
                name="question" property="optionThree" value="<%=list.get(i).getOptionThree()%>"/>
        <jsp:setProperty
                name="question" property="optionFour" value="<%=list.get(i).getOptionFour()%>"/>
        <jsp:setProperty
                name="question" property="course" value="<%=list.get(i).getCourse()%>"/>
        <p>
            <%=i+1%>.<%=question.getStem()%>(分值:<%=question.getScore()%> 题型:<%=question.getCourse()%>)
        </p>
        <input type="hidden" name="<%="num"+i%>" value="<%=question.getNum()%>">
        <input type="radio" name="<%="question"+i%>" id="one" value="<%=question.getOptionOne()%>"/>
        <label for="one">A.<%=question.getOptionOne()%></label><br/>
        <input type="radio" name="<%="question"+i%>" id="two" value="<%=question.getOptionTwo()%>"/>
        <label for="two">B.<%=question.getOptionTwo()%></label><br/>
        <input type="radio" name="<%="question"+i%>" id="three" value="<%=question.getOptionThree()%>"/>
        <label for="three">C.<%=question.getOptionThree()%></label><br/>
        <input type="radio" name="<%="question"+i%>" id="four" value="<%=question.getOptionFour()%>"/>
        <label for="four">D.<%=question.getOptionFour()%></label><br/>
        <%
            }
        %>
        <input type="submit" value="提交答案">
    </form>
</div>
<a href="quit.jsp">退出</a>
</body>
</html>
