<%-- 
    Document   : home
    Created on : Oct 4, 2019, 4:05:26 PM
    Author     : AMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.user == null}">
    <c:redirect url="/login.jsp" />
</c:if>
<c:import url="components/nav.jsp">
    <c:param name="headTitle" value="Home" />
</c:import>
<header class="jumbotron my-4">
    <c:choose>
        <c:when test="${session.isNew()}">
            <h1>Welcome to the webmail</h1>
        </c:when>
        <c:otherwise>
            <h1>Welcome back!</h1>
        </c:otherwise>
    </c:choose>
    <c:if test="${sessionScope.mailNotify != null}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <c:out value="${sessionScope.mailNotify}" />
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>
    <a href="/PRJ321x-A5/compose.jsp" class="btn btn-primary">Compose</a>
</header>
<c:set scope="session" var="mailNotify" value="${null}" />
<c:import url="components/footer.jsp" />