<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<div class="container clearfix">

	<div class="row clearfix">

		<div class="col-md-9">
			<div class="postcontent">
				<s:form modelAttribute="user"
					action="${pageContext.request.contextPath }/user/edit"
					method="post" enctype="multipart/form-data">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4">Email</label>
							<s:input class="form-control" id="inputEmail4" path="email" />
							<s:errors path="email"></s:errors>
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">Password</label>
							<s:password class="form-control" id="inputPassword4"
								path="password" />
						</div>
					</div>
					<div class="form-group">
						<label for="inputAddress">Username</label>
						<s:input readonly="true" type="text" class="form-control"
							id="inputAddress" path="username" />
					</div>
					<div class="form-group">
						<label for="inputAddress2">Address </label>
						<s:input type="text" class="form-control" id="inputAddress2"
							path="address" />
					</div>
					<div class="form-group">
						<label for="inputAddress2">Fullname </label>
						<s:input type="text" class="form-control" id="inputAddress2"
							path="fullName" />
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputCity">Phone</label>
							<s:input type="number" class="form-control" id="inputCity"
								path="phone" />
							<s:errors path="phone"></s:errors>
								
						</div>


					</div>
					<div class="form-group">
						<label for="inputAddress2">photo </label> <img width="150"
							height="150"
							src="${pageContext.request.contextPath }/resources/images/user/${user.photo }">
						<input type="file" name="files" />
					</div>

					<s:button type="submit" class="btn btn-primary">Update Information</s:button>
				</s:form>
			</div>
		</div>

		<div class="w-100 line d-block d-md-none"></div>

		<div class="col-md-3 clearfix">

			<div class="list-group">
				<a href="#" class="list-group-item list-group-item-action clearfix">Profile
					<i class="icon-user float-right"></i>
				</a> <a href="#" class="list-group-item list-group-item-action clearfix">Servers
					<i class="icon-laptop2 float-right"></i>
				</a> <a href="#" class="list-group-item list-group-item-action clearfix">Messages
					<i class="icon-envelope2 float-right"></i>
				</a> <a href="#" class="list-group-item list-group-item-action clearfix">Billing
					<i class="icon-credit-cards float-right"></i>
				</a> <a href="#" class="list-group-item list-group-item-action clearfix">Settings
					<i class="icon-cog float-right"></i>
				</a> <a href="${pageContext.request.contextPath}/user/logout"
					class="list-group-item list-group-item-action clearfix">Logout
					<i class="icon-line2-logout float-right"></i>
				</a>
			</div>

			<div class="fancy-title topmargin title-border">
				<h4>About Me</h4>
			</div>

			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
				Ipsum laboriosam, dignissimos veniam obcaecati. Quasi eaque, odio
				assumenda porro explicabo laborum!</p>

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
