<%--
  Created by IntelliJ IDEA.
  User: Vigen
  Date: 5/31/2018
  Time: 9:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="custom-menu">
    <div class="row">

        <c:forEach var="slevel" items="${second_level}">

            <div class="col-md-4">
                <ul class="list-links">
                    <li>
                        <h3 class="list-links-title"><a href="/category/${slevel.id}/1">${slevel.name}</a></h3>
                    </li>
                    <c:forEach var="thlevel" items="${slevel.subcategories}">
                        <li>
                            <a href="/category/${thlevel.id}/1">${thlevel.name}</a>
                        </li>
                    </c:forEach>

                </ul>
                <hr>
                <hr class="hidden-md hidden-lg">
            </div>
        </c:forEach>


    </div>
</div>
