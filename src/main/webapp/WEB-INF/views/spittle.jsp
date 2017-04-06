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
          th:href="@{/resources/style.css}"></link>
  </head>
  <body>
    <div id="header" th:include="page :: header"></div>
  
    <div id="content">
      <div class="spittleView">
        <div class="spittleMessage" th:text="#{spittle.message}">Spittle message</div>
        <div>
          <span class="spittleTime" th:text="#{spittle.time}">spittle timestamp</span>
        </div>
      </div>
    </div>
    <div id="footer" th:include="page :: copy"></div>
    
  </body>
</html>