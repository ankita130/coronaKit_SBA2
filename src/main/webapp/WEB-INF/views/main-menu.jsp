<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="spring-form"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Main Menu</title>
<link href="css/common.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="middle">
<div align="right">
<spring-form:form action="${pageContext.request.contextPath}/logout" method="POST">
<input type="submit" value="Logout">
</spring-form:form>
</div>
<h2>Hello <security:authentication property="principal.username"/></h2>
<br>

<h2>Welcome to Corona Kit Dashboard!!!</h2>

<security:authorize access="hasRole('ADMIN')">
	<hr/>
	<a href="${pageContext.request.contextPath}/admin/home">ADMIN DASHBOARD</a>
</security:authorize>

<security:authorize access="hasRole('USER')">
	<hr/>
	<a href="${pageContext.request.contextPath}/user/home">USER DASHBOARD</a>
</security:authorize>

</div>
<div class="footer">
<jsp:include page="footer.jsp"/>
</div>
</body>
</html>