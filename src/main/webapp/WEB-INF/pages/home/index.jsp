<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="../blocks/header.jsp"/>
<body>
<jsp:include page="../common/header.jsp"/>
<c:import url="../common/navigation.jsp"/>
<%--<div class="nav-bar">--%>
    <%--<label>Product Id</label>--%>
    <%--<input id="productId" type="text"/>--%>
    <%--<input type="submit" value="Search"/>--%>
<%--</div>--%>


<%--<div class="sidebar">--%>
    <%--<jsp:include page="../blocks/sidebar.jsp">--%>
        <%--<jsp:param name="categories" value="${categories}"/>--%>
    <%--</jsp:include>--%>

<%--</div>--%>


<%--<div class="listing">--%>
    <%--<c:forEach items="${products}" var="product">--%>
        <%--<p>${product.name} ------ ${product.price}</p>--%>
    <%--</c:forEach>--%>
<%--</div>--%>



<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#btnSubmit").click(function () {
            url = "localhost:8080/рroduct?id=1";
            $(location).attr("href", url);
        });
    });
</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>
