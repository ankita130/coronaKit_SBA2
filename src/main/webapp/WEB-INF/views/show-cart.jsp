<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="core"%> 
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Cart</title>
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
<div class="middle" style='color: #ffffff;'>
<div align="right">
<spring:form action="${pageContext.request.contextPath}/logout" method="POST">
<input type="submit" value="Logout">
</spring:form>
</div>
<br>
<a href="${pageContext.request.contextPath}/user/show-list"><button>Continue Shopping</button></a>
<br>
<h1>Cart</h1>

<div>

<table border="1" width="100%">

    <thead>
	    <th>Product Id</th>
        <th>Product Name</th>
        <th>Product Description</th>
        <th>Order Quantity</th>
        <th>Price</th>
        <th>Action</th>
	</thead>
    
    <tr>
        <tbody>
		<core:forEach var="kit" items="${kitDetails}">
			<tr>
				<td>${kit.productId}</td> 
				<td>${kit.productName}</td> 
				<td>${kit.productDescription}</td> 
				<td>${kit.quantity}</td> 
				<td>${kit.amount}</td> 
				<td><a href="${pageContext.request.contextPath}/user/delete/${kit.productId}">Remove</a></td> 
			</tr>
		</core:forEach>	
		</tbody>
    
    
</table>
<core:if test="${kitDetails.size()>0}">
 <a href="${pageContext.request.contextPath}/user/checkout"><button>Proceed to Checkout</button></a>  
</core:if>
</div>
</div>
<div class="footer">
<jsp:include page="footer.jsp"/>
</div>
</body>
</html>