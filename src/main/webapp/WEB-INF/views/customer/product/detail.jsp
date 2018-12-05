<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<div class="container clearfix">
	<div class="single-product">

		<div class="product">

			<div class="col_half">

				<!-- Product Single - Gallery
									============================================= -->
				<div class="product-image">
					<div class="fslider" data-pagi="false" data-arrows="false"
						data-thumbs="true">
						<div class="flexslider">
							<div class="slider-wrap" data-lightbox="gallery">
								<c:forEach var="photo" items="${product.photos }"
									varStatus="status">
									<c:if test="${status.count < 3 }">
										<div class="slide"
											data-thumb="${pageContext.request.contextPath}/resources/images/${photo.name }">
											<a
												href="${pageContext.request.contextPath}/resources/images/${photo.name }"
												title="Pink Printed Dress - Front View"
												data-lightbox="gallery-item"><img
												src="${pageContext.request.contextPath}/resources/images/${photo.name }"
												alt="Pink Printed Dress"></a>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="sale-flash">Sale!</div>
				</div>
				<!-- Product Single - Gallery End -->

			</div>

			<div class="col_half col_last product-desc">

				<!-- Product Single - Price
									============================================= -->
				<div class="product-price">
					<del>$39.99</del>
					<ins>$ ${product.price }</ins>
				</div>
				<!-- Product Single - Price End -->

				<!-- Product Single - Rating
									============================================= -->
				<div class="product-rating">
					<i class="icon-star3"></i> <i class="icon-star3"></i> <i
						class="icon-star3"></i> <i class="icon-star-half-full"></i> <i
						class="icon-star-empty"></i>
				</div>
				<!-- Product Single - Rating End -->

				<div class="clear"></div>
				<div class="line"></div>

				<!-- Product Single - Quantity & Cart Button
									============================================= -->
				<form class="cart nobottommargin clearfix"
					enctype='multipart/form-data'>
					<!-- <div class="quantity clearfix">
					<input type="button" value="-" class="minus"> <input
						type="text" step="1" min="1" name="quantity" value="1" title="Qty"
						class="qty" size="4" /> <input type="button" value="+"
						class="plus">
				</div> -->
					<button class="add-to-cart button nomargin">
						<a style="color: white;"
							href="${pageContext.request.contextPath}/cart/buy/${product.id }">Add
							to cart</a>
					</button>
				</form>
				<!-- Product Single - Quantity & Cart Button End -->

				<div class="clear"></div>
				<div class="line"></div>

				<!-- Product Single - Short Description
									============================================= -->
				<p>${product.description }</p>
				<ul class="iconlist">
					<li><i class="icon-caret-right"></i> Dynamic Color Options</li>
					<li><i class="icon-caret-right"></i> Lots of Size Options</li>
					<li><i class="icon-caret-right"></i> 30-Day Return Policy</li>
				</ul>
				<!-- Product Single - Short Description End -->

				<!-- Product Single - Meta
									============================================= -->
				<div class="card product-meta">
					<div class="card-body">
						<span itemprop="productID" class="sku_wrapper">SKU: <span
							class="sku">8465415</span></span> <span class="posted_in">Category:
							<a href="#" rel="tag">Dress</a>.
						</span> <span class="tagged_as">Tags: <a href="#" rel="tag">Pink</a>,
							<a href="#" rel="tag">Short</a>, <a href="#" rel="tag">Dress</a>,
							<a href="#" rel="tag">Printed</a>.
						</span>
					</div>
				</div>
				<!-- Product Single - Meta End -->

				<!-- Product Single - Share
									============================================= -->
				<div class="si-share noborder clearfix">
					<span>Share:</span>
					<div>
						<a href="#" class="social-icon si-borderless si-facebook"> <i
							class="icon-facebook"></i> <i class="icon-facebook"></i>
						</a> <a href="#" class="social-icon si-borderless si-twitter"> <i
							class="icon-twitter"></i> <i class="icon-twitter"></i>
						</a> <a href="#" class="social-icon si-borderless si-pinterest"> <i
							class="icon-pinterest"></i> <i class="icon-pinterest"></i>
						</a> <a href="#" class="social-icon si-borderless si-gplus"> <i
							class="icon-gplus"></i> <i class="icon-gplus"></i>
						</a> <a href="#" class="social-icon si-borderless si-rss"> <i
							class="icon-rss"></i> <i class="icon-rss"></i>
						</a> <a href="#" class="social-icon si-borderless si-email3"> <i
							class="icon-email3"></i> <i class="icon-email3"></i>
						</a>
					</div>
				</div>
				<!-- Product Single - Share End -->

			</div>

			<div class="col_full nobottommargin">

				<div class="tabs clearfix nobottommargin" id="tab-1">

					<ul class="tab-nav clearfix">
						<li><a href="#tabs-1"><i class="icon-align-justify2"></i><span
								class="d-none d-md-block"> Description</span></a></li>
						<li><a href="#tabs-2"><i class="icon-info-sign"></i><span
								class="d-none d-md-block"> Additional Information</span></a></li>
						<li><a href="#tabs-3"><i class="icon-star3"></i><span
								class="d-none d-md-block"> Reviews (2)</span></a></li>
					</ul>

					<div class="tab-container">

						<div class="tab-content clearfix" id="tabs-1">
							<p>${product.description }</p>
							Comes with a white, slim synthetic belt that has a tang clasp.
						</div>
						<div class="tab-content clearfix" id="tabs-2">

							<table class="table table-striped table-bordered">
								<tbody>
									<tr>
										<td>Size</td>
										<td>Small, Medium &amp; Large</td>
									</tr>
									<tr>
										<td>Color</td>
										<td>Pink &amp; White</td>
									</tr>
									<tr>
										<td>Waist</td>
										<td>26 cm</td>
									</tr>
									<tr>
										<td>Length</td>
										<td>40 cm</td>
									</tr>
									<tr>
										<td>Chest</td>
										<td>33 inches</td>
									</tr>
									<tr>
										<td>Fabric</td>
										<td>Cotton, Silk &amp; Synthetic</td>
									</tr>
									<tr>
										<td>Warranty</td>
										<td>3 Months</td>
									</tr>
								</tbody>
							</table>

						</div>
						<div class="tab-content clearfix" id="tabs-3">

							<div id="reviews" class="clearfix">

								<ol class="commentlist clearfix">
									<!-- 						show list review -->
									<c:forEach var="review" items="${listReview }">
										<li class="comment even thread-even depth-1" id="li-comment-1">
											<div id="comment-1" class="comment-wrap clearfix">

												<div class="comment-meta">
													<div class="comment-author vcard">
														<span class="comment-avatar clearfix"> <img alt=''
															src='http://0.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?s=60'
															height='60' width='60' /></span>
													</div>
												</div>

												<div class="comment-content clearfix">
													<div class="comment-author">
														${review.user.fullName }<span><a href="#"
															title="Permalink to this comment">${review.dateCreated }</a></span>
													</div>
													<p>${review.content }</p>
													<div class="review-comment-ratings">
														<i class="icon-star3"></i> <i class="icon-star3"></i> <i
															class="icon-star3"></i> <i class="icon-star3"></i> <i
															class="icon-star-half-full"></i>
													</div>
												</div>

												<div class="clear"></div>

											</div>
										</li>
									</c:forEach>



								</ol>
								<!-- 		end show list review -->
								<!-- Modal Reviews
													============================================= -->
								<a href="#" data-toggle="modal" data-target="#reviewFormModal"
									class="button button-3d nomargin fright">Add a Review</a>

								<div class="modal fade" id="reviewFormModal" tabindex="-1"
									role="dialog" aria-labelledby="reviewFormModalLabel"
									aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title" id="reviewFormModalLabel">Submit
													a Review</h4>
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
											</div>
											<div class="modal-body">
												<f:form class="nobottommargin" id="template-reviewform"
													name="template-reviewform" modelAttribute="user"
													action="${pageContext.request.contextPath }/product/review/${product.id}"
													method="post">


													<div class="clear"></div>

													<!-- <div class="col_full col_last">
														<label for="template-reviewform-rating">Rating</label> <select
															id="template-reviewform-rating"
															name="template-reviewform-rating" class="form-control">
															<option value="">-- Select One --</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</div> -->

													<div class="clear"></div>

													<div class="col_full">
														<label for="template-reviewform-comment">Comment <small>*</small></label>
														<textarea class="required form-control"
															id="template-reviewform-comment" name="comment" rows="6"
															cols="30"></textarea>
													</div>

													<div class="col_full nobottommargin">
														<button class="button button-3d nomargin" type="submit"
															id="template-reviewform-submit"
															name="template-reviewform-submit" value="submit">Submit
															Review</button>
													</div>

												</f:form>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>
								<!-- /.modal -->
								<!-- Modal Reviews End -->

							</div>

						</div>

					</div>

				</div>

				<div class="line"></div>

				<div class="col_one_third nobottommargin">
					<a href="#" title="Brand Logo" class="d-none d-md-block"><img
						class="image_fade"
						src="${pageContext.request.contextPath}/resources/images/shop/brand2.jpg"
						alt="Brand Logo"></a>
				</div>

				<div class="col_two_third col_last nobottommargin">

					<div class="col_half">

						<div class="feature-box fbox-plain fbox-dark fbox-small">
							<div class="fbox-icon">
								<i class="icon-thumbs-up2"></i>
							</div>
							<h3>100% Original Brands</h3>
							<p class="notopmargin">We guarantee you the sale of Original
								Brands with warranties.</p>
						</div>

					</div>

					<div class="col_half col_last">

						<div class="feature-box fbox-plain fbox-dark fbox-small">
							<div class="fbox-icon">
								<i class="icon-credit-cards"></i>
							</div>
							<h3>Lots of Payment Options</h3>
							<p class="notopmargin">We accept Visa, MasterCard and
								American Express &amp; of-course PayPal.</p>
						</div>

					</div>

					<div class="col_half nobottommargin">

						<div class="feature-box fbox-plain fbox-dark fbox-small">
							<div class="fbox-icon">
								<i class="icon-truck2"></i>
							</div>
							<h3>Free Express Shipping</h3>
							<p class="notopmargin">Free Delivery to 100+ Locations
								Worldwide on orders above $40.</p>
						</div>

					</div>

					<div class="col_half col_last nobottommargin">

						<div class="feature-box fbox-plain fbox-dark fbox-small">
							<div class="fbox-icon">
								<i class="icon-undo"></i>
							</div>
							<h3>30-Days Returns Policy</h3>
							<p class="notopmargin">Return or exchange items purchased
								within 30 days for Free.</p>
						</div>

					</div>

				</div>

			</div>

		</div>

	</div>

	<div class="clear"></div>
	<div class="line"></div>

	<div class="col_full nobottommargin">

		<h4>Related Products</h4>

		<div id="oc-product"
			class="owl-carousel product-carousel carousel-widget"
			data-margin="30" data-pagi="false" data-autoplay="5000"
			data-items-xs="1" data-items-md="2" data-items-xl="4">

			<div class="oc-item">
				<div class="product iproduct clearfix">
					<div class="product-image">
						<a href="#"><img
							src="${pageContext.request.contextPath}/resources/images/shop/dress/1.jpg"
							alt="Checked Short Dress"></a> <a href="#"><img
							src="${pageContext.request.contextPath}/resources/images/shop/dress/1-1.jpg"
							alt="Checked Short Dress"></a>
						<div class="sale-flash">50% Off*</div>
						<div class="product-overlay">
							<a href="#" class="add-to-cart"><i class="icon-shopping-cart"></i><span>
									Add to Cart</span></a> <a href="include/ajax/shop-item.html"
								class="item-quick-view" data-lightbox="ajax"><i
								class="icon-zoom-in2"></i><span> Quick View</span></a>
						</div>
					</div>
					<div class="product-desc center">
						<div class="product-title">
							<h3>
								<a href="#">Checked Short Dress</a>
							</h3>
						</div>
						<div class="product-price">
							<del>$24.99</del>
							<ins>$12.49</ins>
						</div>
						<div class="product-rating">
							<i class="icon-star3"></i> <i class="icon-star3"></i> <i
								class="icon-star3"></i> <i class="icon-star3"></i> <i
								class="icon-star-half-full"></i>
						</div>
					</div>
				</div>
			</div>

			<div class="oc-item">
				<div class="product iproduct clearfix">
					<div class="product-image">
						<a href="#"><img
							src="${pageContext.request.contextPath}/resources/images/shop/pants/1-1.jpg"
							alt="Slim Fit Chinos"></a> <a href="#"><img
							src="${pageContext.request.contextPath}/resources/images/shop/pants/1.jpg"
							alt="Slim Fit Chinos"></a>
						<div class="product-overlay">
							<a href="#" class="add-to-cart"><i class="icon-shopping-cart"></i><span>
									Add to Cart</span></a> <a href="include/ajax/shop-item.html"
								class="item-quick-view" data-lightbox="ajax"><i
								class="icon-zoom-in2"></i><span> Quick View</span></a>
						</div>
					</div>
					<div class="product-desc center">
						<div class="product-title">
							<h3>
								<a href="#">Slim Fit Chinos</a>
							</h3>
						</div>
						<div class="product-price">$39.99</div>
						<div class="product-rating">
							<i class="icon-star3"></i> <i class="icon-star3"></i> <i
								class="icon-star3"></i> <i class="icon-star-half-full"></i> <i
								class="icon-star-empty"></i>
						</div>
					</div>
				</div>
			</div>

			<div class="oc-item">
				<div class="product iproduct clearfix">
					<div class="product-image">
						<a href="#"><img
							src="${pageContext.request.contextPath}/resources/images/shop/shoes/1-1.jpg"
							alt="Dark Brown Boots"></a> <a href="#"><img
							src="${pageContext.request.contextPath}/resources/images/shop/shoes/1.jpg"
							alt="Dark Brown Boots"></a>
						<div class="product-overlay">
							<a href="#" class="add-to-cart"><i class="icon-shopping-cart"></i><span>
									Add to Cart</span></a> <a href="include/ajax/shop-item.html"
								class="item-quick-view" data-lightbox="ajax"><i
								class="icon-zoom-in2"></i><span> Quick View</span></a>
						</div>
					</div>
					<div class="product-desc center">
						<div class="product-title">
							<h3>
								<a href="#">Dark Brown Boots</a>
							</h3>
						</div>
						<div class="product-price">$49</div>
						<div class="product-rating">
							<i class="icon-star3"></i> <i class="icon-star3"></i> <i
								class="icon-star3"></i> <i class="icon-star-empty"></i> <i
								class="icon-star-empty"></i>
						</div>
					</div>
				</div>
			</div>

			<div class="oc-item">
				<div class="product iproduct clearfix">
					<div class="product-image">
						<a href="#"><img
							src="${pageContext.request.contextPath}/resources/images/shop/dress/2.jpg"
							alt="Light Blue Denim Dress"></a> <a href="#"><img
							src="${pageContext.request.contextPath}/resources/images/shop/dress/2-2.jpg"
							alt="Light Blue Denim Dress"></a>
						<div class="product-overlay">
							<a href="#" class="add-to-cart"><i class="icon-shopping-cart"></i><span>
									Add to Cart</span></a> <a href="include/ajax/shop-item.html"
								class="item-quick-view" data-lightbox="ajax"><i
								class="icon-zoom-in2"></i><span> Quick View</span></a>
						</div>
					</div>
					<div class="product-desc center">
						<div class="product-title">
							<h3>
								<a href="#">Light Blue Denim Dress</a>
							</h3>
						</div>
						<div class="product-price">$19.95</div>
						<div class="product-rating">
							<i class="icon-star3"></i> <i class="icon-star3"></i> <i
								class="icon-star3"></i> <i class="icon-star3"></i> <i
								class="icon-star-empty"></i>
						</div>
					</div>
				</div>
			</div>

			<div class="oc-item">
				<div class="product iproduct clearfix">
					<div class="product-image">
						<a href="#"><img
							src="${pageContext.request.contextPath}/resources/images/shop/sunglasses/1.jpg"
							alt="Unisex Sunglasses"></a> <a href="#"><img
							src="${pageContext.request.contextPath}/resources/images/shop/sunglasses/1-1.jpg"
							alt="Unisex Sunglasses"></a>
						<div class="sale-flash">Sale!</div>
						<div class="product-overlay">
							<a href="#" class="add-to-cart"><i class="icon-shopping-cart"></i><span>
									Add to Cart</span></a> <a href="include/ajax/shop-item.html"
								class="item-quick-view" data-lightbox="ajax"><i
								class="icon-zoom-in2"></i><span> Quick View</span></a>
						</div>
					</div>
					<div class="product-desc center">
						<div class="product-title">
							<h3>
								<a href="#">Unisex Sunglasses</a>
							</h3>
						</div>
						<div class="product-price">
							<del>$19.99</del>
							<ins>$11.99</ins>
						</div>
						<div class="product-rating">
							<i class="icon-star3"></i> <i class="icon-star3"></i> <i
								class="icon-star3"></i> <i class="icon-star-empty"></i> <i
								class="icon-star-empty"></i>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>

</div>