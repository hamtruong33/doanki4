<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>


  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>

	<s:form modelAttribute="user"
		action="${pageContext.request.contextPath}/admin/process_login"
		method="post">
    ${msg }
      <div class="form-group has-feedback">
			<s:input type="text" class="form-control" placeholder="Username"
				path="username" />
			<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
		</div>
		<div class="form-group has-feedback">
			<s:input type="password" class="form-control" placeholder="Password"
				path="password" />
			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		</div>
		<div class="row">
			<div class="col-xs-8">
				<div class="checkbox icheck">
					<label> <input type="checkbox"> Remember Me
					</label>
				</div>
			</div>
			<!-- /.col -->
			<div class="col-xs-4">
				<button type="submit" class="btn btn-primary btn-block btn-flat">Sign
					In</button>
			</div>
			<!-- /.col -->
		</div>
	</s:form>



</div>

