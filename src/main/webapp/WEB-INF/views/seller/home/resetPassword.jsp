<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<div class="login-box">
    <div class="login-logo">
        <a href=""><b>Seller</b>Multivendor</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">Forgot password</p>

        <form action="${pageContext.request.contextPath}/seller/home/setNewPassword?token=${token }" method="post">
            <p style="color: red">${msg}</p>
            <div class="form-group has-feedback">
                <input type="password" required="required" name="newpassword" class="form-control" placeholder="New Password">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" required="required" name="confirmpassword" class="form-control" placeholder="Confirm Password">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="row">
                <!-- /.col -->
                <div class="col-xs-4">
                    <input type="submit" class="btn btn-primary btn-block btn-flat" value="Save"></input>
                </div>
                <!-- /.col -->
            </div>
        </form>

    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="${pageContext.request.contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${pageContext.request.contextPath}/resources/plugins/iCheck/icheck.min.js"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' /* optional */
        });
    });
</script>


