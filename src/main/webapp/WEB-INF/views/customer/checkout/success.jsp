<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container clearfix">

	<div class="heading-block">
		<h2>Thank you for Shopping</h2>
		<span>Here your order information </span>
	</div>
	<form>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputEmail4">Buyer Name</label> <input type="text"
					readonly="readonly" class="form-control" id="inputEmail4" value="${user.fullName }">
			</div>
			<div class="form-group col-md-6">
				<label for="inputEmail4">Payment Method</label> <input type="text"
					readonly="readonly" class="form-control" id="inputEmail4" value="${order.paymentMethod }">
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputEmail4">Date</label> <input type="text"
					readonly="readonly" class="form-control" id="inputEmail4" value="${order.dateCreated }">
			</div>
			<div class="form-group col-md-6">
				<label for="inputEmail4">Total</label> <input type="text"
					readonly="readonly" class="form-control" id="inputEmail4" value="${total }">
			</div>
		</div>
		

	</form>
</div>