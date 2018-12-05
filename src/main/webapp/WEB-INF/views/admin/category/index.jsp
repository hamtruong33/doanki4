<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Category Tables
        <small>advanced tables</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/admin/home"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/category">Category Tables</a></li>
        <li class="active">Category tables</li>
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
                  <th>Tier</th>
                  <th>Option</th>                  
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>01</td>
                  <td>Dien thoai</td>
                  <td>1</td>                
                  <th><a href="#">Edit</a>|<a href="#">Delete</a></th>
                </tr>
                <tr>
                  <td>02</td>
                  <td>PC</td>
                  <td>1</td>                
                  <th><a href="#">Edit</a>|<a href="#">Delete</a></th>
                </tr>
                <tr>
                  <td>03</td>
                  <td>Dien thoai</td>
                  <td>2</td>                
                  <th><a href="#">Edit</a>|<a href="#">Delete</a></th>
                </tr>
                <tr>
                  <td>04</td>
                  <td>Laptop</td>
                  <td>2</td>                
                  <th><a href="#">Edit</a>|<a href="#">Delete</a></th>
                </tr>
                </tbody>
                <tfoot>
                <tr>
                  <th>ID</th>
                  <th>Name</th>
                  <th>Tier</th>
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