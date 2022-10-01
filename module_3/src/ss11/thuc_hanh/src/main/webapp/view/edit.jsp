<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>

<body>
<div style="text-align: center;">
    <h1>Product Management</h1>
</div>
<div align="center">
    <form action="/product?action=edit" method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Edit Product</h2>
            </caption>
            <tr>
                <th>Id:</th>
                <td>
                    <input type="text" name="id" size="45"
                           value="${editProduct.id}"
                    />
                </td>
            </tr>
            <tr>
                <th>Name Product:</th>
                <td>
                    <input type="text" name="nameProduct" size="45"
                           value="${editProduct.nameProduct}"
                    />
                </td>
            </tr>
            <tr>
                <th>Company:</th>
                <td>
                    <input type="text" name="company" size="45"
                           value="${editProduct.company}"
                    />
                </td>
            </tr>
            <tr>
                <th>Made :</th>
                <td>
                    <input type="text" name="madeIn" size="15"
                           value="${editProduct.madeIn} "
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>

</div>
</body>
</html>