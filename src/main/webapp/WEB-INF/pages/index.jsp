<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .nav-bar{
            width: 100%;
        }
        .sidebar{
            width: 30%;
            float: left;
        }
        .listing{
            width: 70%;
            float: left;
        }
    </style>
</head>
<body>
<div class="nav-bar">
    <label>Product Id</label>
    <input id="productId" type="text"/>
    <input type="submit" value="Search"/>
</div>


<div class="sidebar">
    <a href="/category/1/1">Phones</a>
</div>
<div class="listing">
    <c:forEach items="${products}" var="product">
        <p>${product.name} ------ ${product.price}</p>
    </c:forEach>
</div>



<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#btnSubmit").click(function () {
            url = "localhost:8080/рroduct?id=1";
            $(location).attr("href", url);
        });
    });
</script>
</body>
</html>
