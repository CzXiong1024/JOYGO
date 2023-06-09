$(function () {
    //刷新下拉框
    $('#select_user_address_province').selectpicker('refresh');
    $('#select_user_address_city').selectpicker('refresh');
    $('#select_user_address_district').selectpicker('refresh');
    //改变订单信息时
    $('#select_user_address_province').change(function () {
        $.ajax({
            type: "GET",
            url: "/mall/address/" + $(this).val(),
            data: null,
            dataType: "json",
            success: function (data) {
                $(".loader").hide();
                if (data.success) {
                    $("#select_user_address_city").empty();
                    $("#select_user_address_district").empty();
                    for (var i = 0; i < data.addressList.length; i++) {
                        var address_id = data.addressList[i].address_areaId;
                        var address_name = data.addressList[i].address_name;
                        $("#select_user_address_city").append("<option value='" + address_id + "'>" + address_name + "</option>")
                    }
                    for (var j = 0; j < data.childAddressList.length; j++) {
                        var childAddress_id = data.childAddressList[j].address_areaId;
                        var childAddress_name = data.childAddressList[j].address_name;
                        $("#select_user_address_district").append("<option value='" + childAddress_id + "'>" + childAddress_name + "</option>")
                    }
                    $('#select_user_address_city').selectpicker('refresh');
                    $("#select_user_address_district").selectpicker('refresh');
                    $("span.address-province").text($("#select_user_address_province").find("option:selected").text());
                    $("span.address-city").text($("#select_user_address_city").find("option:selected").text());
                    $("span.address_district").text($("#select_user_address_district").find("option:selected").text());
                } else {
                    alert("Unable to load the address information！Please try again later!")
                }
            },
            beforeSend: function () {
                $(".loader").show();
            },
            error: function () {
                alert("Unable to load the address information！Please try again later!")
            }
        });
    });
    $("#select_user_address_city").change(function () {
        $.ajax({
            type: "GET",
            url: "/mall/address/" + $(this).val(),
            data: null,
            dataType: "json",
            success: function (data) {
                $(".loader").hide();
                if (data.success) {
                    $("#select_user_address_district").empty();
                    for (var i = 0; i < data.addressList.length; i++) {
                        var address_id = data.addressList[i].address_areaId;
                        var address_name = data.addressList[i].address_name;
                        $("#select_user_address_district").append("<option value='" + address_id + "'>" + address_name + "</option>")
                    }
                    $('#select_user_address_district').selectpicker('refresh');
                    $("span.address-city").text($("#select_user_address_city").find("option:selected").text());
                    $("span.address_district").text($("#select_user_address_district").find("option:selected").text());
                } else {
                    alert("Unable to load the address information！Please try again later!")
                }
            },
            beforeSend: function () {
                $(".loader").show();
            },
            error: function () {
                alert("Unable to load the address information！Please try again later!")
            }
        });
    });
    $("#select_user_address_district").change(function () {
        $("span.address_district").text($(this).find("option:selected").text());
    });

    //用户名input获取光标
    $("#user_name").focus(function () {
        $(this).css("border", "1px solid #3879D9")
            .next().text("Please enter the username").css("display", "inline-block").css("color", "#00A0E9");
    });
    //密码input获取光标
    $("#user_password").focus(function () {
        $(this).css("border", "1px solid #3879D9")
            .next().text("Please enter the password").css("display", "inline-block").css("color", "#00A0E9");
    });
    //再次输入密码input获取光标
    $("#user_password_one").focus(function () {
        $(this).css("border", "1px solid #3879D9")
            .next().text("Please enter the password again").css("display", "inline-block").css("color", "#00A0E9");
    });
    //昵称input获取光标
    $("#user_nickname").focus(function () {
        $(this).css("border", "1px solid #3879D9")
            .next().text("Please enter the nickname").css("display", "inline-block").css("color", "#00A0E9");
    });
    //出生日期input获取光标
    $("#user_birthday").focus(function () {
        $(this).css("border", "1px solid #3879D9")
            .next().text("Please enter your date of birth").css("display", "inline-block").css("color", "#00A0E9");
    });
    //真实姓名input获取光标
    $("#user_realname").focus(function () {
        $(this).css("border", "1px solid #3879D9")
            .next().text("Please enter your real name").css("display", "inline-block").css("color", "#00A0E9");
    });

    //input离开光标
    $(".form-text").blur(function () {
        $(this).css("border-color", "#cccccc")
            .next().css("display", "none");
    });

    //非空验证
    $("#register_sub").click(function () {
        //真实姓名
        var user_realname = $.trim($("input[name=user_realname]").val());
        //密码
        var user_password = $.trim($("input[name=user_password]").val());
        //确认密码
        var user_password_one = $.trim($("input[name=user_password_one]").val());
        //昵称
        var user_nickname = $.trim($("input[name=user_nickname]").val());
        //出生日期
        var user_birthday = $.trim($("input[name=user_birthday]").val());

        //验证密码的格式 包含数字和英文字母
        var reg = new RegExp(/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/);
        if (user_realname == null || user_realname === "") {
            $("#user_realname").css("border", "1px solid red")
                .next().text("Please enter your realname").css("display", "inline-block").css("color", "red");
            return false;
        } else if (user_password == null || user_password === "") {
            $("#user_password").css("border", "1px solid red")
                .next().text("Please enter your password").css("display", "inline-block").css("color", "red");
            return false;
        } else if (user_password_one == null || user_password_one === "") {
            $("#user_password_one").css("border", "1px solid red")
                .next().text("Please enter your password again").css("display", "inline-block").css("color", "red");
            return false;
        } else if (!reg.test(user_password)) {
            $("#user_password").css("border", "1px solid red")
                .next().text("The password should caontain numbers and letters simultaneously").css("display", "inline-block").css("color", "red");
            return false;
        } else if (user_password !== user_password_one) {
            $("#user_password_one").css("border", "1px solid red")
                .next().text("The password you typed are not the same with the former one").css("display", "inline-block").css("color", "red");
            return false;
        } else if (user_nickname == null || user_nickname === "") {
            $("#user_nickname").css("border", "1px solid red")
                .next().text("Pease enter your nickname").css("display", "inline-block").css("color", "red");
            return false;
        } else if (user_birthday == null || user_birthday === "") {
            $("#user_birthday").css("border", "1px solid red")
                .next().text("Please choose your date of birth").css("display", "inline-block").css("color", "red");
            return false;
        }
        return true;
    });
});

//图片上传
function uploadImage(fileDom) {
    //获取文件
    var file = fileDom.files[0];
    //判断类型
    var imageType = /^image\//;
    if (file === undefined || !imageType.test(file.type)) {
        alert("Please select an image！");
        return;
    }
    //判断大小
    if (file.size > 512000) {
        alert("The size of the image cannot exceed 500KB！");
        return;
    }
    //清空值
    $(fileDom).val('');
    var formData = new FormData();
    formData.append("file", file);
    //上传图片
    $.ajax({
        url: "/mall/user/uploadUserHeadImage",
        type: "post",
        data: formData,
        contentType: false,
        processData: false,
        dataType: "json",
        mimeType: "multipart/form-data",
        success: function (data) {
            if (data.success) {
                $(fileDom).prev("img").attr("src","/mall/static/images/item/userProfilePicture/"+data.fileName);
                $("#user_profile_picture_src_value").val(data.fileName);
            } else {
                alert("Error uploading the image！");
            }
        },
        beforeSend: function () {
        },
        error: function () {

        }
    });
}