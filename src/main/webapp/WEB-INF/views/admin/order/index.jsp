<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Order Tables
        <small>advanced tables</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/admin/home"><i class="fa fa-dashboard"></i> Order</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/order">Order Tables</a></li>
        <li class="active">Order tables</li>
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
                  <th>User ID</th>
                  <th>Shop ID</th>
                  <th>HTTT</th> 
                  <th>Date Create</th>
                  <th>Status</th> 
                  <th>Option</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>1</td>
                  <td>Order 1</td>                  
                  <td>1</td>
                  <td>1</td>
                  <td>COD</td>
                  <td>20-10-2018</td>
                  <td>true</td>                                 
                  <th><a href="#">Detail</a></th>
                </tr>  
                <tr>
                  <td>2</td>
                  <td>Order 2</td>                  
                  <td>2</td>
                  <td>1</td>
                  <td>COD</td>
                  <td>15-10-2018</td>
                  <td>true</td>                                 
                  <th><a href="#">Detail</a></th>
                </tr>  
                <tr>
                  <td>3</td>
                  <td>Order 3</td>                  
                  <td>4</td>
                  <td>3</td>
                  <td>COD</td>
                  <td>12-10-2018</td>
                  <td>true</td>                                 
                  <th><a href="#">Detail</a></th>
                </tr>  
                <tr>
                  <td>4</td>
                  <td>Order 4</td>                  
                  <td>3</td>
                  <td>3</td>
                  <td>COD</td>
                  <td>14-10-2018</td>
                  <td>false</td>                                 
                  <th><a href="#">Detail</a></th>
                </tr>                
                </tbody>
                <tfoot>
                <tr>
                  <th>ID</th>
                  <th>Name</th> 
                  <th>User ID</th>
                  <th>Shop ID</th>
                  <th>HTTT</th> 
                  <th>Date Create</th>
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