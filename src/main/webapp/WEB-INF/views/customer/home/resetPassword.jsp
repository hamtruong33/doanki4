<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<div class="tabs divcenter nobottommargin clearfix"
	id="tab-login-register" style="max-width: 500px;">



	<div class="tab-container">

		<div class="tab-content clearfix" id="tab-login">
			<div class="card nobottommargin">
				<div class="card-body" style="padding: 40px;">
					<!-- 				login form -->
					<form method="post"
						action="${pageContext.request.contextPath }/home/setNewPassword?token=${token }"
						id="login-form" name="login-form" class="nobottommargin">
						<h4 style="color: red;"></h4>
						<h3>Forgot password</h3>
						<h3>${messerr }</h3>
						<div class="col_full">
							<label for="login-form-username">New Password</label> <input
								type="password" id="login-form-username" name="newpassword"
								class="form-control" />
						</div>
						<div class="col_full">
							<label for="login-form-username">confirm Password</label> <input
								type="password" id="login-form-username" name="confirmpassword"
								class="form-control" />
						</div>
						<button class="button button-3d button-black nomargin"
							id="login-form-submit" name="login-form-submit" value="Send">Send</button>
					</form>
					<!-- 					end login  form -->
				</div>
			</div>
		</div>

	</div>

</div>
