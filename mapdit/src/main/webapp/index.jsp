<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h2>Currency Converter</h2>
<form action="/convert" method="post">
    <label>Mô tả của sản phẩm: </label>
    <input type="text"  placeholder="Product Description" value="22000"/><br/>
    <label>Giá niêm yết của sản phẩm: </label>
    <input type="text" name="listPrice" placeholder="List Price" /><br/>
    <label>Tỷ lệ chiết khấu (phần trăm): </label>
    <input type="text" name="discountPercent" placeholder="Discount Percent" /><br/>
    <input type="submit" id="submit" value="Converter"/>
</form>
<h4>Lượng chiết khấu: ${discountAmount} VND</h4>
<h4>Giá sau khi đã được chiết khấu: ${discountPrice} VND</h4>
</body>
</html>
