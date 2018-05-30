
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul>
    <c:forEach items="${categoriessub}" var="category">
        <li>
            <a href="/category/${category.id}/1">${category.name}</a>
            <%--<c:if test="${category.subcategories.size()>0}">--%>
                <%--${category.subcategories.size()}--%>
                <%----%>
            <%--</c:if>--%>
        </li>
    </c:forEach>
</ul>

