<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../includes/header.jsp" %>
		<div class="container mt-5">
			<form action="productInsert.do" method="post" id="form" name="form" enctype="multipart/form-data">
				<h3>상품 등록</h3>
				<br>
				<div class="row mb-3">
					<div class="col">
						<label for="name">Name: </label>
						<input type="text" class="form-control" id="name" name="name" placeholder="Enter Name">
					</div>
				</div>
				<div class="mb-3">
					<label for="unitPrice">Price: </label><br>
					<input type="text" class="form-control" id="unitPrice" name="unitPrice" placeholder="Enter Price">
				</div>
				<div class="mb-3">
					<label for="description">Description: </label>
					<input type="text" class="form-control" id="description" name="description" placeholder="Enter Description">
				</div>
				<div class="mb-3">
					<label for="ofile">File: </label>
					<input type="file" class="form-control" id="ofile" name="ofile">
				</div>
				<br>
				<div class="mt-3">
					<button type="submit" class="btn btn-primary">상품 등록</button>				
				</div>
			</form>
		</div>
	</body>
</html>