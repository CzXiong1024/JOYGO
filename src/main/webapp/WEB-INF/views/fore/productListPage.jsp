<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<script src="${pageContext.request.contextPath}/static/js/fore/fore_productList.js"></script>
<link href="${pageContext.request.contextPath}/static/css/fore/fore_productList.css" rel="stylesheet">
<body>
<title><c:choose><c:when test="${requestScope.searchValue != null}">${requestScope.searchValue}</c:when>
    <c:otherwise><c:choose><c:when
            test="${requestScope.productList != null && fn:length(requestScope.productList)>0}">${requestScope.productList[0].product_category.category_name}</c:when><c:otherwise>No related products found</c:otherwise></c:choose></c:otherwise></c:choose></title>
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
                    <input type="text" class="searchInput" name="product_name" placeholder="Search"
                           value="${requestScope.searchValue}" maxlength="50">
                    <input type="submit" value="Search" class="searchBtn">
                </div>
            </form>
            <ul>
                <c:forEach items="${requestScope.categoryList}" var="category" varStatus="i">
                    <li>
                        <%-- <a href="${pageContext.request.contextPath}/product?category_id=${category.category_id}">${category.category_name}</a> --%>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</nav>
<div class="context">
    <c:choose>
        <c:when test="${requestScope.productList != null && fn:length(requestScope.productList)>0}">
            <div class="context_menu">
                <ul <c:choose><c:when
                        test="${requestScope.searchValue != null}"> data-value="${requestScope.searchValue}"</c:when>
                    <c:otherwise>data-type = ${requestScope.searchType}</c:otherwise></c:choose>>
                    <li data-name="product_name"
                        <c:if test="${requestScope.orderBy =='product_name' || requestScope.orderBy ==null}">class="orderBySelect"</c:if>>
                        <span>comprehensive</span>
                        <span class="orderByAsc"></span>
                    </li>
                    <li data-name="product_create_date"
                        <c:if test="${requestScope.orderBy =='product_create_date'}">class="orderBySelect"</c:if>>
                        <span>new</span>
                        <span class="orderByAsc"></span>
                    </li>
                    <li data-name="product_sale_count"
                        <c:if test="${requestScope.orderBy =='product_sale_count'}">class="orderBySelect"</c:if>>
                        <span>sales</span>
                        <span class="orderByAsc"></span>
                    </li>
                    <li data-name="product_sale_price"
                        <c:if test="${requestScope.orderBy =='product_sale_price'}">class="orderBySelect"</c:if>>
                        <span style="position: relative;left: 3px">price</span>
                        <span class="orderByDesc <c:if test="${requestScope.isDesc == true}">orderBySelect</c:if>"
                              style="bottom: 5px; left: 6px;"></span>
                        <span class="orderByAsc <c:if test="${requestScope.isDesc == false}">orderBySelect</c:if>"
                              style="top:4px;right: 5px;"></span>
                    </li>
                </ul>
            </div>
            <div class="context_main">
                <c:forEach items="${requestScope.productList}" var="product">
                    <div class="context_productStyle">
                        <div class="context_product">
                            <a href="${pageContext.request.contextPath}/product/${product.product_id}"
                               target="_blank"><img class="context_product_imgMain"
                                                    src="${product.singleProductImageList[0].productImage_src}"/></a>
                            <ul class="context_product_imgList">
                                <c:forEach items="${product.singleProductImageList}" var="img">
                                    <li><img
                                            src="${img.productImage_src}"/>
                                    </li>
                                </c:forEach>
                            </ul>
                            <p class="context_product_price"><span>$</span>${product.product_sale_price}</p>
                            <p class="context_product_name"><a href="/mall/product/${product.product_id}"
                                                               target="_blank">${product.product_name}</a></p>
                            <%-- <p class="context_product_shop"><span>贤趣${product.product_category.category_name}旗舰店</span> --%>
                            </p>
                            <p class="context_product_status">
                                <span class="status_left">total sales<em><c:choose><c:when
                                        test="${product.product_sale_count != null}">${product.product_sale_count}</c:when><c:otherwise>0</c:otherwise></c:choose></em></span>
                                <span class="status_middle">reviews<em>${product.product_review_count}</em></span>
                                <span class="status_right">
                                   <%-- <img src="${pageContext.request.contextPath}/static/images/fore/WebsiteImage/T11lggFoXcXXc1v.nr-93-93.png"/>--%>
                                </span>
                            </p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="error">
                <h2>No products related to “${requestScope.searchValue}” have been found!</h2>
                <h3>Please：</h3>
                <ol>
                    <li>Check if the entered text is correct</li>
                    <li>Adjust keywords, such as "full copper shower kit" to "shower" or "shower kit"</li>
                    <li>
                        <form action="${pageContext.request.contextPath}/product" method="get">
                            <input title="Inquire about products" type="text" class="errorInput" name="product_name"
                                   value="${requestScope.searchValue}">
                            <input type="submit" value="Search in Bookstore" class="errorBtn">
                        </form>
                    </li>
                </ol>
            </div>
        </c:otherwise>
    </c:choose>
   <%-- <%@include file="include/page.jsp"%>--%>
</div>
<%@ include file="include/footer_two.jsp" %>
<%@ include file="include/footer.jsp" %>
</body>