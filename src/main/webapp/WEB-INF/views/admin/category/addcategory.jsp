<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://www.springframework.org/tags/form" %>
<div class="box-header with-border">
	<h3 class="box-title">Add Category</h3>
</div>
<!-- /.box-header -->
<!-- form start -->
<c:form modelAttribute="category" method="post" action="${pageContext.request.contextPath }/admin/category/addcategory" role="form">
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputName">Name</label>
			<c:input path="name"  type="text"
				class="form-control" id="exampleInputName" placeholder="Enter Name"/>
		</div>
		
		<div class="form-group">
			<label>Tier </label> <c:select path="tier" class="form-control">
				<c:option value="1">Tier 1</c:option>
				<c:option value="2">Tier 2</c:option>
				<c:option value="3">Tier 3</c:option>
				<c:option value="4">Tier 4</c:option>
				<c:option value="5">Tier 5</c:option>
			</c:select>
		</div>
	</div>
	<!-- /.box-body -->

	<div class="box-footer">
		<button type="submit" class="btn btn-primary">Submit</button>
	</div>
</c:form>
