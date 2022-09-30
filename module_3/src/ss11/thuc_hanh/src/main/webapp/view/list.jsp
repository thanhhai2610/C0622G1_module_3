<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 09/30/2022
  Time: 9:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
</head>
<body>

<h1>
    Quản lý Sản Phẩm
</h1>
<c:if test="${mess!=null}">
    <span>${mess}</span>
</c:if>
<a href="/product?action=add">Thêm Mới Sản Phẩm </a>
<table class="table table-dark">
    <tr>
        <th>STT</th>
        <th>Id</th>
        <th>Name Product</th>
        <th>Company</th>
        <th>Made</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>690
    <c:forEach var="product" items="${listProduct}" varStatus="status">
    <tr>
        <td>${status.count}</td>
        <td>${product.id}</td>
        <td>${product.nameProduct}</td>
        <td>${product.company}</td>
        <td>${product.madeIn}</td>
        <td><button class="btn btn-primary">Edit</button></td>
        <td><button class="btn btn-danger">Delete</button></td>
    </tr>
    </c:forEach>

</body>
</html>
