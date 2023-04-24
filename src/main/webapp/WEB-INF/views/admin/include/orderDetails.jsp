<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <script>
        $(function () {
            //设置订单状态
            var status_index = '${requestScope.order.productOrder_status}';
            switch (status_index) {
                case '0':
                    $("#wait_point_1").addClass("wait_point_select").children(".wait_point_text").addClass('td_special');
                    break;
                case '1':
                    $("#wait_point_2").addClass("wait_point_select").children(".wait_point_text").addClass('td_special');
                    break;
                case '2':
                    $("#wait_point_3").addClass("wait_point_select").children(".wait_point_text").addClass('td_special');
                    break;
                case '3':
                    $("#wait_point_4").addClass("wait_point_select").children(".wait_point_text").addClass('td_special');
                    break;
                default:
                    $("#wait_point_1").children(".wait_point_text").addClass('td_special').text("Transaction Closed").prev("span").text('×');
                    $("#wait_point_1").addClass("wait_point_select");
            }

            /******
             * event
             ******/
            //单击取消按钮时
            $("#btn_order_cancel").click(function () {
                $(".menu_li[data-toggle=order]").click();
            });
            //单击发货按钮时
            $("#btn_order_save").click(function () {
                var order_id = '${requestScope.order.productOrder_id}';
                $.ajax({
                    url: "./admin/order/" + order_id,
                    type: "PUT",
                    data: null,
                    success: function (data) {
                        $("#btn_order_save").remove();
                        if (data.success) {
                            $("#btn-ok,#btn-close").unbind("click").click(function () {
                                $('#modalDiv').modal("hide");
                                setTimeout(function () {
                                    //ajax请求页面
                                    ajaxUtil.getPage("order/" + data.order_id, null, true);
                                }, 170);
                            });
                            $(".modal-body").text("Shipping！");
                            $('#modalDiv').modal();
                        }
                    },
                    beforeSend: function () {
                        $("#btn_order_save").attr("disabled", true).val("Shipping...");
                    },
                    error: function () {

                    }
                });
            });
        });

        //获取产品子界面
        function getChildPage(obj) {
            //设置样式
            $("#div_home_title").children("span").text("Product Detail");
            document.title = "JoyGo - Product Detail";
            //ajax请求页面
            ajaxUtil.getPage("product/" + $(obj).parents("tr").find(".product_id").text(), null, true);
        }

        //获取用户子界面
        function getUserPage(id) {
            //设置样式
            $("#div_home_title").children("span").text("User Detail");
            document.title = "JoyGo - User Detail";
            //ajax请求页面
            ajaxUtil.getPage("user/" + id, null, true);
        }
    </script>
    <style rel="stylesheet">
        #wait {
            width: 600px;
            height: 2px;
            background-color: #ccc;
            border-radius: 5px;
            position: relative;
            margin: 30px 0 0 50px;
        }

        .wait_point {
            position: absolute;
            width: 1.4em;
            height: 1.4em;
            line-height: 1.4em;
            text-align: center;
            border-radius: 50%;
            background: #ccc;
        }

        .wait_point_select {
            background: #FF7874;
        }

        .wait_point > span {
            position: relative;
            top: 1px;
            color: white;
        }

        .wait_point > .wait_point_text {
            font-size: 12px;
            width: 6em;
            margin-left: -25px;
            color: #666;
            margin-top: 3px;
        }

        .details_status_spacial {
            height: 110px;
        }

        #table_orderItem_list th:first-child {
            width: auto;
        }
    </style>
</head>
<body>
<div class="details_div_first">
    <input type="hidden" value="${requestScope.order.productOrder_id}" id="details_order_id"/>
    <div class="frm_div">
        <label class="frm_label text_info" id="lbl_order_id">Order No.</label>
        <span class="details_value" id="span_order_id">${requestScope.order.productOrder_code}</span>
    </div>
    <div class="frm_div">
        <label class="frm_label text_info" id="lbl_order_user">Belong to the User</label>
        <span class="details_value td_wait"><a id="span_order_user" href="javascript:void(0)"
                                               onclick="getUserPage(${requestScope.order.productOrder_user.user_id})">${requestScope.order.productOrder_user.user_nickname}</a></span>
    </div>
</div>
<div class="details_div">
    <span class="details_title text_info">Basic Information</span>
    <div class="frm_div">
        <label class="frm_label text_info" id="lbl_order_receiver">Consignee name</label>
        <span class="details_value" id="span_order_receiver">${requestScope.order.productOrder_receiver}</span>
    </div>
    <div class="frm_div">
        <label class="frm_label text_info" id="lbl_order_address">Shipping address</label>
        <span class="details_value details_value_noRows"
              id="span_order_address">${requestScope.order.productOrder_detail_address}</span>
    </div>
    <div class="frm_div">
        <label class="frm_label text_info" id="lbl_product_title">Post code</label>
        <span class="details_value" id="span_order_post">${requestScope.order.productOrder_post}</span>
        <label class="frm_label text_info" id="lbl_order_mobile">Contact number</label>
        <span class="details_value" id="span_order_mobile">${requestScope.order.productOrder_mobile}</span>
    </div>
</div>
<div class="details_div details_status_spacial">
    <span class="details_title text_info">Order Status</span>
    <div id="wait">
        <div class="wait_point" id="wait_point_1" style="top:-0.7em;left: 0;">
            <span>1</span>
            <div class="wait_point_text">Waiting for payment</div>
        </div>
        <div class="wait_point" id="wait_point_2" style="top:-0.7em;left: 33%;">
            <span>2</span>
            <div class="wait_point_text">Waiting for shipping</div>
        </div>
        <div class="wait_point" id="wait_point_3" style="top:-0.7em;left: 66%;">
            <span>3</span>
            <div class="wait_point_text">Waiting for buyer confirmation</div>
        </div>
        <div class="wait_point" id="wait_point_4" style="top:-0.7em;left: 100%;">
            <span>4</span>
            <div class="wait_point_text">Transaction Complete!</div>
        </div>
    </div>
</div>
<div class="details_div">
    <span class="details_title text_info">Order Information</span>
    <table class="table_normal" id="table_orderItem_list">
        <thead class="text_info">
        <tr>
            <th>product image</th>
            <th>product name</th>
            <th>unit price</th>
            <th>quantity</th>
            <th>total price</th>
            <th>remark</th>
            <th>manipulate</th>
            <th hidden class="product_id">Product ID</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.order.productOrderItemList}" var="item" varStatus="i">
            <tr>
                <td title="产品图片"><img
                        src="${pageContext.request.contextPath}/static/images/item/productSinglePicture/${item.productOrderItem_product.singleProductImageList[0].productImage_src}"
                        id="pic_single_${item.productOrderItem_product.singleProductImageList[0].productImage_id}"
                        width="42px" height="42px"
                        name="${item.productOrderItem_product.singleProductImageList[0].productImage_id}"/></td>
                <td title="${item.productOrderItem_product.product_name}">${item.productOrderItem_product.product_name}</td>
                <td title="${item.productOrderItem_price/item.productOrderItem_number}">${item.productOrderItem_price/item.productOrderItem_number}</td>
                <td title="${item.productOrderItem_number}">${item.productOrderItem_number}</td>
                <td title="${item.productOrderItem_price}">${item.productOrderItem_price}</td>
                <td title="${item.productOrderItem_userMessage}">${item.productOrderItem_userMessage}</td>
                <td><span class="td_special" title="view product details"><a href="javascript:void(0)"
                                                               onclick="getChildPage(this)">详情</a></span></td>
                <td hidden><span class="product_id">${item.productOrderItem_product.product_id}</span></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<c:if test="${requestScope.order.productOrder_status != 0 && requestScope.order.productOrder_status != 4}">
    <div class="details_div details_div_last">
        <span class="details_title text_info">process time</span>
        <div class="frm_div">
            <label class="frm_label text_info" id="lbl_order_pay_date">payment date</label>
            <span class="details_value details_value_noRows"
                  id="span_order_pay_date">${requestScope.order.productOrder_pay_date}</span>
        </div>
        <c:if test="${requestScope.order.productOrder_status != 1}">
            <div class="frm_div">
                <label class="frm_label text_info" id="lbl_order_delivery_date">shipping date</label>
                <span class="details_value details_value_noRows"
                      id="span_order_delivery_date">${requestScope.order.productOrder_delivery_date}</span>
            </div>
            <c:if test="${requestScope.order.productOrder_status == 3}">
                <div class="frm_div">
                    <label class="frm_label text_info" id="lbl_order_confirm_date">confirmation date</label>
                    <span class="details_value details_value_noRows"
                          id="span_order_confirm_date">${requestScope.order.productOrder_confirm_date}</span>
                </div>
            </c:if>
        </c:if>
    </div>
</c:if>
<div class="details_tools_div">
    <c:if test="${requestScope.order.productOrder_status==1}">
        <input class="frm_btn" id="btn_order_save" type="button" value="shipping"/>
    </c:if>
    <input class="frm_btn frm_clear" id="btn_order_cancel" type="button" value="cancel"/>
</div>

<%-- 模态框 --%>
<div class="modal fade" id="modalDiv" tabindex="-1" role="dialog" aria-labelledby="modalDiv" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">reminder</h4>
            </div>
            <div class="modal-body">Sure to cancel the order？</div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary" id="btn-ok">Yes</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-close">No</button>
            </div>
        </div>
        <%-- /.modal-content --%>
    </div>
    <%-- /.modal --%>
</div>
<div class="loader"></div>
</body>
</html>
