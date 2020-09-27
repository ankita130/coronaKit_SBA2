<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="core"%> 
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Order Summary</title>
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
<h2 >Order Summary</h2>
<div>
<table border="1" width="100% "> 
<thead>
	    <th >Delivery Address</th>
        <th>Date of Order</th>
	</thead>
    
    <tr>
        <tbody>
		<tr>
		        <core>
		        <td >${coronaKit.deliveryAddress}</td> 
				<td >${coronaKit.orderDate}</td>
				</core>
		</tr>
		</tbody>
    </tr>
    
</table>

<table border="1" width="100%" style='color: #ffffff;'>

    <thead>
	    <th >Product Name</th>
        <th>Product Description</th>
        <th>Quantity</th>
        <th>Price</th>
	</thead>
    
    <tr>
        <tbody>
		<core:forEach var="kit" items="${finalKitDetails}">
			<tr>
				<td>${kit.productName}</td> 
				<td>${kit.productDescription}</td> 
				<td>${kit.quantity}</td> 
				<td>${kit.amount}</td> 
			</tr>
		</core:forEach>	
		<core>
		<tr>
				<td></td> 
				<td></td> 
				<td>Total Order Amount</td> 
				<td>${coronaKit.totalAmount}</td> 
			</tr>
		</core>
		</tbody>
  
    
</table>

</div>
<div><a href="${pageContext.request.contextPath}/user/show-list" style='color: #cccccc;'>Show All Items</a></div>
</div>
<div class="footer">
<jsp:include page="footer.jsp"/>
</div>
</body>
</html>