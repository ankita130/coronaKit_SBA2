<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Item to Inventory</title>

<style type="text/css">
.middle 
{
 font-size: 18px;
  width: 100%;
  height: 80%;
  height: 80vh;
  background-image:   url("//static.healthcare.siemens.com/siemens_hwem-hwem_ssxa_websites-context-root/wcm/idc/groups/public/@global/documents/image/mda5/njmz/~edisp/siemens-healthineers_press_confirmatory-test-kit-for-covid-19-07111353/~renditions/siemens-healthineers_press_confirmatory-test-kit-for-covid-19-07111353~8.jpg");

}
h2 {
  text-align: center;
  font-size: 20px;
  font-weight: 600;
  text-transform: uppercase;
  display:inline-block;
  margin: 40px 8px 10px 8px; 
  color: #ffffff;
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
<div align="right">
    <a href="${pageContext.request.contextPath}/admin/product-list" class="fixed1" ><input type="button" value="Show Available Items"/></a>
</div>

<div align="right">
   <a href="${pageContext.request.contextPath}/admin/home" class="fixed2"><input type="button" value="Admin Dashboard" />
   </a>
</div>
<h2>Add New Product to Inventory</h2>

<h4 style='text-align: left;  font-size: 15px; font-weight: 600; text-transform: uppercase;margin: 40px 8px 10px 8px; color: #ffffff;'>Please enter product details</h4>

<spring:form action="${pageContext.request.contextPath}/admin/product-save" method="post" modelAttribute="productMaster" style='color: #ffffff;'>
      <div>
        <div ><spring:label path="productName">Enter Product Name</spring:label></div>
        <div>
          <spring:input path="productName"/>
          <spring:errors path="productName" style='color: #FF0000;'/>
         </div>        
      </div>
      <br>
      <div>
        <div ><spring:label path="productDescription">Enter Product Description</spring:label></div>
        <div>
           <spring:input path="productDescription"/>
           <spring:errors path="productDescription" style='color: #FF0000;'/>
        </div>        
      </div>
      <br>
      <div>
        <div><spring:label path="cost">Enter Product Price</spring:label></div>
        <div>
           <spring:input path="cost"/>
           <spring:errors path="cost" style='color: #FF0000;'/>
        </div>        
      </div>
      <br>
      <div>
         <div><input type="submit" value="Save Product"/></div>
      </div>
    </spring:form>
</div>   

<div class="footer">
<jsp:include page="footer.jsp"/>
</div>
</body>
</html>