<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container clearfix">
<div class="col_half">
	<div class="card">
		<%-- <div class="card-body">
			Returning customer? <a
				href="${pageContext.request.contextPath }/account">Click
				here to login</a>
		</div> --%>
	</div>
</div>
<!-- <div class="col_half col_last"> -->
<!-- 	<div class="card"> -->
<!-- 		<div class="card-body"> -->
<!-- 			Have a coupon? <a href="login-register.html">Click here to enter -->
<!-- 				your code</a> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->

<div class="clear"></div>

<div class="row clearfix">

	<div class="col-lg-6">
		<h3 class="">Shipping Address</h3>

		<form id="shipping-form" name="shipping-form" class="nobottommargin"
			action="#" method="post">

			<div class="col_half">
				<label for="shipping-form-name">Name:</label> <input type="text"
					id="shipping-form-name" name="shipping-form-name" value=""
					class="sm-form-control" />
			</div>

			<div class="col_half col_last">
				<label for="shipping-form-lname">Last Name:</label> <input
					type="text" id="shipping-form-lname" name="shipping-form-lname"
					value="" class="sm-form-control" />
			</div>

			<div class="clear"></div>

			<div class="col_full">
				<label for="shipping-form-companyname">Company Name:</label> <input
					type="text" id="shipping-form-companyname"
					name="shipping-form-companyname" value="" class="sm-form-control" />
			</div>

			<div class="col_full">
				<label for="shipping-form-address">Address:</label> <input
					type="text" id="shipping-form-address" name="shipping-form-address"
					value="" class="sm-form-control" />
			</div>

			<div class="col_full">
				<input type="text" id="shipping-form-address2"
					name="shipping-form-adress" value="" class="sm-form-control" />
			</div>

			<div class="col_full">
				<label for="shipping-form-city">City / Town</label> <input
					type="text" id="shipping-form-city" name="shipping-form-city"
					value="" class="sm-form-control" />
			</div>

			<div class="col_full">
				<label for="shipping-form-message">Notes <small>*</small></label>
				<textarea class="sm-form-control" id="shipping-form-message"
					name="shipping-form-message" rows="6" cols="30"></textarea>
			</div>

		</form>
	</div>
	<div class="w-100 bottommargin"></div>
	<div class="col-lg-6">
		<h4>Your Orders</h4>

		<div class="table-responsive">
			<table class="table cart">
				<thead>
					<tr>
						<th class="cart-product-thumbnail">&nbsp;</th>
						<th class="cart-product-name">Product</th>
						<th class="cart-product-quantity">Quantity</th>
						<th class="cart-product-subtotal">Total</th>
					</tr>
				</thead>
				<tbody>
					<!-- 					.. -->
					<c:set var="total" value="0"></c:set>

					<c:forEach var="item" items="${sessionScope.cart }" varStatus="i">
						<c:set var="total"
							value="${total + item.product.price * item.quantity  }"></c:set>
						<tr class="cart_item">

							<c:forEach var="photo" items="${item.product.photos }"
								varStatus="status">
								<c:if test="${status.count < 2 }">
									<td class="cart-product-thumbnail"><a href="#"><img
											width="64" height="64"
											src="${pageContext.request.contextPath}/resources/images/${photo.name}"
											alt="Pink Printed Dress"></a></td>
								</c:if>
							</c:forEach>

							<td class="cart-product-name"><a href="#">${item.product.name }</a>
							</td>

							<td class="cart-product-quantity">
								<div class="quantity clearfix">${item.quantity }</div>
							</td>

							<td class="cart-product-subtotal"><span class="amount">$${item.product.price
									* item.quantity }</span></td>
						</tr>
					</c:forEach>
					<!-- 					.. -->
				</tbody>

			</table>
		</div>
	</div>
	<div class="col-lg-6">
		<h4>Cart Totals</h4>

		<div class="table-responsive">
			<table class="table cart">
				<tbody>
					<tr class="cart_item">
						<td class="notopborder cart-product-name"><strong>Cart
								Subtotal</strong></td>

						<td class="notopborder cart-product-name"><span
							class="amount">$106.94</span></td>
					</tr>
					<tr class="cart_item">
						<td class="cart-product-name"><strong>Shipping</strong></td>

						<td class="cart-product-name"><span class="amount">Free
								Delivery</span></td>
					</tr>
					<tr class="cart_item">
						<td class="cart-product-name"><strong>Total</strong></td>

						<td class="cart-product-name"><span class="amount color lead"><strong>$${total
									}</strong></span></td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 		pay to cash -->
		<a href="${pageContext.request.contextPath }/checkout/success?cash"
			class="button button-3d fright">Pay to cash</a>
		<!-- 	end	pay to cash -->
		<!-- 	paypal -->
		<form action="${payPalConfig.posturl }" method="post">
			<!-- PayPalConfig -->
			<input type="hidden" name="upload" value="1" /> <input type="hidden"
				name="return" value="${payPalConfig.returnurl }" /> <input
				type="hidden" name="cmd" value="_cart" /> <input type="hidden"
				name="business" value="${payPalConfig.business }" />
			<!-- Product List -->
			<!-- item_number , item_name ... la do paypal quy dinh  -->
			<c:forEach var="item" items="${sessionScope.cart }" varStatus="i">
				<input type="hidden" name="item_number_${i.index+1 }"
					value="${item.product.id }">
				<input type="hidden" name="item_name_${i.index+1 }"
					value="${item.product.name }">
				<input type="hidden" name="amount_${i.index+1 }"
					value="${item.product.price }">
				<input type="hidden" name="quantity_${i.index+1 }"
					value="${item.quantity }">
			</c:forEach>
			<!-- <a class="button button-3d notopmargin fright">PayPal</a> -->
			<!-- <input  type="button" class="button button-3d notopmargin fright"
										value="PayPal"> -->
			<input type="image"
				src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif">
		</form>
		<!-- end paypal -->
	</div>

</div>
</div>