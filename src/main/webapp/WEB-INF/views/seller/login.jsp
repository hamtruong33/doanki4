<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<div class="card-body" style="padding: 40px;">
	<form  id="login-form" name="login-form" class="nobottommargin"
		action="${pageContext.request.contextPath }/shop/process-login" method="post">
		<h3>Login to your Account</h3>
		
		${msg }
		<div class="col_full">
			<label for="login-form-username">Username:</label> <input type="text"
				id="login-form-username" name="username" 
				class="form-control not-dark" />
		</div>

		<div class="col_full">
			<label for="login-form-password">Password:</label> <input
				type="password" id="login-form-password" name="password" 
				 class="form-control not-dark" />
		</div>

		<div class="col_full nobottommargin">
			<button type="submit" class="button button-3d button-black nomargin"
				id="login-form-submit" name="login-form-submit" value="login">Login</button>
			<a href="#" class="fright">Forgot Password?</a>
		</div>
	</form>

	<div class="line line-sm"></div>


</div>