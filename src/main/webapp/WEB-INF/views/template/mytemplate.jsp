<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="custom" uri="customTag"%>
<%@ taglib prefix="categoryTag" uri="categoryTag"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>

<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="SemiColonWeb" />

<!-- Stylesheets
	============================================= -->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Raleway:300,400,500,600,700|Crete+Round:400i"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/style.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/dark.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-icons.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css"
	type="text/css" />
<%-- <link href="${pageContext.request.contextPath}/resources/css/themes/base/jquery.ui.all.css" rel="stylesheet" type="text/css">
 --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/responsive.css"
	type="text/css" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Document Title
	============================================= -->
<title>Shop | Canvas</title>

</head>

<body class="stretched">

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">

		<!-- Header
		============================================= -->
		<header id="header" class="full-header">

			<div id="header-wrap">

				<div class="container clearfix">

					<div id="primary-menu-trigger">
						<i class="icon-reorder"></i>
					</div>

					<!-- Logo
					============================================= -->
					<div id="logo">
						<a href="index.html" class="standard-logo"
							data-dark-logo="${pageContext.request.contextPath}/resources/images/logo-dark.png"><img
							src="${pageContext.request.contextPath}/resources/images/logo.png"
							alt="Canvas Logo"></a> <a href="index.html" class="retina-logo"
							data-dark-logo="${pageContext.request.contextPath}/resources/images/logo-dark@2x.png"><img
							src="${pageContext.request.contextPath}/resources/images/logo@2x.png"
							alt="Canvas Logo"></a>
					</div>
					<!-- #logo end -->

					<div id="top-account" class="dropdown">
						<a href="#" class="btn btn-secondary btn-sm dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i
							class="icon-user"></i></a>
						<ul class="dropdown-menu dropdown-menu-right"
							aria-labelledby="dropdownMenu1">
							<c:if test="${pageContext.request.userPrincipal.name!=null }">
								<a class="dropdown-item tleft"
									href="${pageContext.request.contextPath}/user/profile">Profile</a>

								<div class="dropdown-divider"></div>
								<a class="dropdown-item tleft"
									href="${pageContext.request.contextPath}/user/logout">Logout
									<i class="icon-signout"></i>
								</a>
							</c:if>
							<c:if test="${pageContext.request.userPrincipal.name==null }">
								<a class="dropdown-item tleft"
									href="${pageContext.request.contextPath}/home/login">Login</a>
							</c:if>
						</ul>
					</div>


					<!-- Primary Navigation
					============================================= -->
					<nav id="primary-menu">

						<ul>
							<li><a href="${pageContext.request.contextPath}/home"><div>Home</div></a>

							</li>
							<li><a href="${pageContext.request.contextPath}/product"><div>Category</div></a>
								<categoryTag:categoryiesList /> <%-- <ul>
									<c:forEach var="category" items="${listcategory }">
										<li><a
											href="${pageContext.request.contextPath }/product/gotoCategory/${category.id}"><div>${category.name }</div></a></li>
									</c:forEach>
								</ul> --%></li>
							<li class="mega-menu"><a href="#"><div>Sale</div></a></li>
							
							<li class="mega-menu"><a href="${pageContext.request.contextPath}/seller/home"><div>Become A Seller Now </div></a></li>
							<!-- <li class="current"><a href="shop.html"><div>Shop</div></a>
							</li> -->
							<c:if test="${pageContext.request.userPrincipal.name==null}">
								
								<li class="mega-menu"><a
									href="${pageContext.request.contextPath}/home/login"><div>Register
											Now</div></a></li>
							</c:if>
						</ul>

						<!-- Top Cart
						============================================= -->
						<div id="top-cart">
							<a href="#" id="top-cart-trigger"><i
								class="icon-shopping-cart"></i> <custom:cartquantity /></a>
							<div class="top-cart-content">
								<div class="top-cart-title">
									<h4>Shopping Cart</h4>
								</div>
								<div class="top-cart-items">

									<c:set var="total" value="0"></c:set>


									<c:forEach var="item" items="${sessionScope.cart }">
										<c:set var="total"
											value="${total + item.product.price * item.quantity  }"></c:set>
										<div class="top-cart-item clearfix">
											<div class="top-cart-item-image">

												<!-- 											.. -->
												<c:forEach var="photo" items="${item.product.photos }"
													varStatus="status">
													<c:if test="${status.count < 2 }">
														<a href="#"><img
															src="${pageContext.request.contextPath}/resources/images/${photo.name}"
															alt="Light Blue Denim Dress" /></a>
													</c:if>
												</c:forEach>
												<!-- 												.. -->

											</div>
											<div class="top-cart-item-desc">
												<a href="#">${item.product.name }</a> <span
													class="top-cart-item-price">$ ${item.product.price }</span>
												<span class="top-cart-item-quantity">x
													${item.quantity }</span>
											</div>
										</div>
									</c:forEach>

								</div>
								<div class="top-cart-action clearfix">
									<span class="fleft top-checkout-price"> ${total }</span>
									<button class="button button-3d button-small nomargin fright">
										<a style="color: white;" href="${pageContext.request.contextPath}/cart">View Cart</a>
											
									</button>
								</div>
							</div>
						</div>
						<!-- #top-cart end -->

						<!-- Top Search
						============================================= -->
						<div id="top-search">
							<a href="#" id="top-search-trigger"><i class="icon-search3"></i><i
								class="icon-line-cross"></i></a>
							<form action="${pageContext.request.contextPath}/product/search" method="get">
								<input id="search" type="text" name="keywordsearch" 
									value="" placeholder="Type &amp; Hit Enter..">
								<div id="divAutoComplete" style="background-color: #fff"></div>
							</form>


						</div>
						<%-- <form id="formsearch"
							action="${pageContext.request.contextPath}/search/advancedSearchViewByName">
							<div class="control-group" style="background-color: #fff;">
								<input class="search-field" placeholder="Search in Products ..."
									id="search" name="term" /> <a class="search-button"
									href='javascript:submitsearch()'></a>
							</div>
						</form> --%>


						<!-- #top-search end -->

					</nav>
					<!-- #primary-menu end -->

				</div>

			</div>

		</header>
		<!-- #header end -->

		<!-- Page Title
		============================================= -->
		<section id="page-title">

			<div class="container clearfix">
				<h1>Shop</h1>
				<span>Start Buying your Favourite Theme</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Shop</li>
				</ol>
			</div>

		</section>
		<!-- #page-title end -->

		<!-- Content
		============================================= -->
		<section id="content">

			<div class="content-wrap">




				<tiles:insertAttribute name="content"></tiles:insertAttribute>




			</div>

		</section>
		<!-- #content end -->

		<!-- Footer
		============================================= -->
		<footer id="footer" class="dark">

			<div class="container">

				<!-- Footer Widgets
				============================================= -->
				<div class="footer-widgets-wrap clearfix">

					<div class="col_two_third">

						<div class="col_one_third">

							<div class="widget clearfix">

								<img
									src="${pageContext.request.contextPath}/resources/images/footer-widget-logo.png"
									alt="" class="footer-logo">

								<p>
									We believe in <strong>Simple</strong>, <strong>Creative</strong>
									&amp; <strong>Flexible</strong> Design Standards.
								</p>

								<div
									style="background: url('${pageContext.request.contextPath}/resources/images/world-map.png') no-repeat center center; background-size: 100%;">
									<address>
										<strong>Headquarters:</strong><br> 795 Folsom Ave, Suite
										600<br> San Francisco, CA 94107<br>
									</address>
									<abbr title="Phone Number"><strong>Phone:</strong></abbr> (91)
									8547 632521<br> <abbr title="Fax"><strong>Fax:</strong></abbr>
									(91) 11 4752 1433<br> <abbr title="Email Address"><strong>Email:</strong></abbr>
									info@canvas.com
								</div>

							</div>

						</div>

						<div class="col_one_third">

							<div class="widget widget_links clearfix">

								<h4>Blogroll</h4>

								<ul>
									<li><a href="http://codex.wordpress.org/">Documentation</a></li>
									<li><a
										href="http://wordpress.org/support/forum/requests-and-feedback">Feedback</a></li>
									<li><a href="http://wordpress.org/extend/plugins/">Plugins</a></li>
									<li><a href="http://wordpress.org/support/">Support
											Forums</a></li>
									<li><a href="http://wordpress.org/extend/themes/">Themes</a></li>
									<li><a href="http://wordpress.org/news/">WordPress
											Blog</a></li>
									<li><a href="http://planet.wordpress.org/">WordPress
											Planet</a></li>
								</ul>

							</div>

						</div>

						<div class="col_one_third col_last">

							<div class="widget clearfix">
								<h4>Recent Posts</h4>

								<div id="post-list-footer">
									<div class="spost clearfix">
										<div class="entry-c">
											<div class="entry-title">
												<h4>
													<a href="#">Lorem ipsum dolor sit amet, consectetur</a>
												</h4>
											</div>
											<ul class="entry-meta">
												<li>10th July 2014</li>
											</ul>
										</div>
									</div>

									<div class="spost clearfix">
										<div class="entry-c">
											<div class="entry-title">
												<h4>
													<a href="#">Elit Assumenda vel amet dolorum quasi</a>
												</h4>
											</div>
											<ul class="entry-meta">
												<li>10th July 2014</li>
											</ul>
										</div>
									</div>

									<div class="spost clearfix">
										<div class="entry-c">
											<div class="entry-title">
												<h4>
													<a href="#">Debitis nihil placeat, illum est nisi</a>
												</h4>
											</div>
											<ul class="entry-meta">
												<li>10th July 2014</li>
											</ul>
										</div>
									</div>
								</div>
							</div>

						</div>

					</div>

					<div class="col_one_third col_last">

						<div class="widget clearfix" style="margin-bottom: -20px;">

							<div class="row">

								<div class="col-lg-6 bottommargin-sm">
									<div class="counter counter-small">
										<span data-from="50" data-to="15065421"
											data-refresh-interval="80" data-speed="3000"
											data-comma="true"></span>
									</div>
									<h5 class="nobottommargin">Total Downloads</h5>
								</div>

								<div class="col-lg-6 bottommargin-sm">
									<div class="counter counter-small">
										<span data-from="100" data-to="18465"
											data-refresh-interval="50" data-speed="2000"
											data-comma="true"></span>
									</div>
									<h5 class="nobottommargin">Clients</h5>
								</div>

							</div>

						</div>

						<div class="widget subscribe-widget clearfix">
							<h5>
								<strong>Subscribe</strong> to Our Newsletter to get Important
								News, Amazing Offers &amp; Inside Scoops:
							</h5>
							<div class="widget-subscribe-form-result"></div>
							<form id="widget-subscribe-form" action="include/subscribe.php"
								role="form" method="post" class="nobottommargin">
								<div class="input-group divcenter">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="icon-email2"></i>
										</div>
									</div>
									<input type="email" id="widget-subscribe-form-email"
										name="widget-subscribe-form-email"
										class="form-control required email"
										placeholder="Enter your Email">
									<div class="input-group-append">
										<button class="btn btn-success" type="submit">Subscribe</button>
									</div>
								</div>
							</form>
						</div>

						<div class="widget clearfix" style="margin-bottom: -20px;">

							<div class="row">

								<div class="col-lg-6 clearfix bottommargin-sm">
									<a href="#"
										class="social-icon si-dark si-colored si-facebook nobottommargin"
										style="margin-right: 10px;"> <i class="icon-facebook"></i>
										<i class="icon-facebook"></i>
									</a> <a href="#"><small
										style="display: block; margin-top: 3px;"><strong>Like
												us</strong><br>on Facebook</small></a>
								</div>
								<div class="col-lg-6 clearfix">
									<a href="#"
										class="social-icon si-dark si-colored si-rss nobottommargin"
										style="margin-right: 10px;"> <i class="icon-rss"></i> <i
										class="icon-rss"></i>
									</a> <a href="#"><small
										style="display: block; margin-top: 3px;"><strong>Subscribe</strong><br>to
											RSS Feeds</small></a>
								</div>

							</div>

						</div>

					</div>

				</div>
				<!-- .footer-widgets-wrap end -->

			</div>

			<!-- Copyrights
			============================================= -->
			<div id="copyrights">

				<div class="container clearfix">

					<div class="col_half">
						Copyrights &copy; 2014 All Rights Reserved by Canvas Inc.<br>
						<div class="copyright-links">
							<a href="#">Terms of Use</a> / <a href="#">Privacy Policy</a>
						</div>
					</div>

					<div class="col_half col_last tright">
						<div class="fright clearfix">
							<a href="#"
								class="social-icon si-small si-borderless si-facebook"> <i
								class="icon-facebook"></i> <i class="icon-facebook"></i>
							</a> <a href="#"
								class="social-icon si-small si-borderless si-twitter"> <i
								class="icon-twitter"></i> <i class="icon-twitter"></i>
							</a> <a href="#" class="social-icon si-small si-borderless si-gplus">
								<i class="icon-gplus"></i> <i class="icon-gplus"></i>
							</a> <a href="#"
								class="social-icon si-small si-borderless si-pinterest"> <i
								class="icon-pinterest"></i> <i class="icon-pinterest"></i>
							</a> <a href="#" class="social-icon si-small si-borderless si-vimeo">
								<i class="icon-vimeo"></i> <i class="icon-vimeo"></i>
							</a> <a href="#" class="social-icon si-small si-borderless si-github">
								<i class="icon-github"></i> <i class="icon-github"></i>
							</a> <a href="#" class="social-icon si-small si-borderless si-yahoo">
								<i class="icon-yahoo"></i> <i class="icon-yahoo"></i>
							</a> <a href="#"
								class="social-icon si-small si-borderless si-linkedin"> <i
								class="icon-linkedin"></i> <i class="icon-linkedin"></i>
							</a>
						</div>

						<div class="clear"></div>

						<i class="icon-envelope2"></i> info@canvas.com <span
							class="middot">&middot;</span> <i class="icon-headphones"></i>
						+91-11-6541-6369 <span class="middot">&middot;</span> <i
							class="icon-skype2"></i> CanvasOnSkype
					</div>

				</div>

			</div>
			<!-- #copyrights end -->

		</footer>
		<!-- #footer end -->

	</div>
	<!-- #wrapper end -->

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- External JavaScripts
	============================================= -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins.js"></script>

	<!-- Footer Scripts
	============================================= -->
	<script
		src="${pageContext.request.contextPath}/resources/js/functions.js"></script>

	<%-- <script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/js/jquery-ui-1.8.2.custom.js"></script> --%>


	<script type="text/javascript">
		$(document).ready(function() {
			/* alert('Hello'); */
			bindEvent();
			loadcart();
		});
		function bindEvent() {
			$("#search").bind('keyup', function() {
				setTimeout(GetAliasDetails, 0)
			});
		}
		function GetAliasDetails() {

			var text = $('#search').val();

			if (text) {
				//$("#divLoader").show();

				$
						.ajax({
							type : "GET",
							contentType : "application/json; charset=utf-8",
							url : "${pageContext.request.contextPath}/api/restproduct/search/"
									+ text,
							dataType : "json",
							success : function(data) {

								$("#divAutoComplete").html('');
								//$("#divLoader").hide();
								if (data != null) {

									var html = "<div >";
									html += "<table>";
									$
											.each(
													data,
													function(i, item) {
														html += "<tbody class=\"hoversearch\"  onclick=\"chuyentrang(\'"
																+ item.id
																+ "\')\"><tr>";
														/*	html  += "<td style=\"padding:5px\" rowspan=\"2\"><img width=\"50\" height=\"50\" src=\"${pageContext.request.contextPath }/resources/images/products/avatar/" + item.avatar + "\" /></td>" */
														html += "<td >"
																+ item.name
																+ "</span></td></tr>";
														html += "<tr><td >"
																+ item.price
																+ " $</span></td></tr>"
														html += "</tbody>"
													})
									html += "</table></div>";
									$("#divAutoComplete").html(html).show();
								}
							},
							error : function(result) {
								//$("#divLoader").hide();
							}
						});
			} else {
				close();
			}
		}

		function close() {
			$("#divAutoComplete").html("");
			$("#divAutoComplete").slideUp();
			//$("#divLoader").hide();
		}
		function chuyentrang(s) {
			window.location = '${pageContext.request.contextPath }/product/detail/'
					+ s;
		}
		
	</script>
	<script>
		function submitsearch() {
			var form = document.getElementById("formsearch");
			form.submit();
		}
	</script>
	
	<style>
.hoversearch {
	cursor: pointer;
	border-bottom: 1px dotted #c6c6c6;
}

.hoversearch:hover {
	background-color: #e8e8e8;
}
</style>
	<!-- <div id="divAutoComplete"
		style="position: absolute; z-index: 100; padding-top: 10px"></div> -->

</body>
</html>