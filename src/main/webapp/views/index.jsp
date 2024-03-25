<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Products</title>
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
    .table {
      border-radius: 10px;
      overflow: hidden;
    }
    .table thead th {
      background-color: #007bff;
      color: #ffffff;
      border-color: #007bff;
    }
    .table tbody tr:nth-child(even) {
      background-color: #f2f2f2;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2 class="text-center mt-5 mb-4">View Products</h2>
    <table class="table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Description</th>
          <th>Price</th>
          <th>Edit</th>
          <th>Delete</th>
        </tr>
      </thead>
      <tbody>
      		<c:forEach items="${product}" var="p">
        <tr>
          <td>${p.id}</td>
          <td>${p.name}</td>
          <td>${p.description}</td>
          <td class="font-weight-bold">${p.price}</td>
          <td>
          <form >
                <input type="hidden" name="productId">
                <a href="<c:url value='/update-product/${p.id}'/>" class="btn btn-warning">Edit</a>
          </form>
          </td>
          <td>
          <form action="delete-product" method="post">
                <input type="hidden" name="productId" value="${p.id}">
                <button type="submit" class="btn btn-danger">Delete</button>
          </form>
          </td>   
        </tr>
        </c:forEach>
      </tbody>
    </table>
    
    <div class="text-center">
    	<a href="add-product" class="btn btn-success">Add Product</a>
    </div>
  </div>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
    