<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org">
  <head>
    <title>Spitter</title>
    <link rel="stylesheet" 
          type="text/css" 
          th:href="@{/resources/style.css}" ></link>
  </head>
  <body>
    <div id="header" th:include="page :: header"></div>
  
    <div id="content">
      <div class="spittleForm">
        <h1>Spit it out...</h1>
        <form method="POST" name="spittleForm">
          <input type="hidden" name="latitude" />
          <input type="hidden" name="longitude" />
          <textarea name="message" cols="80" rows="5"></textarea><br/>
          
          <input type="hidden" 
                 th:name="${_csrf.parameterName}"
                 th:value="${_csrf.token}" />
          
          <input type="submit" value="Add" />
        </form>
      </div>
      <div class="listTitle">
        <h1>Recent Spittles</h1>
        <ul class="spittleList">
          <li th:each="spittle : ${spittleList}" 
              th:id="'spittle_' + ${spittle.id}">
            <div class="spittleMessage" th:text="${spittle.message}">Spittle message</div>
            <div>
              <span class="spittleTime" th:text="${spittle.time}">spittle timestamp</span>
              <span class="spittleLocation" th:text="'{' + ${spittle.latitude} + ', ' + ${spittle.longitude} + ')'">lat, long</span>
            </div>
          </li>
        </ul>
      </div>
    </div>
    
    <div id="footer" th:include="page :: copy"></div>
  </body>
</html>