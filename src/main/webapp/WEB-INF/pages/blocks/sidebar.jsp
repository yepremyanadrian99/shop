<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="categories listing">
    <jsp:include page="categories/category_vertical.jsp">
        <jsp:param name="categories" value="${categories}"/>
    </jsp:include>
</div>
