<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <script src="${pageContext.request.contextPath}/static/js/fore/fore_login.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/fore/fore_login.css" rel="stylesheet">
    <style rel="stylesheet">
        #baseNavigator {
            padding: 10px 0;
            width: 1190px;
            height: 20px;
            margin: auto;
        }

        #baseNavigator img {
            width: 190px;
            height:120px;
            margin-top: 8px;
            display:block;
        }

        /*#baseNavigator {
            width: auto;
            height: 20px;
            font-family: "Microsoft YaHei UI", Tahoma, serif;
            font-size: 12px;
            position: relative !important;
            background: #f2f2f2;
            z-index: 999;
            border-bottom: 1px solid #e5e5e5;
        }*/
    </style>
    <title>JoyGo -- Log In</title>
</head>
<body>
<%@ include file="include/navigator.jsp" %>
<%--<nav id="baseNavigator">
   <a href="${pageContext.request.contextPath}" target="_self">
        <img src="${pageContext.request.contextPath}/static/images/fore/WebsiteImage/logo.png" style="margin-top:-30px;"/>
  </a>
</nav>--%>
<div class="content">
    <div class="contentMain"></div>
    <div class="loginDiv">
        <div class="loginSwitch" id="loginSwitch"></div>
        <div class="loginMessage">
            <div class="loginMessageMain">
                <div class="poptip-arrow"><em></em><span></span></div>
                <img src="${pageContext.request.contextPath}/static/images/fore/WebsiteImage/scan-safe.png"/><span>Scan QR-Code</span>
            </div>
        </div>
        <div class="pwdLogin">
            <span class="loginTitle">Password Log in</span>
            <form method="post" class="loginForm">
                <div class="loginInputDiv">
                    <label for="name" class="loginLabel"><img
                            src="${pageContext.request.contextPath}/static/images/fore/WebsiteImage/2018-04-27_235518.png"
                            width="38px" height="39px" title="username"/></label>
                    <input type="text" name="name" id="name" class="loginInput" placeholder="Username/email/phone">
                </div>
                <div class="loginInputDiv">
                    <label for="password" class="loginLabel"><img
                            src="${pageContext.request.contextPath}/static/images/fore/WebsiteImage/2018-04-27_235533.png"
                            width="38px" height="39px" title="password"/></label>
                    <input type="password" name="password" id="password" class="loginInput">
                </div>
                <input type="submit" class="loginButton" value="log in">
            </form>
            <div class="loginLinks">
                <a href="#">Forget Password</a>
                <a href="#">Forget username</a>
                <a href="${pageContext.request.contextPath}/register">Registration</a>
            </div>
            <div class="error_message">
                <p id="error_message_p"></p>
            </div>
        </div>
        <div class="qrcodeLogin">
            <span class="loginTitle">Scan the QR-Code</span>
            <div class="qrcodeMain">
                <img src="${pageContext.request.contextPath}/static/images/fore/WebsiteImage/login_qrcode.png"
                     id="qrcodeA"/>
                <img src="${pageContext.request.contextPath}/static/images/fore/WebsiteImage/login_qrcodeB.png"
                     id="qrcodeB"/>
            </div>
            <div class="qrcodeFooter">
                <img src="${pageContext.request.contextPath}/static/images/fore/WebsiteImage/scan_icon2.png">
                <p>unlock <a href="https://mall.uzykj.com">Phone</a> | <a
                        href="https://uzykj.com/m">Phone</a>Scan</p>
            </div>
            <div class="loginLinks">
                <a href="JavaScript:void(0)" id="pwdLogin">Password log in</a>
                <a href="#">Registration</a>
            </div>
        </div>
    </div>
</div>
<%-- <%@ include file="include/footer.jsp" %> --%>
<link href="${pageContext.request.contextPath}/static/css/fore/fore_foot_special.css" rel="stylesheet"/>
<%@ include file="include/footer_two.jsp" %>
<%@ include file="include/footer.jsp" %>
</body>
