<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container clearfix">

	<div class="row clearfix">

		<div class="col-md-9">

			<img
				src="${pageContext.request.contextPath}/resources/images/user/${user.photo}"
				class="alignleft img-circle img-thumbnail notopmargin nobottommargin"
				alt="Avatar" style="max-width: 84px;">

			<div class="heading-block noborder">
				<h3>${user.fullName }</h3>
				<span>Your Profile Bio</span>
			</div>

			<div class="clear"></div>

			<div class="row clearfix">

				<div class="col-lg-12">

					<div class="tabs tabs-alt clearfix" id="tabs-profile">

						<ul class="tab-nav clearfix">
							<li><a href="#tab-feeds"><i class="icon-rss2"></i>
									Orders</a></li>
							<li><a href="#tab-posts"><i class="icon-pencil2"></i>
									Posts</a></li>
							<!-- <li><a href="#tab-replies"><i class="icon-reply"></i>
									Replies</a></li> -->
							<!-- <li><a href="#tab-connections"><i class="icon-users"></i>
									Connections</a></li> -->
						</ul>

						<div class="tab-container">

							<div class="tab-content clearfix" id="tab-feeds">

								<p class=""></p>

								<table class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Time</th>
											<th>Product</th>
											<th>Shop</th>
											<th>Confirm Number</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="o" items="${ordersdetails }">
											<tr>
												<td><code>${o.orders.dateCreated }</code></td>
												<td>${o.product.name }</td>
												<td>${o.product.shop.name }</td>
												<td>${o.orders.confirmNumber }</td>
												<td>${o.status }</td>
											
												
											</tr>
											
										</c:forEach>

									</tbody>
								</table>

							</div>

							<div class="tab-content clearfix" id="tab-posts">

								<div class="row topmargin-sm clearfix">
									<c:forEach var="r" items="${reviews }">
										<div class="col-12 bottommargin-sm">
											<div class="ipost clearfix">
												<div class="row clearfix">
													<div class="col-md-4">
														<div class="entry-image">
															<!-- <a
																href="${pageContext.request.contextPath}/resources/images/portfolio/full/17.jpg"
																data-lightbox="image">  <img class="image_fade"
															src="${pageContext.request.contextPath}/resources/images/${r.product.photos.get(0).name}"
															alt="Standard Post with Image"> 
															</a> -->
														</div>
													</div>
													<div class="col-md-8">
														<div class="entry-title">
															<h3>
																<a href="${pageContext.request.contextPath}product/detail/${r.product.id}">${r.content }</a>
															</h3>
														</div>
														<ul class="entry-meta clearfix">
															<li><i class="icon-calendar3"></i> ${r.dateCreated }</li>
															<!-- <li><a href="blog-single.html#comments"><i
																	class="icon-comments"></i> 13</a></li> -->
															<!-- <li><a href="#"><i class="icon-camera-retro"></i></a></li> -->
														</ul>
														<div class="entry-content">
															<p></p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>

							</div>
							<!-- 			<div class="tab-content clearfix" id="tab-replies">

								<div class="clear topmargin-sm"></div>
								<ol class="commentlist noborder nomargin nopadding clearfix">
									<li class="comment even thread-even depth-1" id="li-comment-1">
										<div id="comment-1" class="comment-wrap clearfix">
											<div class="comment-meta">
												<div class="comment-author vcard">
													<span class="comment-avatar clearfix"> <img alt=''
														src='http://0.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?s=60'
														class='avatar avatar-60 photo avatar-default' height='60'
														width='60' /></span>
												</div>
											</div>
											<div class="comment-content clearfix">
												<div class="comment-author">
													John Doe<span><a href="#"
														title="Permalink to this comment">April 24, 2012 at
															10:46 am</a></span>
												</div>
												<p>Donec sed odio dui. Nulla vitae elit libero, a
													pharetra augue. Nullam id dolor id nibh ultricies vehicula
													ut id elit. Integer posuere erat a ante venenatis dapibus
													posuere velit aliquet.</p>
												<a class='comment-reply-link' href='#'><i
													class="icon-reply"></i></a>
											</div>
											<div class="clear"></div>
										</div>
										<ul class='children'>
											<li
												class="comment byuser comment-author-_smcl_admin odd alt depth-2"
												id="li-comment-3">
												<div id="comment-3" class="comment-wrap clearfix">
													<div class="comment-meta">
														<div class="comment-author vcard">

															<span class="comment-avatar clearfix"> <img alt=''
																src='http://1.gravatar.com/avatar/30110f1f3a4238c619bcceb10f4c4484?s=40&amp;d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D40&amp;r=G'
																class='avatar avatar-40 photo' height='40' width='40' /></span>

														</div>
													</div>
													<div class="comment-content clearfix">
														<div class="comment-author">
															<a href='#' rel='external nofollow' class='url'>SemiColon</a><span><a
																href="#" title="Permalink to this comment">April 25,
																	2012 at 1:03 am</a></span>
														</div>

														<p>Nullam id dolor id nibh ultricies vehicula ut id
															elit.</p>

														<a class='comment-reply-link' href='#'><i
															class="icon-reply"></i></a>
													</div>
													<div class="clear"></div>
												</div>
											</li>
										</ul>
									</li>

									<li
										class="comment byuser comment-author-_smcl_admin even thread-odd thread-alt depth-1"
										id="li-comment-2">
										<div class="comment-wrap clearfix">
											<div class="comment-meta">
												<div class="comment-author vcard">
													<span class="comment-avatar clearfix"> <img alt=''
														src='http://1.gravatar.com/avatar/30110f1f3a4238c619bcceb10f4c4484?s=60&amp;d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D60&amp;r=G'
														class='avatar avatar-60 photo' height='60' width='60' /></span>
												</div>
											</div>
											<div class="comment-content clearfix">
												<div class="comment-author">
													<a href='http://themeforest.net/user/semicolonweb'
														rel='external nofollow' class='url'>SemiColon</a><span><a
														href="#" title="Permalink to this comment">April 25,
															2012 at 1:03 am</a></span>
												</div>

												<p>Integer posuere erat a ante venenatis dapibus posuere
													velit aliquet.</p>

												<a class='comment-reply-link' href='#'><i
													class="icon-reply"></i></a>
											</div>
											<div class="clear"></div>
										</div>
									</li>

								</ol>

							</div> -->
							<%-- <div class="tab-content clearfix" id="tab-connections">

								<div class="row topmargin-sm">
									<div class="col-lg-3 col-md-6 bottommargin">

										<div class="team">
											<div class="team-image">
												<img
													src="${pageContext.request.contextPath}/resources/images/team/3.jpg"
													alt="John Doe">
											</div>
											<div class="team-desc">
												<div class="team-title">
													<h4>John Doe</h4>
													<span>CEO</span>
												</div>
												<a href="#"
													class="social-icon inline-block si-small si-light si-rounded si-facebook">
													<i class="icon-facebook"></i> <i class="icon-facebook"></i>
												</a> <a href="#"
													class="social-icon inline-block si-small si-light si-rounded si-twitter">
													<i class="icon-twitter"></i> <i class="icon-twitter"></i>
												</a> <a href="#"
													class="social-icon inline-block si-small si-light si-rounded si-gplus">
													<i class="icon-gplus"></i> <i class="icon-gplus"></i>
												</a>
											</div>
										</div>

									</div>

									<div class="col-lg-3 col-md-6 bottommargin">

										<div class="team">
											<div class="team-image">
												<img
													src="${pageContext.request.contextPath}/resources/images/team/2.jpg"
													alt="Josh Clark">
											</div>
											<div class="team-desc">
												<div class="team-title">
													<h4>Josh Clark</h4>
													<span>Co-Founder</span>
												</div>
												<a href="#"
													class="social-icon inline-block si-small si-light si-rounded si-facebook">
													<i class="icon-facebook"></i> <i class="icon-facebook"></i>
												</a> <a href="#"
													class="social-icon inline-block si-small si-light si-rounded si-twitter">
													<i class="icon-twitter"></i> <i class="icon-twitter"></i>
												</a> <a href="#"
													class="social-icon inline-block si-small si-light si-rounded si-gplus">
													<i class="icon-gplus"></i> <i class="icon-gplus"></i>
												</a>
											</div>
										</div>

									</div>

									<div class="col-lg-3 col-md-6 bottommargin">

										<div class="team">
											<div class="team-image">
												<img
													src="${pageContext.request.contextPath}/resources/images/team/8.jpg"
													alt="Mary Jane">
											</div>
											<div class="team-desc">
												<div class="team-title">
													<h4>Mary Jane</h4>
													<span>Sales</span>
												</div>
												<a href="#"
													class="social-icon inline-block si-small si-light si-rounded si-facebook">
													<i class="icon-facebook"></i> <i class="icon-facebook"></i>
												</a> <a href="#"
													class="social-icon inline-block si-small si-light si-rounded si-twitter">
													<i class="icon-twitter"></i> <i class="icon-twitter"></i>
												</a> <a href="#"
													class="social-icon inline-block si-small si-light si-rounded si-gplus">
													<i class="icon-gplus"></i> <i class="icon-gplus"></i>
												</a>
											</div>
										</div>

									</div>

									<div class="col-lg-3 col-md-6">

										<div class="team">
											<div class="team-image">
												<img
													src="${pageContext.request.contextPath}/resources/images/team/4.jpg"
													alt="Nix Maxwell">
											</div>
											<div class="team-desc">
												<div class="team-title">
													<h4>Nix Maxwell</h4>
													<span>Support</span>
												</div>
												<a href="#"
													class="social-icon inline-block si-small si-light si-rounded si-facebook">
													<i class="icon-facebook"></i> <i class="icon-facebook"></i>
												</a> <a href="#"
													class="social-icon inline-block si-small si-light si-rounded si-twitter">
													<i class="icon-twitter"></i> <i class="icon-twitter"></i>
												</a> <a href="#"
													class="social-icon inline-block si-small si-light si-rounded si-gplus">
													<i class="icon-gplus"></i> <i class="icon-gplus"></i>
												</a>
											</div>
										</div>

									</div>
								</div>

							</div>
 --%>
						</div>

					</div>

				</div>

			</div>

		</div>

		<div class="w-100 line d-block d-md-none"></div>

		<div class="col-md-3 clearfix">

			<div class="list-group">
				<!-- <a href="#" class="list-group-item list-group-item-action clearfix">Profile
					<i class="icon-user float-right"></i>
				</a> <a href="#" class="list-group-item list-group-item-action clearfix">Servers
					<i class="icon-laptop2 float-right"></i>
				</a> <a href="#" class="list-group-item list-group-item-action clearfix">Messages
					<i class="icon-envelope2 float-right"></i>
				</a> <a href="#" class="list-group-item list-group-item-action clearfix">Billing
					<i class="icon-credit-cards float-right"></i> -->
				</a> <a href="${pageContext.request.contextPath}/user/setting"
					class="list-group-item list-group-item-action clearfix">Settings
					<i class="icon-cog float-right"></i>
				</a> <a href="#"
					onclick="document.getElementById('logout-form').submit();"
					class="list-group-item list-group-item-action clearfix">Logout
					<i class="icon-line2-logout float-right"></i>
				</a>
				<s:form id="logout-form"
					action="${pageContext.request.contextPath}/user/logout"
					method="post">

				</s:form>

			</div>

			<div class="fancy-title topmargin title-border">
				<h4>About Me</h4>
			</div>

			<!-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
				Ipsum laboriosam, dignissimos veniam obcaecati. Quasi eaque, odio
				assumenda porro explicabo laborum!</p> -->

			<div class="fancy-title topmargin title-border">
				<h4>Social Profiles</h4>
			</div>

			<a href="#"
				class="social-icon si-facebook si-small si-rounded si-light"
				title="Facebook"> <i class="icon-facebook"></i> <i
				class="icon-facebook"></i>
			</a> <a href="#"
				class="social-icon si-gplus si-small si-rounded si-light"
				title="Google+"> <i class="icon-gplus"></i> <i
				class="icon-gplus"></i>
			</a> <a href="#"
				class="social-icon si-dribbble si-small si-rounded si-light"
				title="Dribbble"> <i class="icon-dribbble"></i> <i
				class="icon-dribbble"></i>
			</a> <a href="#"
				class="social-icon si-flickr si-small si-rounded si-light"
				title="Flickr"> <i class="icon-flickr"></i> <i
				class="icon-flickr"></i>
			</a> <a href="#"
				class="social-icon si-linkedin si-small si-rounded si-light"
				title="LinkedIn"> <i class="icon-linkedin"></i> <i
				class="icon-linkedin"></i>
			</a> <a href="#"
				class="social-icon si-twitter si-small si-rounded si-light"
				title="Twitter"> <i class="icon-twitter"></i> <i
				class="icon-twitter"></i>
			</a>

		</div>

	</div>

</div>
