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

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
</br>
<a href="/product"><input type="submit" value="Home"/></a></br>


<c:if test="${mess!=null}">
    <div aria-live="polite" aria-atomic="true" class="position-relative">
        <div class="toast fade show" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <svg class="bd-placeholder-img rounded me-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg"
                     aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <rect width="100%" height="100%" fill="#007aff"></rect>
                </svg>
                <strong class="me-auto"><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Create Product</span></span></strong>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Đóng"></button>
            </div>
            <div class="toast-body"><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">
                   <strong> ${mess}</strong> </span></span></div>
        </div>
    </div>
</c:if>


<%--<c:if test="${mess!=null}">--%>
<%--    <span>${mess}</span>--%>
<%--</c:if>--%>

<div style="text-align: center;">
    <h1>Product Management</h1>
</div>
<div align="center">
    <form action="/product?action=add" method="post">
        <table border="1" cellpadding="5">
            <tr>
                <td colspan="2" align="center">
                    <h2> Create Product </h2>
                </td>
            </tr>
            <tr>
                <th>Id:</th>
                <td>
                    <input type="text" name="id" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Name Product:</th>
                <td>
                    <input type="text" name="nameProduct" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Company:</th>
                <td>
                    <input type="text" name="company" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Made :</th>
                <td>
                    <input type="text" name="madeIn" size="45"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Add"/>
                </td>
            </tr>
        </table>
    </form>

</div>
</body>
</html>
