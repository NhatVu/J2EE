<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%-- <%@ page session="false" %> --%>

<!DOCTYPE html>
<html>
  <head>
    <title>Spitter</title>
    <link rel="stylesheet" type="text/css" 
          href="<spring:url value="/resources/style.css" />"></link>
  </head>
  <body>

    <div id="content">
      <h1>Register</h1>
  
      <form method="POST"  action="<spring:url value="/spitter/register" />">
     
  
        <label>Full Name</label>: 
          <input type="text" name="fullName" /><br/>
  
        <label>Email</label>: 
          <input type="text" name="email"  /><br/>
  
        <label>Username</label>: 
          <input type="text" name="username" /><br/>
  
        <label>Password</label>: 
          <input type="password" name="password"  /><br/>
          <input type="hidden"
						name="${_csrf.parameterName}" value="${_csrf.token}" />
        <input type="submit" value="Register" />
      
      
      </form>
    </div>
  </body>
</html>
