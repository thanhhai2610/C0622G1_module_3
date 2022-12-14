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

<div style="text-align: center;">
    <h1>Product Management</h1> </br>
    <a href="/product?action=add"><input type="submit" value="Thêm Mới Sản Phẩm"/></a></br></br>
    <a href="/product?action=add"> <input placeholder="Search" type="text" name="id" size="45"/></a></br></br>

</div>
<table class="table table-dark">
    <tr>
        <th>STT</th>
        <th>Id</th>
        <th>Name Product</th>
        <th>Company</th>
        <th>Made</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="product" items="${listProduct}" varStatus="status">
    <tr>
        <td>${status.count}</td>
        <td>${product.id}</td>
        <td>${product.nameProduct}</td>
        <td>${product.company}</td>
        <td>${product.madeIn}</td>
        <td><a href="/product?action=edit&id=${product.id}">
            <button class="btn btn-primary">Edit</button>
        </a></td>
        <td><a href="/product?action=delete&id=${product.id}">
            <button class="btn btn-danger">Delete</button>
        </a></td>
    </tr>
    </c:forEach>

</body>
</html>
