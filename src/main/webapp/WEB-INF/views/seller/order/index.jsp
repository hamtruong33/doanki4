<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Order Tables
        <small></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/seller/home"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="${pageContext.request.contextPath}/order">Order Tables</a></li>
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
                            <th>Payment</th>
                            <th>Status</th>
                            <th>Date Create</th>
                            <th>Option</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="o" items="${orderdetails}">
                            <tr>
                                <td>${o.id.ordersId}</td>
                                <td>${o.orders.name}</td>
                                <td>${o.orders.payment}</td>
                                <td>${o.orders.status}</td>
                                <td>
                                    <fmt:formatDate var="dateCreate" value="${o.orders.dateCreate}" pattern="MM/dd/yyyy"/>
                                        ${dateCreate}
                                </td>
                                <td><a href="${pageContext.request.contextPath}/seller/order/order-detail/${o.id.ordersId}/${o.id.productId}">Detail</a></td>
                            </tr>
                        </c:forEach>


                        </tbody>
                        <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Payment</th>
                            <th>Status</th>
                            <th>Date Create</th>
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