<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
      background-color: #f8f9fa;
    }
    .container {
      margin-top: 50px;
      background-color: #ffffff;
      border-radius: 10px;
      box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.1);
      padding: 30px;
    }
    .btn-add-product {
      display: block;
      margin: 0 auto;
    }
  </style>

</head>
<body>
  <div class="container col-md-6">
  <h2 style="text-align: center; margin-bottom: 20px; color: #007bff; font-family: Arial, sans-serif; font-weight: bold;">Edit Product</h2>
    <form action="${pageContext.request.contextPath }/handle-product" method="post">
    <input type="text" value="${product.id }" name="id"/>
      <div class="form-group">
        <label for="productName">Name:</label>
        <input type="text"
         class="form-control" 
         id="productName"
         name="name" 
         value="${product.getName()}"
         placeholder="Enter product name">
      </div>
      
      <div class="form-group">
        <label for="productDescription">Description:</label>
        <input class="form-control" 
        id="productDescription" 
        type="text" 
        name="description"
        value="${product.getDescription()}"
        placeholder="Enter product description">
      </div>

      <div class="form-group">
        <label for="productPrice">Price:</label>
        <input type="number" 
        class="form-control"
         id="productPrice" 
         name="price"
         value="${product.getPrice()}"
         placeholder="Enter product price">
      </div>
      
       <button type="submit" class="btn btn-primary btn-add-product">Update Product</button>
       <a href="" class="btn btn-danger">Back</a>
       
    </form>
  </div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>