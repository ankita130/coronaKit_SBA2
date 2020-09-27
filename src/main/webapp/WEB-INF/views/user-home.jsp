<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home</title>
<style>
.middle{
 font-size: 18px;
  width: 100%;
  height: 80%;
  height: 80vh;
  background-image:   url("//static.healthcare.siemens.com/siemens_hwem-hwem_ssxa_websites-context-root/wcm/idc/groups/public/@global/documents/image/mda5/njmz/~edisp/siemens-healthineers_press_confirmatory-test-kit-for-covid-19-07111353/~renditions/siemens-healthineers_press_confirmatory-test-kit-for-covid-19-07111353~8.jpg");

}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="middle">
<div align="right">
<spring:form action="${pageContext.request.contextPath}/logout" method="POST">
<input type="submit" value="Logout">
</spring:form>
</div>
  <h1 style='color: #ffffff;'>Welcome to User Dashboard</h1>

  <div>
   <div><a href="${pageContext.request.contextPath}/user/show-list" style='color: #ffffff;'>Show All Items</a></div>
   <div><a href="${pageContext.request.contextPath}/user/show-kit" style='color: #ffffff;'>Go to Cart</a></div>
  </div>
</div>
<div class="footer">
<jsp:include page="footer.jsp"/>
</div>
</body>
</html>