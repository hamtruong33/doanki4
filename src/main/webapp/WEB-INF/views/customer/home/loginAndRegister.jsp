<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<div class="container clearfix">

	<div class="col_one_third nobottommargin">

		<div class="well well-lg nobottommargin">
			<s:form modelAttribute="user" id="login-form" name="login-form"
				class="nobottommargin"
				action="${pageContext.request.contextPath }/user/process-login"
				method="post">

				<h3>Login to your Account</h3>
								
								${msg }
								<br>
				<div class="col_full">
					<label for="login-form-username">Username:</label> <s:input path="username"
						type="text" id="login-form-username" name="username" value=""
						class="form-control" />
				</div>

				<div class="col_full">
					<label for="login-form-password">Password:</label> <s:input path="password"
						type="password" id="login-form-password" name="password" value=""
						class="form-control" />
				</div>

				<div class="col_full nobottommargin">
					<button class="button button-3d nomargin" id="login-form-submit"
						name="login-form-submit" value="login">Login</button>
					<a
						href="${pageContext.request.contextPath }/home/gotoforgotpassword"
						class="fright">Forgot Password?</a> <br>
				</div>

			</s:form>
		</div>

	</div>

	<div class="col_two_third col_last nobottommargin">

		<h3>${msgl }</h3>
		<h3>Don't have an Account? Register Now.</h3>

		<!-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde,
			vel odio non dicta provident sint ex autem mollitia dolorem illum
			repellat ipsum aliquid illo similique sapiente fugiat minus ratione.</p> -->

		<s:form modelAttribute="user" id="register-form" name="register-form"
			class="nobottommargin"
			action="${pageContext.request.contextPath }/home/save" method="post">

			<div class="col_half">
				<label for="register-form-name">FullName:</label>
				<s:input path="fullName" type="text" id="register-form-name"
					name="register-form-name" value="" class="form-control" />
				<br>
				<s:errors path="fullName"></s:errors>
			</div>

			<div class="col_half col_last">
				<label for="register-form-email">Email Address:</label>
				<s:input path="email" type="email" id="register-form-email"
					name="register-form-email" value="" class="form-control" />
				<s:errors path="email"></s:errors>
			</div>

			<div class="clear"></div>

			<div class="col_half">
				<label for="register-form-username">Choose a Username:</label>
				<s:input path="username" type="text" id="register-form-username"
					name="register-form-username" value="" class="form-control" />
				<s:errors path="username"></s:errors>
				${msg1 }
			</div>

			<div class="col_half col_last">
				<label for="register-form-repassword">Address</label>
				<s:input path="address" type="text" id="address"
					name="register-form-repassword" value="" class="form-control" />
				<s:errors path="address"></s:errors>
			</div>

			<div class="clear"></div>

			<div class="col_half">
				<label for="register-form-password">Choose Password:</label>
				<s:input path="password" type="password" id="register-form-password"
					name="register-form-password" value="" class="form-control" />
				<s:errors path="password"></s:errors>
			</div>

			<div class="col_half col_last">
				<label for="register-form-repassword">Re-enter Password:</label> <input
					path="password" type="password" id="register-form-repassword"
					name="register-form-repassword" value="" class="form-control" />
			</div>

			<div class="col_half">
				<!-- <label for="register-form-name">Captcha:</label> -->
				<img src="${pageContext.request.contextPath }/captcha"> <br>
				<input class="form-control" type="text" name="captcha"
					style="margin-top: 5px;" /> <br> ${error1 }
			</div>
			<div class="clear"></div>

			<div class="col_full nobottommargin">
				<button type="submit" class="button button-3d button-black nomargin"
					id="register-form-submit" name="register-form-submit"
					value="register">Register Now</button>
			</div>

		</s:form>

	</div>

</div>

<script>
	var password = document.getElementById("register-form-password"), confirm_password = document
			.getElementById("register-form-repassword");

	function validatePassword() {
		if (password.value != confirm_password.value) {
			confirm_password.setCustomValidity("Passwords Don't Match");
		} else {
			confirm_password.setCustomValidity('');
		}
	}

	password.onchange = validatePassword;
	confirm_password.onkeyup = validatePassword;
</script>
