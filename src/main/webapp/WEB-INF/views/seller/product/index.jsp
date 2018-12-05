<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%-- <jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder" />
<c:url value="/product" var="pagedLink">
	<c:param name="p" value="~" />
</c:url> --%>
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Product Tables
        <small>advanced tables</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/seller/shop"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="${pageContext.request.contextPath}/seller/product">Product Tables</a></li>
        <li class="active">Product tables</li>
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
                <%-- <tg:paging pagedListHolder="${pagedListHolder}"
                pagedLink="${pagedLink}" /> --%>
                <!-- /.box-header -->
                <div class="box-body">
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Description</th>
                            <th>Status</th>
                            <%-- <th>Category </th>                   --%>
                            <th>Discount</th>
                            <%-- <th>Producer </th>                   --%>
                            <th>Option</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="product" items="${products }">
                            <tr>
                                <td>${product.id}</td>
                                <td>${product.name}</td>
                                <td>${product.price}</td>
                                <td>${product.quantity}</td>
                                <td>${product.description}</td>
                                <td>${product.status}</td>
                                    <%-- <td>${product.category}</td> --%>
                                <td>${product.discount}</td>
                                    <%-- <td>${product.producer}</td>                   --%>
                                <th><a href="${pageContext.request.contextPath }/seller/product/update/${product.id}">Edit</a>|
                                    <a href="${pageContext.request.contextPath }/seller/product/delete/${product.id }"
                                       onclick="return confirm(' Are you sure?')">Delete</a></th>
                            </tr>
                        </c:forEach>

                        </tbody>
                        <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Description</th>
                            <th>Status</th>
                            <%-- <th>Category </th>                   --%>
                            <th>Discount</th>
                            <%-- <th>Producer </th>                   --%>
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