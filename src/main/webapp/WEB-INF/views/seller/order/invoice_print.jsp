<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="invoice">
    <!-- title row -->
    <div class="row">
        <div class="col-xs-12">
            <h2 class="page-header">
                <i class="fa fa-globe"></i> Seller, Inc.
                <small class="pull-right">
                    <fmt:formatDate var="dateCreate" value="${o.orders.dateCreate}" pattern="MM/dd/yyyy"/>
                    ${dateCreate}</small>
            </h2>
        </div>
        <!-- /.col -->
    </div>
    <!-- info row -->
    <div class="row invoice-info">
        <div class="col-sm-4 invoice-col">
            From
            <address>
                <strong>Seller, Inc.</strong><br>
                ${shop.name}<br>
                ${shop.address}<br>
                ${shop.email}
            </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
            To
            <address>
                <strong>User</strong><br>
                ${user.fullName}<br>
                ${user.address}<br>
                ${user.phone}<br>
                ${user.email}
            </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
            <br>
            <br>
            <b>Order ID:</b> ${orders.id}<br>
            <b>Payment Due:</b><fmt:formatDate var="dateCreate" value="${orders.dateCreate}" pattern="MM/dd/yyyy"/>${dateCreate}
            <br>
            <b>Account:</b> ${user.fullName}
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->

    <!-- Table row -->
    <div class="row">
        <div class="col-xs-12 table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Qty</th>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Description</th>
                    <th>Subtotal</th>
                </tr>
                </thead>

                <tbody>


                <tr>
                    <td>${orderdetail.quantity}</td>
                    <td>${product.name}</td>
                    <td>${product.price}</td>
                    <td>${product.description}</td>
                    <td>${orderdetail.price * orderdetail.quantity}</td>
                </tr>


                </tbody>
            </table>
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->

    <div class="row">
        <!-- accepted payments column -->
        <div class="col-xs-6">
            <p class="lead">Payment Methods:</p>
            ${orders.payment}

            <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
                ${product.description}
            </p>
        </div>
        <!-- /.col -->
        <div class="col-xs-6">
            <p class="lead"><fmt:formatDate var="dateCreate" value="${orders.dateCreate}" pattern="MM/dd/yyyy"/>${dateCreate}</p>

            <div class="table-responsive">
                <table class="table">
                    <tbody>
                    <tr>
                        <th>Total:</th>
                        <td>${orderdetail.price * orderdetail.quantity}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->

    <!-- this row will not appear when printing -->
    <div class="row no-print">
        <div class="col-xs-12">
            <a href="invoice-print.html" target="_blank" class="btn btn-default"><i class="fa fa-print"></i> Print</a>
            <button type="button" class="btn btn-success pull-right"><i class="fa fa-credit-card"></i> Submit Payment
            </button>
            <button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
                <i class="fa fa-download"></i> Generate PDF
            </button>
        </div>
    </div>
</section>
<!-- /.content -->
<div class="clearfix"></div>