<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Spitter</title>
    <link rel="stylesheet" 
          type="text/css" 
          href="<spring:url value="/resources/style.css"/>"></link>
  </head>
  <body>

    <div id="content">
      <h1>Your Profile</h1>
      <span>username: ${spitter.username}</span><br/>
      <span>Fullname: ${spitter.fullName}</span><br/>
      <span>email: ${spitter.email}</span>
    </div>

  </body>
</html>
