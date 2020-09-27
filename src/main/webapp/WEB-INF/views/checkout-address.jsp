<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout Page</title>
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
<h1 style='color: #ffffff;'>Checking Out</h1>
<div align="right">
<spring:form action="${pageContext.request.contextPath}/logout" method="POST">
<input type="submit" value="Logout">
</spring:form>
</div>
<br>
<div>
<div align="right"><a href="${pageContext.request.contextPath}/user/show-kit"><button>Go to Cart</button></a></div>
<br>
<br>

<table border="1" width="100%" style='color: #ffffff;'>

    <thead>
        <th>Product Name</th>
        <th>Product Description</th>
        <th>Quantity</th>
        <th>Product Price</th>
	</thead>
    
    <tr>
        <tbody>
		<core:forEach var="kit" items="${kitDetails}">
			<tr>
				<td>${kit.productName}</td> 
				<td>${kit.productDescription}</td> 
				<td>${kit.quantity}</td> 
				<td>${kit.amount}</td> 
			</tr>
		</core:forEach>			
		</tbody>
       
</table>
</div>
<h3 style='color: #ffffff;'>Enter your details for order processing</h3>
<spring:form action="${pageContext.request.contextPath}/user/finalize" method="post" modelAttribute="coronaKit" style='color: #ffffff;'>
      <div>
        <div><spring:label path="deliveryAddress" >Enter Delivery Address</spring:label></div>
        <div>
          <spring:input path="deliveryAddress"/>
          <spring:errors path="deliveryAddress" style='color: #FF0000;'/>
        </div>     
            
      </div>
      <br>      
      <div>
         <div><input type="submit" value="Confirm Order"/></div>
      </div>
    </spring:form>
</div>
<div class="footer">
<jsp:include page="footer.jsp"/>
</div>
</body>
</html>