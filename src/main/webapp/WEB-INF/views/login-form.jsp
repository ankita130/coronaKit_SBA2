<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring-form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/login.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">


</head>
<body>
<jsp:include page="header.jsp"/>
<hr/>
<div class="middle">
<div class="wrapper fadeIn">
  <div id="formContent">

    <spring-form:form action="${pageContext.request.contextPath}/validate" method="POST">
	
	<input type="text" name="username" placeholder="username"/>
	<br>
	<input type="password" name="password" placeholder="password"/>
	<br/>
	<core:if test="${param.error != null}">
	<i>Invalid Credentials!!!</i>
    </core:if>
	<br/>
	<input type="submit" value="Log In" />
    </spring-form:form>    

  </div>
</div>

<core:if test="${param.logout != null}">
   <i>You have been logged out successfully!!!</i>
    </core:if>
</div>

<div class="footer">
<jsp:include page="footer.jsp"/>
</div>

</body>
</html>