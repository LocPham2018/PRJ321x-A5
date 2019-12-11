<%-- 
    Document   : nav
    Created on : Oct 4, 2019, 4:38:47 PM
    Author     : AMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>${param.headTitle} - PRJ321x-A5</title>

        <!-- Bootstrap core CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </head>

    <body style="padding-top: 56px">

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#">PRJ321x-A5</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <c:choose>
                            <c:when test="${sessionScope.user == null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="/PRJ321x-A5/login.jsp">Log in</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/PRJ321x-A5/signup.jsp">Sign up</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="nav-item">
                                    <a class="nav-link" href="/PRJ321x-A5/home.jsp">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/PRJ321x-A5/compose.jsp">New Mail</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/PRJ321x-A5/logoutProcess">Logout</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Page Content -->
        <div class="container">
            
            
