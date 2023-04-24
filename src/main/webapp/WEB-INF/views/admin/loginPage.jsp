<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <script src="${pageContext.request.contextPath}/static/js/admin/admin_login.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin/admin_login.css"/>
    <title>JoyGo - Admin Login</title>
</head>
<body>
<div id="div_background">
    <div id="div_nav">
        <span id="txt_date"></span>
        <span id="txt_peel">change the theme</span>
        <ul id="div_peelPanel">
            <li value="url(${pageContext.request.contextPath}/static/images/admin/loginPage/background-1.jpg)">
                <img src="${pageContext.request.contextPath}/static/images/admin/loginPage/background-1.jpg"/>
            </li>
            <li value="url(${pageContext.request.contextPath}/static/images/admin/loginPage/background-2.jpg)">
                <img src="${pageContext.request.contextPath}/static/images/admin/loginPage/background-2.jpg"/>
            </li>
            <li value="url(${pageContext.request.contextPath}/static/images/admin/loginPage/background-3.jpg)">
                <img src="${pageContext.request.contextPath}/static/images/admin/loginPage/background-mini-3.jpg"/>
            </li>
            <li value="url(${pageContext.request.contextPath}/static/images/admin/loginPage/background-4.jpg)">
                <img src="${pageContext.request.contextPath}/static/images/admin/loginPage/background-mini-4.jpg"/>
            </li>
            <li value="url(${pageContext.request.contextPath}/static/images/admin/loginPage/background-5.jpg)">
                <img src="${pageContext.request.contextPath}/static/images/admin/loginPage/background-mini-5.jpg"/>
            </li>
        </ul>
    </div>
    <div id="div_main">
        <div id="div_head"><p>JoyGo<span> Data Management</span></p></div>
        <div id="div_content">
            <img id="img_profile_picture"
                 src="${pageContext.request.contextPath}/static/images/admin/loginPage/default_profile_picture-128x128.png"
                 alt="Avatar" title="Avatar"
                 onerror="this.src='${pageContext.request.contextPath}/static/images/admin/loginPage/default_profile_picture-128x128.png'"/>
            <form id="form_login">
                <input type="text" class="form-control form_control" placeholder="username" id="adminUsername" title="enter username"/>
                <input type="password" class="form-control form_control" placeholder="password" id="adminPassword" title="enter password" autocomplete="off">
                <span id="txt_error_msg"></span>
                <button id="btn_login" class="btn btn-danger">Log in</button>
            </form>
        </div>
    </div>
</div>
</body>