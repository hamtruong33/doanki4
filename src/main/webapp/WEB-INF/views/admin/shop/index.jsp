<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Shop Tables
        <small>advanced tables</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/admin/home"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/product">Shop Tables</a></li>
        <li class="active">Shop tables</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12"> 
          <div class="box">
            <div class="box-header">
             <!--  <h3 class="box-title">Data Table With Full Features</h3> -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                 <th>ID</th>
                  <th>Name</th>                  
                  <th>Description</th>
                  <th>User Id</th>
                  <th>Status</th>                  
                  <th>Option</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>01</td>
                  <td>Shop 1</td>
                  <td>shop user 1</td>
                  <td>1 </td>  
                  <td>true</td>
                </tr>
                <tr>
                  <td>03</td>
                  <td>Shop 3</td>
                  <td>shop user 3</td>
                  <td>3 </td>  
                  <td>true</td>
                </tr>
                <tr>
                  <td>04</td>
                  <td>Shop 4</td>
                  <td>shop user 4</td>
                  <td>4 </td>  
                  <td>true</td>
                </tr>
                <tr>
                  <td>05</td>
                  <td>Shop 5</td>
                  <td>shop user 5</td>
                  <td>5 </td>  
                  <td>true</td>
                </tr>
                </tbody>
                <tfoot>
                <tr>
                  <th>ID</th>
                  <th>Name</th>                  
                  <th>Description</th>
                  <th>User Id</th>
                  <th>Status</th>                  
                  <th>Option</th>
                </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>