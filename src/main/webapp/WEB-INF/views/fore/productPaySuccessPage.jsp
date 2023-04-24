<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <link href="${pageContext.request.contextPath}/static/css/fore/fore_orderPaySuccess.css" rel="stylesheet"/>
    <title>网上支付</title>
</head>
<body>
<nav>
    <%@ include file="include/navigator.jsp" %>
    <div class="header">
        <div id="mallLogo">
            <a href="${pageContext.request.contextPath}"><img
                    src="${pageContext.request.contextPath}/static/images/fore/WebsiteImage/joygo.jpg"></a>
        </div>
        <div class="shopSearchHeader">
            <form action="${pageContext.request.contextPath}/product" method="get">
                <div class="shopSearchInput">
                    <input type="text" class="searchInput" name="product_name" placeholder="search"
                           value="${requestScope.searchValue}" maxlength="50">
                    <input type="submit" value="search" class="searchBtn">
                </div>
            </form>
            <ul>
                <c:forEach items="${requestScope.categoryList}" var="category" varStatus="i">
                    <li>
                        <a href="${pageContext.request.contextPath}/product?category_id=${category.category_id}">${category.category_name}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</nav>
<div class="content">
    <div class="content_main">
        <div id="J_AmountList">
            <h2>Payment Succeed!</h2>
            <div class="summary_pay_done">
                <ul>
                    <li>
                        Deliver to：<span>${requestScope.productOrder.productOrder_detail_address} ${requestScope.productOrder.productOrder_receiver} ${requestScope.productOrder.productOrder_mobile}</span>
                    </li>
                    <li>payment：<span><em>￥${requestScope.orderTotalPrice}</em></span></li>
                </ul>
            </div>
        </div>
        <div id="J_ButtonList">
            <span class="info">You can </span>
            <a class="J_MakePoint" href="${pageContext.request.contextPath}/order/0/10">View the items you have bought</a>
        </div>
        <div id="J_RemindList">
            <ul>
                <li class="alertLi">
                    <p>
                        <strong>reminder：</strong>
                        <span class="info">after placing the order，</span>
                        <span class="warn">The customer service will confirm the order with you, please pay attention to check!</span>
                        <span class="info">If there are any problems such as abnormal orders, please contact our customer service in time!</span>
                    </p>
                </li>
            </ul>
        </div>
        <div id="J_Qrcode">
            <div class="mui-tm">
                <%-- <a target="_blank" href="http://pages.tmall.com/wow/portal/act/app-download">
                    <img class="type2-info"
                         src="${pageContext.request.contextPath}/static/images/fore/WebsiteImage/TB1c1dwRFXXXXaMapXXXXXXXXXX-259-81.png"/>
                    <img class="type2-qrcode"
                         src="${pageContext.request.contextPath}/static/images/fore/WebsiteImage/TB1A2aISXXXXXX4XXXXwu0bFXXX.png"/>
                </a> --%>
            </div>
        </div>
    </div>
</div>
<%@include file="include/footer_two.jsp" %>
<%@include file="include/footer.jsp" %>
</body>