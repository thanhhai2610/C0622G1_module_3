<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>

<div style="text-align: center;">
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create">Add New User</a>
    </h2>
    <center>
        <form action="/users?action=searchName" method="post">
            <table border="1" cellpadding="5">
                <tr>
                    <td>
                        <input type="submit" value="Search Name"/>
                    </td>
                    <td>
                        <input placeholder="Search" type="text" name="name" size="45"/>
                    </td>
                </tr>
                </tr>
            </table>
            <c:if test="${listUser.size()==0}">
                <p>Khong tim thay</p>
            </c:if>
        </form>
    </center>
</div>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><a href="/users?action=view&id=${user.id}"><c:out value="${user.id}"/> </a></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}">Edit</a>
                    <a href="/users?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>