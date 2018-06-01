<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .nav-bar {
            width: 100%;
        }

        .sidebar {
            width: 30%;
            float: left;
        }

        .listing {
            width: 70%;
            float: left;
        }
    </style>
</head>
<body>
<div class="nav-bar">
    <label>Product Id</label>
    <input id="searchTextBox" type="text"/>
    <input id="searchButton" type="button" value="Search" onclick="buttonSearchClick()"/>
</div>


<div class="sidebar">
    <jsp:include page="blocks/sidebar.jsp">
        <jsp:param name="categories" value="${categories}"/>
    </jsp:include>

</div>


<div class="listing">
    <c:forEach items="${products}" var="product">
        <p>--------------------</p>
        <p>ID</p>
        <p>${product.id}</p>
        <p>Name</p>
        <p>${product.name}</p>
        <p>Price</p>
        <p>${product.price}</p>
        <p>--------------------</p>
    </c:forEach>
</div>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script language="JavaScript">
    function buttonSearchClick() {
        var searchParam = document.getElementById("searchTextBox").value;
        window.location.href = "http://localhost:8080/?search=" + searchParam;
    }
</script>
</body>
</html>
