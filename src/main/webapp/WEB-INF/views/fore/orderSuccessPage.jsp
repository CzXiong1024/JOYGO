<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <link href="${pageContext.request.contextPath}/static/css/fore/fore_orderSuccessPage.css" rel="stylesheet"/>
    <title>交易成功</title>
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
                <input type="text" class="searchInput" name="product_name" placeholder="Search"
                       maxlength="50">
                <input type="submit" value="Search" class="searchBtn">
            </div>
        </form>
    </div>
</div>
<div class="content">
    <div class="take-delivery">
        <div class="summary-status">
            <h2>Deal succeeded</h2>
            <c:if test="${requestScope.product != null}">
                <div class="successInfo">
                    <ul class="info-rate-coin">
                        <li>
                            <span class="review_msg">Carefully fill in the product evaluation, and you will have the opportunity to get experience points!</span>
                            <a class="J_makePoint"
                               href="${pageContext.request.contextPath}/review/${requestScope.orderItem.productOrderItem_id}">
                                <img src="${requestScope.product.singleProductImageList[0].productImage_src}"
                                     width="100px" height="100px"/>
                                <p class="product_name"
                                   title="${requestScope.product.product_name}">${requestScope.product.product_name}</p>
                                <span class="vi-btn">Comment now</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </c:if>
            <p>Review：<a href="${pageContext.request.contextPath}/order/0/10">products used to buy</a></p>
        </div>
    </div>
</div>
<%@include file="include/footer_two.jsp" %>
<%@include file="include/footer.jsp" %>
</body>