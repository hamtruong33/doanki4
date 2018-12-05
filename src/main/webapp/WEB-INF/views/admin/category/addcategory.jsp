<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<div class="box-header with-border">
	<h3 class="box-title">Add Category</h3>
</div>
<!-- /.box-header -->
<!-- form start -->
<form role="form">
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputName">Name</label> <input type="text"
				class="form-control" id="exampleInputName" placeholder="Enter Name">
		</div>
		
		<div class="form-group">
			<label>Tier </label> <select class="form-control">
				<option>Tier 1</option>
				<option>Tier 2</option>
				<option>Tier 3</option>
				<option>Tier 4</option>
				<option>Tier 5</option>
			</select>
		</div>
	</div>
	<!-- /.box-body -->

	<div class="box-footer">
		<button type="submit" class="btn btn-primary">Submit</button>
	</div>
</form>
