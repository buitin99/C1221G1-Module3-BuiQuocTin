<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 14/4/2022
  Time: 9:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Create new product</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/list.jsp">Back to customer list</a>
</p>
<form method="post">
    <label>Name Product</label>
    <input type="text" name="name"><br>
    <p style="color:red;">${error.get("name")}</p>
    <label>Price Product</label>
    <input type="number" name="price"><br>
    <label>Describe:</label>
    <input type="text" name="describe"><br>
    <label>Produce:</label>
    <input type="text" name="produce"><br>
    <button type="submit">Add new</button>
</form>
</body>
</html>
