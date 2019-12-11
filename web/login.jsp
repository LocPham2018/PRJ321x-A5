<%-- 
    Document   : login
    Created on : Oct 4, 2019, 4:04:35 PM
    Author     : AMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.user != null}">
    <c:redirect url="/home.jsp" />
</c:if>
<c:import url="components/nav.jsp">
    <c:param name="headTitle" value="Log In" />
</c:import>
<div class="row my-3">
    <div class="col-lg-6 py-3">
        <h1>Welcome to PRJ321x-A5!</h1>
        <p>
            A simple webmail.<br />
            Create an account and login to the webmail, then you can send mail from any existing Google account!
        </p>
    </div>
    <div class="col-lg-6 py-3 bg-light">
        <h2>Log in</h2>
        <form action="/PRJ321x-A5/loginProcess" method="post">
            <p class="mb-0 mt-3">Username:</p>
            <input type="text" name="username" class="w-100" />
            <p class="mb-0 mt-3">Password:</p>
            <input type="password" name="password" class="w-100" />
            <p class="text-danger"><c:out value="${sessionScope.loginMessage}" /></p>
            <input type="submit" value="Log in" class="btn btn-primary" />
        </form>
    </div>
</div>
<c:set scope="session" var="loginMessage" value="${null}" />
<c:import url="components/footer.jsp" />