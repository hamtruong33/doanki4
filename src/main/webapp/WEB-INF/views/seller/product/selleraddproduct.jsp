<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="box-header with-border">
    <h3 class="box-title">Add Product</h3>
</div>
<!-- /.box-header -->
<!-- form start -->
<form role="form" action="${pageContext.request.contextPath }/seller/product/save" method="post" enctype="multipart/form-data">
    <div class="box-body">
        <div class="form-group">
            <label for="exampleInputName">Name</label> <input type="text" name="name" required="required"
                                                              class="form-control" id="exampleInputName"
                                                              placeholder="Enter Name"/>
        </div>
        <div class="form-group">
            <label for="exampleInputPrice">Price</label> <input type="number" name="price" required="required"
                                                                class="form-control" id="exampleInputPrice"
                                                                placeholder="Price"/>
        </div>
        <div class="form-group">
            <label for="exampleInputPrice">Quantity</label> <input type="number" name="quantity" required="required"
                                                                   class="form-control" id="exampleInputQuantity"
                                                                   placeholder="Quantity">
        </div>
        <div class="form-group">
            <label for="exampleInputImages">Images input</label>
            <input type="file" name="images" required="required" id="exampleInputImages" multiple>
        </div>
        <div class="form-group">
            <label>Description</label>
            <textarea class="form-control" name="description" required="required" rows="5" placeholder="Enter ..."></textarea>
        </div>
        <div class="form-group">
            <label>Status</label>
            <div class="checkbox">
                <label> <input type="checkbox" required="required" name="status" checked="checked">
                </label>
            </div>
        </div>
        <div class="form-group">
            <label for="exampleInputPrice">Discount</label> <input type="text" name="discount" value="0"
                                                                   class="form-control" id="exampleInputDiscount"
                                                                   placeholder="discount">
        </div>

        <%--<input type="hidden" name="shopId" value="2">--%>

        <div class="form-group">
            <label>Category </label>
            <select class="form-control" name="categoryId">
                <c:forEach var="category" items="${categories}">
                    <option value="${category.id }">${category.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label>Producer </label>
            <select class="form-control" name="producerId">
                <c:forEach var="producer" items="${producers}">
                    <option value="${producer.id}"> ${producer.name}</option>
                </c:forEach>
            </select>
        </div>

    </div>
    <!-- /.box-body -->

    <div class="box-footer">
        <button type="submit" value="save" class="btn btn-primary">Save</button>
    </div>
</form>
