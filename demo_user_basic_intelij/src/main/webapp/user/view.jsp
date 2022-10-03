<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/03/2022
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div style="text-align: center;">
    <h1>User Detail</h1>
</div>
<div align="center">
    <table border="1" cellpadding="5">
        <tr>
            <th>ID</th>
            <td><c:out value="${user.id}"/></td>
        </tr>
        <tr>
            <th>Name</th>
            <td><c:out value="${user.name}"/></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><c:out value="${user.email}"/></td>
        </tr>
        <tr>
            <th>Country</th>
            <td><c:out value="${user.country}"/></td>
        </tr>
    </table>
</div>
</body>
</html>
