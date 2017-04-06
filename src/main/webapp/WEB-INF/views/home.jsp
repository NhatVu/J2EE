<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Spitter</title>
    <link rel="stylesheet" 
          type="text/css" 
          href="<spring:url value="/resources/style.css"/>">
  </head>
  <body>
    <sec:authorize access="isAuthenticated()">
    <div>
      Hello there...<span sec:authentication="name">user-name</span>
    </div>
    </sec:authorize>
  
  
  
    <div id="content">
      <h1>Welcome to Spitteranb</h1>
  
      <a href="<spring:url value="/spittles"/>">Spittles</a>
      <br/>
      
      View: <span text="${view}">unknown</span>
    </div>
    <div>
    	<a href="<spring:url value="/logout"/>">Logout</a>
    </div>
  </body>
</html>
