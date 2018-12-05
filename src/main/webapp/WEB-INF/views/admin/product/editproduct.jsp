<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<div class="box-header with-border">
	<h3 class="box-title">Edit Product</h3>
</div>
<!-- /.box-header -->
<!-- form start -->
<s:form role="form" modelAttribute="product" method="post"
	action="${pageContext.request.contextPath }/admin/product/editsave"
	enctype="multipart/form-data">>
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputName">Name</label>
			<s:input path="name" type="text" class="form-control"
				id="exampleInputName" />
			<s:errors path="name"></s:errors>
		</div>
		<div class="form-group">
			<label for="exampleInputPrice">Price</label>
			<s:input type="number" path="price" class="form-control"
				id="exampleInputPrice" />
			<s:errors path="price"></s:errors>
		</div>
		<div class="form-group">
			<label for="exampleInputPrice">Quantity</label>
			<s:input type="number" path="quantity" class="form-control"
				id="exampleInputPrice" />
			<s:errors path="quantity"></s:errors>
		</div>
		<!-- <div class="form-group">
			<label for="exampleInputImages">Choose Images </label> 
			<input type="file" id="exampleInputImages" name="file" multiple="multiple" accept="image/*">
		</div> -->
		<div class="timeline-item">
			<label for="exampleInputPrice"><a href="${pageContext.request.contextPath }/admin/product/editphoto/${product.id}">Edit Images</a></label>

			<div class="timeline-body">
			<c:forEach var="photo" items="${photos }">
				<img src="${pageContext.request.contextPath }/resources/images/${photo.name}"  alt="..." height="150" width="100" class="margin">
			</c:forEach>
			</div>
		</div>
		<div class="form-group">
			<label>Description</label>
			<s:textarea path="description" class="form-control" rows="5"
				placeholder="Enter ..."></s:textarea>
		</div>
		<div class="form-group">
			<label>Status</label>
			<s:checkbox class="checkbox" path="status" />
		</div>
		<div class="form-group">
			<label>Category </label>
			<s:select class="form-control" path="category" items="${categories}"
				itemLabel="name" itemValue="id"></s:select>




		</div>
		<div class="form-group">
			<label>Producer </label>
			<s:select class="form-control" path="producer" items="${producers}"
				itemLabel="name" itemValue="id"></s:select>

		</div>
		<div class="form-group">
			<label>Shop </label>
			<s:select class="form-control" path="shop" items="${shops}"
				itemLabel="name" itemValue="id"></s:select>

		</div>
	</div>
	<!-- /.box-body -->

	<div class="box-footer">
		<s:button type="submit" class="btn btn-primary" onclick="return confirm('Are you sure?')">Submit</s:button>
	</div>
</s:form>
