<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../includes/header.jsp" %>
		
			<div class="container mt-5">
				<h2>Product List</h2>
				<div class="row" >
					<c:forEach items="${ pList }" var="item">
						<div class="card col-4 mt-3" style="width:400px;">
							<img class="card-img-top" src="../Uploads/${ item.sfile }" alt="${ item.sfile }">
							<div class="card-body">
								<h4 class="card-title">${ item.name }</h4>
								<p class="card-text">${ item.description }</p>
								<a href="#" class="btn btn-primary">상세보기</a>
							</div>
						</div>
					</c:forEach>		
				</div>
			</div>
		