<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags/form"%>
<div class="box-header with-border">
	<h3 class="box-title">Add Account</h3>
</div>
<!-- /.box-header -->
<!-- form start -->
	<h3>${msg}</h3>
<c:form modelAttribute="account" method="post" action="${pageContext.request.contextPath }/admin/account/add" role="form">
	<div class="box-body">
	
		<div class="form-group">
			<label for="exampleInputName">username</label>
			<c:input path="username" type="text" class="form-control"
				id="exampleInputName" placeholder="Enter userName" />
				<c:errors path="username"></c:errors>
		</div>
		
		<div class="form-group">
			<label for="exampleInputName">password</label>
			<c:input path="password" type="text" class="form-control"
				id="exampleInputName" placeholder="Enter password" />
				<c:errors path="password"></c:errors>
		</div>
		

		<div class="form-group">
			<label for="exampleInputName">fullname</label>
			<c:input path="fullName" type="text" class="form-control"
				id="exampleInputName" placeholder="Enter fullanme" />
		</div>

		<div class="form-group">
			<label for="exampleInputName">email</label>
			<c:input path="email" type="email" class="form-control"
				id="exampleInputName" placeholder="Enter email" />
				<c:errors path="email"></c:errors>
		</div>

		<div class="form-group">
			<label for="exampleInputName">Addpress</label>
			<c:input path="address" type="text" class="form-control"
				id="exampleInputName" placeholder="Enter addpress" />
		</div>

		<div class="form-group">
			<label for="exampleInputName">phone</label>
			<c:input path="phone" type="text" class="form-control"
				id="exampleInputName" placeholder="Enter phone" />
		</div>

<!-- 		<div class="form-group"> -->
<!-- 			<label for="exampleInputName">photo</label> -->
<%-- 			<c:input path="photo" type="text" class="form-control" --%>
<%-- 				id="exampleInputName" placeholder="Enter photo" /> --%>
<!-- 		</div> -->

		<div class="form-group">
			<label>Role </label> <select name="role" class="form-control">
				<option value="3">ROLE_SuperAdmin</option>
				<option value="4">ROLE_Admin</option>
				<option value="5">ROLE_Shipper</option>

			</select>
		</div>
	</div>
	<!-- /.box-body -->

	<div class="box-footer">
		<button type="submit" class="btn btn-primary">Submit</button>
	</div>
</c:form>
