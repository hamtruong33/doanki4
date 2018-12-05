<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
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
								<th>Phone</th>
								<th>Photo</th>

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

									<td><!-- <button type="button" class="btn btn-default"
											data-toggle="modal" data-target="#modal-default">
											Edit</button> -->| <a onclick="return confirm('Are you sure?')"
										href="${pageContext.request.contextPath }/admin/account/delete/${item.id }">Delete</a>
										<%-- <div class="modal fade" id="modal-default">
											<div class="modal-dialog">
												<div class="modal-content">
													<form method="post"
														action="${pageContext.request.contextPath }/admin/account/edit/${item.id }">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h4 class="modal-title">Edit Account</h4>
														</div>
														<div class="modal-body">
															<c:if test="${item.status= true }">Status<input type="checkbox" checked="checked" name="status"></c:if>
															<c:if test="${item.status= false }">Status<input type="checkbox"  name="status"></c:if>
															<br>
															
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default pull-left"
																data-dismiss="modal">Close</button>
															<button type="submit" class="btn btn-primary">Save
																changes</button>
														</div>
													</form>
												</div>
												<!-- /.modal-content -->
											</div>
											<!-- /.modal-dialog -->
										</div> --%>
										</td>
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
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var string1 = GetParameterValues('msg');
						var string2 = "delete";
						if (string1.toLowerCase() === string2.toLowerCase()) {
							alert("This account having orders ,so you can't delete it");
						}
						function GetParameterValues(param) {
							var url = window.location.href.slice(
									window.location.href.indexOf('?') + 1)
									.split('&');
							for (var i = 0; i < url.length; i++) {
								var urlparam = url[i].split('=');
								if (urlparam[0] == param) {
									return urlparam[1];
								}
							}
						}
					});

	
</script>