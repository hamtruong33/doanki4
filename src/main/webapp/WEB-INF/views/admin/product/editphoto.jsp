<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content-header">
	<%-- <h1>
		Product Tables <small>advanced tables</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/admin/home"><i
				class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/product">Product
				Tables</a></li>
		<li class="active">Product tables</li>
	</ol> --%>
</section>

<!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Photo For ${product.name }</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">

					<table id="example1" class="table table-bordered table-striped">
						<thead>
							<tr>

								<th>Image</th>

								<th>Option</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="photo" items="${photos }">
								<tr>

									<td><img
										src="${pageContext.request.contextPath }/resources/images/${photo.name}"
										alt="..." height="150" width="100" class="margin"></td>

									<th><a
										href="${pageContext.request.contextPath }/admin/product/deletephoto/${photo.id}/${photo.product.id}"
										onclick="return confirm('Are you sure?')">Delete</a></th>
								</tr>
							</c:forEach>

						</tbody>
						<tfoot>
							<tr>

								<th>Image</th>

								<th>Option</th>
							</tr>
						</tfoot>
					</table>
					<form
						action="${pageContext.request.contextPath }/admin/product/savephoto/${product.id}"
						method="post" enctype="multipart/form-data">
						<div class="form-group">
							<label for="exampleInputImages">Add New Photo </label> <input
								style="padding: 10px;" type="file" id="files" name="file"
								multiple="multiple" accept="image/*">
							<div id="selectedFiles"></div>

						</div>
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</form>
					<script>
						var selDiv = "";

						document.addEventListener("DOMContentLoaded", init,
								false);

						function init() {
							
							document.querySelector('#files').addEventListener(
									'change', handleFileSelect, false);
							selDiv = document.querySelector("#selectedFiles");
						}

						function handleFileSelect(e) {
							
							 if (!e.target.files || !window.FileReader)
								return;

							selDiv.innerHTML = "";

							var files = e.target.files;
							var filesArr = Array.prototype.slice.call(files);
							filesArr.forEach(function(f) {
										
										
										if (!f.type.match("image.*")) {
										
											return;
										}

										var reader = new FileReader();
										reader.onload = function(e) {
											
											var html = "<img src=\"" + e.target.result + "\">"
													/* + f.name
													+ "<br clear=\"left\"/>" */;
											selDiv.innerHTML += html;
										}
										reader.readAsDataURL(f);
									});

						}
					</script>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</section>