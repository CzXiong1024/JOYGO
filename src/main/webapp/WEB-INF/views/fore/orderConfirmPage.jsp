<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <link href="${pageContext.request.contextPath}/static/css/fore/fore_orderConfirmPage.css" rel="stylesheet"/>
    <title>confirm the receipt of goods</title>
    <script>

    </script>
</head>
<body>
<nav>
    <%@ include file="include/navigator.jsp" %>
</nav>
<div class="header">
    <div id="mallLogo">
        <a href="${pageContext.request.contextPath}"><img
                src="${pageContext.request.contextPath}/static/images/fore/WebsiteImage/joygo.jpg"></a>
    </div>
    <div class="shopSearchHeader">
        <form action="${pageContext.request.contextPath}/product" method="get">
            <div class="shopSearchInput">
                <input type="text" class="searchInput" name="product_name" placeholder="Search "
                       maxlength="50">
                <input type="submit" value="Search" class="searchBtn">
            </div>
        </form>
    </div>
</div>
<div class="headerLayout">
    <div class="headerContext">
        <ol class="header-extra">
            <li class="step-done">
                <div class="step-name">Buy the product</div>
                <div class="step-no_first"></div>
                <div class="step-time">
                    <div class="step-time-wraper">${productOrder.productOrder_pay_date}</div>
                </div>
            </li>
            <li class="step-done">
                <div class="step-name">Pay by Alipay</div>
                <div class="step-no step-no-select"></div>
                <div class="step-time">
                    <div class="step-time-wraper">${productOrder.productOrder_pay_date}</div>
                </div>
            </li>
            <li class="step-done">
                <div class="step-name">Shipping</div>
                <div class="step-no step-no-select"></div>
                <div class="step-time">
                    <div class="step-time-wraper">${productOrder.productOrder_delivery_date}</div>
                </div>
            </li>
            <li class="step-no">
                <div class="step-name">order confirmation</div>
                <div class="step-no">4</div>
            </li>
            <li class="step-no">
                <div class="step-name">review</div>
                <div class="step-no_last">5</div>
            </li>
        </ol>
    </div>
</div>
<div class="content">
    <h1>I have received the good</h1>
    <div class="order_info">
        <h2>Confirm Order Information</h2>
        <table class="table_order_orderItem">
            <thead>
            <tr>
                <th>Product</th>
                <th>unit price</th>
                <th>quantity</th>
                <th>total</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.productOrder.productOrderItemList}" var="orderItem" varStatus="i">
                <tr class="tr_product_info">
                    <td width="500px"><img
                            src="${orderItem.productOrderItem_product.singleProductImageList[0].productImage_src}"
                            style="width: 50px;height: 50px;"/><span class="span_product_name"><a
                            href="${pageContext.request.contextPath}/product/${orderItem.productOrderItem_product.product_id}"
                            target="_blank">${orderItem.productOrderItem_product.product_name}</a></span>
                    </td>
                    <td><span
                            class="span_product_sale_price">${orderItem.productOrderItem_product.product_sale_price}0</span>
                    </td>
                    <td><span class="span_productOrderItem_number">${orderItem.productOrderItem_number}</span></td>
                    <td><span class="span_productOrderItem_price"
                              style="font-weight: bold">${orderItem.productOrderItem_price}0</span></td>
                </tr>
            </c:forEach>
            <tr class="order-ft">
                <td colspan="4">
                    <div class="total-price">real payment：￥<strong>${requestScope.orderTotalPrice}0</strong></div>
                </td>
            </tr>
            </tbody>
            <tbody class="misc-info">
            <tr class="set-row">
                <td colspan="4"></td>
            </tr>
            <tr>
                <td colspan="4">
                    <span class="info_label">Order No.：</span>
                    <span class="info_value">${requestScope.productOrder.productOrder_code}</span>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <span class="info_label">Deal Time：</span>
                    <span class="info_value">${requestScope.productOrder.productOrder_pay_date}</span>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="order-dashboard">
            <div class="bd">
                <ul>
                    <li>Please confirm receipt after receiving the goods! Otherwise you risk losing both your money and your goods</li>
                    <li class="message">Tip: This system will not conduct real transactions, please rest assured to test</li>
                </ul>
                <script>
                    function confirmOrder() {
                        var yn = confirm("After clicking confirm, the ${requestScope.orderTotalPrice} you paid to Alipay before will be directly transferred to the seller's account, please be sure to receive the goods before confirming!");
                        if (yn) {
                            $.ajax({
                                url: "/mall/order/success/${requestScope.productOrder.productOrder_code}",
                                type: "PUT",
                                data: null,
                                dataType: "json",
                                success: function (data) {
                                    if (data.success) {
                                        location.href = "/mall/order/success/${requestScope.productOrder.productOrder_code}";
                                    } else {
                                        alert("The order confirmation is abnormal, please try again later!");
                                        location.href = "/mall/order/0/10";
                                    }
                                },
                                error: function (data) {
                                    alert("The order confirmation is abnormal, please try again later!");
                                    location.href = "/mall/order/0/10";
                                }
                            });
                        }
                    }
                </script>
                <a href="javascript:void(0)" onclick="confirmOrder()">Confirm</a>
            </div>
        </div>
    </div>
</div>
<%@include file="include/footer_two.jsp" %>
<%@include file="include/footer.jsp" %>
</body>
