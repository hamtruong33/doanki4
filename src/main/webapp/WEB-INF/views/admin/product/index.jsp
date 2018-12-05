<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<jsp:useBean id="pagedListHolder" scope="request"
	type="org.springframework.beans.support.PagedListHolder" />
<c:url value="/admin/product" var="pagedLink">
	<c:param name="p" value="~" />
</c:url>

<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		Product Tables <small>advanced tables</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/admin/home"><i
				class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/product">Product
				Tables</a></li>
		<li class="active">Product tables</li>
	</ol>
</section>

<!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					  <h3 class="box-title">Data Table With Full Features</h3> 
				</div>
				<br> <!-- <input type="text" placeholder="Search ...." id="keyword" name="keyword"> -->
				<br>
				
				<div class="box-body">
					<tg:paging pagedListHolder="${pagedListHolder}"
						pagedLink="${pagedLink}" />

					<table id="example1" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Price</th>
								<th>Description</th>
								<th>Shop</th>
								<th>Status</th>
								<th>Category</th>

								<th>Discount</th>
								<th>Producer</th>
								<th>Option</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="product" items="${pagedListHolder.pageList }">
								<tr>
									<td>${product.id }</td>
									<td>${product.name }</td>
									<td>${product.price }</td>
									<td>${product.description }</td>
									<td>${product.shop.name }</td>
									<td>${product.status }</td>
									<td>${product.category.name }</td>

									<td>${product.discount }</td>
									<td>${product.producer.name }</td>
									<th><a
										href="${pageContext.request.contextPath }/admin/product/edit/${product.id}">Edit</a>|<a
										href="${pageContext.request.contextPath }/admin/product/delete/${product.id}"
										onclick="return confirm('Are you sure?')">Delete</a></th>
								</tr>
							</c:forEach>

						</tbody>
						<tfoot>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Price</th>
								<th>Description</th>
								<th>Shop Id</th>
								<th>Status</th>
								<th>Category Id</th>

								<th>Discount</th>
								<th>Producer Id</th>
								<th>Option</th>
							</tr>
						</tfoot>
					</table>
					<tg:paging pagedListHolder="${pagedListHolder}"
						pagedLink="${pagedLink}" />
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</section>
