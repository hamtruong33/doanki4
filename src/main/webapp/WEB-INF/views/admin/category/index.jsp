<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		Category Tables <small>advanced tables</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/admin/home"><i
				class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/category">Category
				Tables</a></li>
		<li class="active">Category tables</li>
	</ol>
</section>

<!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<!--  <h3 class="box-title">Data Table With Full Features</h3> -->
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<table id="example1" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Tier</th>
								<th>Option</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pagedListHolder.pageList}" var="item">
								<tr>
									<td>${item.id }</td>
									<td>${item.name }</td>
									<td>${item.tier}</td>
									<th><a href="${pageContext.request.contextPath }/admin/category/edit/${item.id }">Edit</a>|<a href="${pageContext.request.contextPath }/admin/category/delete/${item.id }">Delete</a></th>
								</tr>
							</c:forEach>
						</tbody>
						<!--                 <tfoot> -->
						<!--                 <tr> -->
						<!--                   <th>ID</th> -->
						<!--                   <th>Name</th> -->
						<!--                   <th>Tier</th> -->
						<!--                   <th>Option</th> -->
						<!--                 </tr> -->
						<!--                 </tfoot> -->
					</table>
					<jsp:useBean id="pagedListHolder" scope="request"
						type="org.springframework.beans.support.PagedListHolder" />
					<c:url value="/admin/category" var="pagedLink">
						<c:param name="p" value="~" />
					</c:url>

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