<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="core"%> 
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Product to Admin</title>
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

<h1 style='text-align: center;font-size: 20px; font-weight: 600; text-transform: uppercase;display:inline-block;margin: 40px 8px 10px 8px;color: #cccccc;'>Available Items</h1>
<div align="right">
<spring:form action="${pageContext.request.contextPath}/logout" method="POST">
<input type="submit" value="Logout">
</spring:form>
</div>
<div><div><a href="${pageContext.request.contextPath}/admin/product-entry"  style='color: #ffffff;'>Go to Add Item</a></div></div>
<br>
<div><div><a href="${pageContext.request.contextPath}/admin/home" style='color: #ffffff;'>ADMIN DASHBOARD</a></div></div>

<div>
<table border="1" width="100%" style='color: #ffffff;'>

    <thead>
	    <th>Product Name</th>
        <th>Product Description</th>
        <th>Product Price</th>
        <th>Action</th>
	</thead>
    
    
        <tbody>
		<core:forEach var="product" items="${availableProducts}">
			<tr>
				<td>${product.productName}</td> 
				<td>${product.productDescription}</td> 
				<td>${product.cost}</td> 
				<td ><a href="${pageContext.request.contextPath}/admin/product-delete/${product.id} ">Delete</a></td> 
			</tr>
		</core:forEach>	
		</tbody>
 
    
</table>

</div>
</div>
<div class="footer">
<jsp:include page="footer.jsp"/>
</div>
</body>
</html>