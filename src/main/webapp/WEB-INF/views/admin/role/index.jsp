<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		Role Tables <small>advanced tables</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/admin/home"><i class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/role">Role Tables</a></li>
		<li class="active">Role tables</li>
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
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>Supper Admin</td>
							</tr>
							<tr>
								<td>2</td>
								<td>Admin</td>
							</tr>
							<tr>
								<td>3</td>
								<td>Employee</td>
							</tr>
							<tr>
								<td>4</td>
								<td>Shipper</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<th>ID</th>
								<th>Name</th>
							</tr>
						</tfoot>
					</table>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</section>