<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 09/30/2022
  Time: 9:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Trang them moi</h1>

<a href="/product">Quay lại trang list</a></br>

<c:if test="${mess!=null}">
    <span>${mess}</span>
</c:if>

<form action="/product?action=add" method="post">
    <pre>ID:       <input type="text" name="id"/></pre>
    <pre>Name Product:     <input type="text" name="nameProduct"> </pre>
    <pre>Company:     <input type="text" name="company"> </pre>
    <pre>Made:     <input type="text" name="madeIn"> </pre>


    <pre><button>Save</button></pre>
</form>
</body>
</html>
