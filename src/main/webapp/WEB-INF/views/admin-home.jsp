<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
  <h1 style='text-align: center;font-size: 20px; font-weight: 600; text-transform: uppercase;display:inline-block;margin: 40px 8px 10px 8px;color: #ffffff;'>Welcome to Admin Dashboard</h1>
  <div><a href="${pageContext.request.contextPath}/admin/product-entry"  style='color: #ffffff;'>Add Item</a></div>
  <div><a href="${pageContext.request.contextPath}/admin/product-list"  style='color: #ffffff;'>Show Available Items</a></div>
</div>

<div class="footer">
<jsp:include page="footer.jsp"/>
</div>
	
</body>
</body>
</html>