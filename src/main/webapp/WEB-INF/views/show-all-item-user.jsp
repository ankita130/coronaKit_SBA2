<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="core"%> 
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Product to Users</title>
<style type="text/css">
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
<div class="middle" style='color: #ffffff;'>
<div align="right">
<spring:form action="${pageContext.request.contextPath}/logout" method="POST">
<input type="submit" value="Logout">
</spring:form>
</div>
<a href="${pageContext.request.contextPath}/user/show-kit"><button>Show Kit</button></a>
<h1 >Available Items</h1>

<br>
<div>
<table border="1" width="100%" >

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
				<td><a href="${pageContext.request.contextPath}/user/add-to-cart/${product.id} ">Add to Cart</a></td> 
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