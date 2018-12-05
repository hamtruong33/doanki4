<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mb-5 mt-5" style="margin-top:10rem !important;">
    <p style="color: red">${msg}</p>
    <div class="pricing card-deck flex-column flex-md-row mb-3">

        <div class="card card-pricing text-center px-3 mb-4">
            <span class="h6 w-60 mx-auto px-4 py-1 rounded-bottom bg-primary text-white shadow-sm">${membership1.packageMember}</span>
            <div class="bg-transparent card-header pt-4 border-0">
                <h1 class="h1 font-weight-normal text-primary text-center mb-0" data-pricing-value="15">$<span
                        class="price">${membership1.price}</span><span class="h6 text-muted ml-2">/ 1 month</span></h1>
            </div>
            <div class="card-body pt-0">
                <ul class="list-unstyled mb-4">
                    <li>Thirty days</li>
                    <li>Basic support by AdminTeam</li>
                    <li>Monthly updates</li>
                </ul>
                <form action="${paypalConfig.posturl }" method="post">
                    <input type="hidden" name="upload" value="1"/>
                    <input type="hidden" name="return" value="${paypalConfig.returnurl1 }/${membership1.id}"/>
                    <input type="hidden" name="cmd" value="_xclick"/>
                    <input type="hidden" name="business" value="${paypalConfig.business }"/>

                    <input type="hidden" name="item_number" value="${membership1.id}">
                    <input type="hidden" name="item_name" value="${membership1.packageMember}">
                    <input type="hidden" name="amount" value="${membership1.price}">
                    <input type="hidden" name="quantity" value="1">

                    <input type="image" src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif"
                           style="width: auto" height="50px">
                </form>
                <%--<a href="#" target="_blank" class="btn btn-primary mb-3">Order Now</a>--%>
            </div>
        </div>

        <div class="card card-pricing popular shadow text-center px-3 mb-4">
            <span class="h6 w-60 mx-auto px-4 py-1 rounded-bottom bg-primary text-white shadow-sm">${membership2.packageMember}</span>
            <div class="bg-transparent card-header pt-4 border-0">
                <h1 class="h1 font-weight-normal text-primary text-center mb-0" data-pricing-value="30">$<span
                        class="price">${membership2.price}</span><span class="h6 text-muted ml-2">/ 2 month</span></h1>
            </div>
            <div class="card-body pt-0">
                <ul class="list-unstyled mb-4">
                    <li>Sixty days</li>
                    <li>Basic support by AdminTeam</li>
                    <li>Update Two monthly</li>
                </ul>
                <form action="${paypalConfig.posturl }" method="post">
                    <%--<input type="hidden" name="upload" value="1"/>--%>
                    <input type="hidden" name="return" value="${paypalConfig.returnurl1 }/${membership2.id}"/>
                    <input type="hidden" name="cmd" value="_xclick"/>
                    <input type="hidden" name="business" value="${paypalConfig.business }"/>

                    <input type="hidden" name="item_number" value="${membership2.id}">
                    <input type="hidden" name="item_name" value="${membership2.packageMember}">
                    <input type="hidden" name="amount" value="${membership2.price}">
                    <input type="hidden" name="quantity" value="1">

                    <input type="image" src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif"
                           style="width: auto" height="50px">
                </form>
            </div>
        </div>
        <div class="card card-pricing text-center px-3 mb-4">
            <span class="h6 w-60 mx-auto px-4 py-1 rounded-bottom bg-primary text-white shadow-sm">${membership3.packageMember}</span>
            <div class="bg-transparent card-header pt-4 border-0">
                <h1 class="h1 font-weight-normal text-primary text-center mb-0" data-pricing-value="45">$<span
                        class="price">${membership3.price}</span><span class="h6 text-muted ml-2">/ 3 month</span></h1>
            </div>
            <div class="card-body pt-0">
                <ul class="list-unstyled mb-4">
                    <li>Ninety days</li>
                    <li>Basic support by AdminTeam</li>
                    <li>Update three monthly</li>
                </ul>
                <form action="${paypalConfig.posturl }" method="post">
                    <%--<input type="hidden" name="upload" value="1"/>--%>
                    <input type="hidden" name="return" value="${paypalConfig.returnurl1 }/${membership3.id}"/>
                    <input type="hidden" name="cmd" value="_xclick"/>
                    <input type="hidden" name="business" value="${paypalConfig.business }"/>

                        <input type="hidden" name="item_number" value="${membership3.id}">
                        <input type="hidden" name="item_name" value="${membership3.packageMember}">
                        <input type="hidden" name="amount" value="${membership3.price}">
                        <input type="hidden" name="quantity" value="1">

                    <input type="image" src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif"
                           style="width: auto" height="50px">
                </form>
            </div>
        </div>
        <div class="card card-pricing text-center px-3 mb-4">
            <span class="h6 w-60 mx-auto px-4 py-1 rounded-bottom bg-primary text-white shadow-sm">${membership5.packageMember}</span>
            <div class="bg-transparent card-header pt-4 border-0">
                <h1 class="h1 font-weight-normal text-primary text-center mb-0" data-pricing-value="60">$<span
                        class="price">${membership5.price}</span><span class="h6 text-muted ml-2">/ 6 month</span></h1>
            </div>
            <div class="card-body pt-0">
                <ul class="list-unstyled mb-4">
                    <li>Six month</li>
                    <li>Basic support by AdminTeam</li>
                    <li>Update six monthly</li>
                </ul>
                <form action="${paypalConfig.posturl }" method="post">
                    <%--<input type="hidden" name="upload" value="1"/>--%>
                    <input type="hidden" name="return" value="${paypalConfig.returnurl1 }/${membership5.id}"/>
                    <input type="hidden" name="cmd" value="_xclick"/>
                    <input type="hidden" name="business" value="${paypalConfig.business }"/>

                        <input type="hidden" name="item_number" value="${membership5.id}">
                        <input type="hidden" name="item_name" value="${membership5.packageMember}">
                        <input type="hidden" name="amount" value="${membership5.price}">
                        <input type="hidden" name="quantity" value="1">

                    <input type="image" src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif"
                           style="width: auto" height="50px">
                </form>
            </div>
        </div>

    </div>
</div>
