<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>



<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        User Profile
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">Seller profile</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">

    <div class="row">
        <div class="col-md-3">

            <!-- Profile Image -->
            <div class="box box-primary">
                <div class="box-body box-profile">

                    <img class="profile-user-img img-responsive img-circle"
                         src="${pageContext.request.contextPath}/resources/profileSellerUpload/${shop.profile}"
                         alt="User profile picture">

                    <h3 class="profile-username text-center">${shop.name}</h3>

                    <p class="text-muted text-center">${shop.description}</p>



                    <button type="button" class="btn btn-default" style="margin-left: 80px;" data-toggle="modal" data-target="#modal-default">
                        Update Profile
                    </button>

                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
            <div class="modal fade" id="modal-default">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Update Profile Shop</h4>
                        </div>
                        <div class="modal-body">
                            <form id="uploadProfileForm" action="${pageContext.request.contextPath}/seller/home/updateProfile" method="post" enctype="multipart/form-data">
                                <input type="file" name="profile" placeholder="Shop Profile"  />

                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                            <button form="uploadProfileForm" type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>


        </div>
        <!-- /.col -->
        <div class="col-md-9">
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#description" data-toggle="tab" aria-expanded="true">Description</a></li>
                    <li class="active"><a href="#settings" data-toggle="tab" aria-expanded="true">Settings</a></li>
                </ul>

                <div class="tab-content">
                    <div class="active tab-pane " id="description">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="inputName" class="col-sm-2 control-label">Name</label>
                                <div class="col-sm-10">
                                    <label>${shop.name}</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                                <div class="col-sm-10">
                                    <label>${shop.email}</label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputExperience" class="col-sm-2 control-label">Description</label>

                                <div class="col-sm-10">
                                    <label>${shop.description}</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputSkills" class="col-sm-2 control-label">Address</label>

                                <div class="col-sm-10">
                                    <label>${shop.address}</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <div class="checkbox">
                                        <label>
                                            <a href="#settings" data-toggle="tab" aria-expanded="true">Update</a>
                                        </label>
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>

                    <div class="tab-pane " id="settings">
                        <form action="${pageContext.request.contextPath}/seller/home/updateInformation" method="post" class="form-horizontal">
                            <div class="form-group">
                                <label for="inputName" class="col-sm-2 control-label">Name</label>

                                <div class="col-sm-10">
                                    <input type="text" name="name" required="required" value="${shop.name}" class="form-control" id="inputName" placeholder="Name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                                <div class="col-sm-10">
                                    <input type="email" required="required" value="${shop.email}" name="email" class="form-control" id="inputEmail" placeholder="Email">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputExperience" class="col-sm-2 control-label">Description</label>

                                <div class="col-sm-10">
                                    <textarea class="form-control" required="required" name="description" id="inputExperience"
                                              placeholder="Description">${shop.description}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputSkills" class="col-sm-2 control-label">Address</label>

                                <div class="col-sm-10">
                                    <input type="text" name="address" required="required" value="${shop.address}" class="form-control" id="inputSkills" placeholder="Address">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputSkills"  class="col-sm-2 control-label">IdentityCard</label>

                                <div class="col-sm-10">
                                    <input type="text" name="identityCard" required="required" value="${shop.identityCard}" class="form-control"  placeholder="IdentityCard">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputSkills"  class="col-sm-2 control-label">BankNumber</label>

                                <div class="col-sm-10">
                                    <input type="text" name="bankNumber" required="required" value="${shop.bankNumber}" class="form-control"  placeholder="IdentityCard">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-danger">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
            </div>
            <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->

</section>
<!-- /.content -->
