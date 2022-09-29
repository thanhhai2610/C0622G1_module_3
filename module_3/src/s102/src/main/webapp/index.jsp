<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 09/29/2022
  Time: 3:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<h1>Simple Calculator</h1>
<p>Calculator</p>
<form action="/Calculator" method="post">
  <table>
    <tr>
      <th>First operand</th>
      <td><input type="text" name="first-operand"></td>
    </tr>
    <tr>
      <th>Operator</th>
      <td>
        <select name="operator">
          <option value="+">Addition</option>
          <option value="-">Subtraction</option>
          <option value="*">Multiplication</option>
          <option value="/">Division</option>
        </select>
      </td>
    </tr>
    <tr>
      <th>Second operand</th>
      <td><input type="text" name="second-operand"></td>
    </tr>
    <tr>
      <td><input type="submit" value="Calcuulate"></td>
    </tr>
  </table>
</form>

</body>
</html>
