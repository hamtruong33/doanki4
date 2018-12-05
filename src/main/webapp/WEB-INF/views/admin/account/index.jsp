<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		Account Tables <small>advanced tables</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/admin/home"><i
				class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/account">Account
				Tables</a></li>
		<li class="active">Account tables</li>
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
								<th>User Name</th>
								<th>Full Name</th>
								<th>Role</th>
								<th>Email</th>
								<th>Address</th>
								<th>phone</th>
								<th>photo</th>
								<th>Option</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pagedListHolder.pageList}" var="item">
								<tr>
									<td>${item.id }</td>
									<td>${item.username }</td>
									<td>${item.fullName}</td>
									<c:forEach var="role" items="${item.roleforusers}">
										<td>${role.name}</td>
									</c:forEach>
									<td>${item.email}</td>
									<td>${item.address}</td>
									<td>${item.phone}</td>
									<td>${user.photo}<img height="150" width="150" alt=""
										src="${pageContext.request.contextPath }/resources/images/user/${item.photo}">
									</td>
									<td><button type="button" class="btn btn-default"
											data-toggle="modal" data-target="#modal-default">
											Edit</button>|
<%-- <a onclick="return confirm('Are you sure?')"
										href="${pageContext.request.contextPath }/admin/account/delete/${item.id }" >Delete</a> --%>
										<div class="modal fade" id="modal-default">
											<div class="modal-dialog">
												<div class="modal-content">
												<form method="post" action="${pageContext.request.contextPath }/admin/account/disable/${item.id }">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
														<h4 class="modal-title">Edit Account</h4>
													</div>
													<div class="modal-body">
														Status<input type="checkbox"  name="status">
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default pull-left"
															data-dismiss="modal">Close</button>
														<button type="submit" class="btn btn-primary" >Save
															changes</button>
													</div>
												</form>
												</div>
												<!-- /.modal-content -->
											</div>
											<!-- /.modal-dialog -->
										</div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<jsp:useBean id="pagedListHolder" scope="request"
						type="org.springframework.beans.support.PagedListHolder" />
					<c:url value="/admin/account" var="pagedLink">
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
