<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<div class="register-box">
    <div class="register-logo">
        <a href=""><b>Seller</b>LTE</a>
    </div>

    <div class="register-box-body">
        <p class="login-box-msg">Register a new membership</p>

        <form action="${pageContext.request.contextPath}/seller/home/save" method="post" enctype="multipart/form-data">
            <p style="color: red">${msg}</p>

            <!-- NAME -->
            <div class="form-group has-feedback">
                <input type="text" required="required" class="form-control" name="name" placeholder="Shop name"/>
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <!-- EMAIL -->
            <div class="form-group has-feedback">
                <input type="email" required="required" class="form-control" name="email" placeholder="Email"/>
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <!-- PASSWORD -->
            <div class="form-group has-feedback">
                <input type="password" required="required" class="form-control" name="password" placeholder="Password"/>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" required="required" class="form-control" placeholder="Retype password">
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
            </div>
            <input type="hidden" name="membershipId" value="4">
            <!-- ADDRESS -->
            <div class="form-group has-feedback">
                <input type="text" class="form-control" required="required" name="address" placeholder="Address"/>
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <!-- DATE_CREATE -->
            <%--<input type="hidden" class="form-control" name="dateCreate" placeholder="DateCreate"/>--%>
            <!-- VOTE -->
            <input type="hidden" class="form-control" name="vote" placeholder="Vote "/>

            <!-- Profile -->
            <div class="form-group has-feedback">
                <input type="file" class="form-control" required="required" name="profile" placeholder="Shop Profile" multiple="multiple" style="height: auto" />

            </div>
            <!-- IDENTITYCARD -->
            <div class="form-group has-feedback">
                <input type="number" class="form-control" required="required" name="identityCard " placeholder="IDENTITYCARD"/>

            </div>
            <!-- BANK_NUMBER -->
            <div class="form-group has-feedback">
                <input type="number" class="form-control" required="required" name="bankNumber" placeholder="BANK_NUMBER"/>

            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label class="">
                            <div class="icheckbox_square-blue" style="position: relative;" aria-checked="false"
                                 aria-disabled="false">
                                <input type="checkbox" required="required" name="status"
                                       style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"/>
                                <ins class="iCheck-helper"
                                     style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins>
                            </div>
                            I agree to the <a href="#">terms</a>
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">Register</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

        <%--<div class="social-auth-links text-center">--%>
            <%--<p>- OR -</p>--%>
            <%--<a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign up--%>
                <%--using--%>
                <%--Facebook</a>--%>
            <%--<a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign up--%>
                <%--using--%>
                <%--Google+</a>--%>
        <%--</div>--%>

        <a href="${pageContext.request.contextPath}/seller" class="text-center">I already have a membership</a>
    </div>
    <!-- /.form-box -->
</div>