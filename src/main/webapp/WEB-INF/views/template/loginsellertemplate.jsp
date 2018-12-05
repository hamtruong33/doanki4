<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
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

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/responsive.css"
	type="text/css" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Document Title
	============================================= -->
<title>Login - Layout 5 | Canvas</title>

</head>

<body class="stretched">

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">

		<!-- Content
		============================================= -->
		<section id="content">

			<div class="content-wrap nopadding">

				<div class="section nopadding nomargin"
					style="width: 100%; height: 100%; position: absolute; left: 0; top: 0; background: url('${pageContext.request.contextPath}/resources/images/parallax/home/1.jpg') center center no-repeat; background-size: cover;"></div>

				<div class="section nobg full-screen nopadding nomargin">
					<div class="container-fluid vertical-middle divcenter clearfix">

						<div class="center">
							<a href="index.html"><img src="${pageContext.request.contextPath}/resources/images/logo-dark.png"
								alt="Canvas Logo"></a>
						</div>

						<div class="card divcenter noradius noborder"
							style="max-width: 400px; background-color: rgba(255, 255, 255, 0.93);">
							<tiles:insertAttribute name="content"></tiles:insertAttribute>
						</div>

						<div class="center dark">
							<small>Copyrights &copy; All Rights Reserved by Canvas
								Inc.</small>
						</div>

					</div>
				</div>

			</div>

		</section>
		<!-- #content end -->

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

</body>
</html>