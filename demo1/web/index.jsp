<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>login</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/login/styles.css" type="text/css" rel="stylesheet"/>
    <script src="resources/scripts/jquery-3.2.1.min.js"></script>
    <script src="resources/scripts/axure/axQuery.js"></script>
    <script src="resources/scripts/axure/globals.js"></script>
    <script src="resources/scripts/axutils.js"></script>
    <script src="resources/scripts/axure/annotation.js"></script>
    <script src="resources/scripts/axure/axQuery.std.js"></script>
    <script src="resources/scripts/axure/doc.js"></script>
    <script src="resources/scripts/messagecenter.js"></script>
    <script src="resources/scripts/axure/events.js"></script>
    <script src="resources/scripts/axure/recording.js"></script>
    <script src="resources/scripts/axure/action.js"></script>
    <script src="resources/scripts/axure/expr.js"></script>
    <script src="resources/scripts/axure/geometry.js"></script>
    <script src="resources/scripts/axure/flyout.js"></script>
    <script src="resources/scripts/axure/model.js"></script>
    <script src="resources/scripts/axure/repeater.js"></script>
    <script src="resources/scripts/axure/sto.js"></script>
    <script src="resources/scripts/axure/utils.temp.js"></script>
    <script src="resources/scripts/axure/variables.js"></script>
    <script src="resources/scripts/axure/drag.js"></script>
    <script src="resources/scripts/axure/move.js"></script>
    <script src="resources/scripts/axure/visibility.js"></script>
    <script src="resources/scripts/axure/style.js"></script>
    <script src="resources/scripts/axure/adaptive.js"></script>
    <script src="resources/scripts/axure/tree.js"></script>
    <script src="resources/scripts/axure/init.temp.js"></script>
    <script src="resources/scripts/axure/legacy.js"></script>
    <script src="resources/scripts/axure/viewer.js"></script>
    <script src="resources/scripts/axure/math.js"></script>
    <script src="resources/scripts/axure/jquery.nicescroll.min.js"></script>
    <script src="data/document.js"></script>
    <script src="files/login/data.js"></script>
    <script type="text/javascript">
        $axure.utils.getTransparentGifPath = function () {
            return 'resources/images/transparent.gif';
        };
        $axure.utils.getOtherPath = function () {
            return 'resources/Other.html';
        };
        $axure.utils.getReloadPath = function () {
            return 'resources/reload.html';
        };
    </script>
    <style>
        .btn1{
            width:239px;
            height:43px;
            font-family:'Arial Negreta', 'Arial Normal', 'Arial', sans-serif;
            font-weight:700;
            font-size: 15px;
            font-style:normal;
            letter-spacing:1px;
            color:#7F7F7F;
            padding:2px 2px 2px 2px;
        }
    </style>
</head>
<body>
<form action="http://localhost:8089/demo1_war_exploded/Login" method="post">
    <div id="base" class="">

        <!-- Unnamed (组合) -->
        <div id="u0" class="ax_default" data-left="-1" data-top="0" data-width="1025" data-height="769">

            <!-- Unnamed (矩形) -->
            <div id="u1" class="ax_default box_1">
                <img id="u1_img" class="img " src="images/login/u1.svg"/>
                <div id="u1_text" class="text " style="display:none; visibility: hidden">
                    <p></p>
                </div>
            </div>

            <!-- Unnamed (图像) -->
            <div id="u2" class="ax_default _图像">
                <img id="u2_img" class="img " src="images/login/u2.png"/>
                <div id="u2_text" class="text " style="display:none; visibility: hidden">
                    <p></p>
                </div>
            </div>
        </div>

        <!-- Unnamed (组合) -->
        <div id="u3" class="ax_default" data-left="162" data-top="176" data-width="680" data-height="452">

            <!-- Unnamed (矩形) -->
            <div id="u4" class="ax_default box_1">
                <img id="u4_img" class="img " src="images/login/u4.svg"/>
                <div id="u4_text" class="text " style="display:none; visibility: hidden">
                    <p></p>
                </div>
            </div>

            <!-- Unnamed (图像) -->
            <div id="u5" class="ax_default _图像">
                <img id="u5_img" class="img " src="images/login/u5.svg"/>
                <div id="u5_text" class="text " style="display:none; visibility: hidden">
                    <p></p>
                </div>
            </div>

            <!-- Unnamed (图像) -->
            <div id="u6" class="ax_default _图像">
                <img id="u6_img" class="img " src="images/login/u6.png"/>
                <div id="u6_text" class="text " style="display:none; visibility: hidden">
                    <p></p>
                </div>
            </div>

            <!-- Unnamed (矩形) -->
            <div id="u7" class="ax_default box_1">
                <img id="u7_img" class="img " src="images/login/u7.svg"/>
                <div id="u7_text" class="text ">
                    <p><span>Library </span></p>
                    <p><span>Management</span></p>
                </div>
            </div>
        </div>

        <!-- forget (文本框(单行)) -->
        <div id="u8" class="ax_default text_field" data-label="forget">
            <img id="u8_img" class="img " src="images/login/forget_u8.svg"/>
            <input id="u8_input" type="text" value="Forgot Password?" class="u8_input"/>
        </div>

        <!-- Unnamed (复选框) -->
        <div id="u9" class="ax_default checkbox selected">
            <label id="u9_input_label" for="u9_input" style="position: absolute; left: 0px;">
                <img id="u9_img" class="img " src="images/login/u9_selected.svg"/>
                <div id="u9_text" class="text ">
                    <p><span>Remember Me</span></p>
                </div>
            </label>
            <input id="u9_input" type="checkbox" value="checkbox" checked/>
        </div>

        <!-- 账号 (文本框(单行)) -->
        <div id="u11" class="ax_default text_field" data-label="账号">
            <div id="u11_div" class=""></div><!--边框-->
            <input id="u11_input" type="text" placeholder="请输入正确格式的账号" class="u11_input" name="account" onblur="regAccount()"/>
        </div>

        <!-- 账号错误提示 (矩形) -->
        <div id="u13" class="ax_default box_3" data-label="账号错误提示">
            <div id="u13_div" class=""></div>
            <%--            <div id="u13_text" class="text " >--%>
            <span id="u11_inputReg"></span>
        </div>
    </div>

    <!-- 密码 (文本框(单行)) -->
    <div id="u10" class="ax_default text_field" data-label="密码">
        <div id="u10_div" class=""></div>
        <input id="u10_input" type="password" value="" class="u10_input" name="password" onblur="regPassword()"/>
    </div>

    <!-- 密码错误提示 (矩形) -->
    <div id="u14" class="ax_default box_3" data-label="密码错误提示">
        <div id="u14_div" class=""></div>
        <%--            <div id="u14_text" class="text ">--%>
        <span id="u10_inputReg"></span>
    </div>
    </div>

    <!-- LOGIN (矩形) -->
    <div id="u12" class="ax_default button" data-label="LOGIN">
        <div id="u12_div" class=""></div>
        <div id="u12_text" class="text ">
<%--            <span>LOGIN</span>--%>
            <%--            <input type="submit" id="u12_submit" class="btn1">LOGIN--%>
            <button id="bin" class="btn1"> LOGIN </button>
        </div>
    </div>

    </div>
    <script src="resources/scripts/axure/ios.js"></script>
<%--    jsp:<% %>--%>
<%--    js:<script></script>--%>
    <script type="application/javascript">
        //写一个getText（inputId,reg）方法来判断 正则表达式
        function getText(inputId, reg) {
            var text = document.getElementById(inputId).value; //获取输入框的ID 存放到text变量中
            var verify = reg; //获取正则表达式 存放到verify变量中
              // debugger;//前端断点
            var result = verify.test(text.trim()); //判断输入框内容是否符合 正则表达式; trim():去除字符串的头尾空格
              console.log(result)//在控制台打印出if结果
            // var show = document.getElementById(inputId + "Reg"); //获取存放"√"和"×"文本的span标签ID
            //如果符合正则表达式，则在输入框后面打"√"；否则打"×"
            if (result && text !== "") {
                // show.innerText = "√";
                // show.style.color = "green"; //设置"√"文本颜色为绿色
                return true;
            } else {
                // show.innerText = "×";
                // show.style.color = "red"; //设置"×"文本颜色为红色
                return false;
            }
        }

        //账号输入框，失去焦点 的方法
        function regAccount() {
            //调用getText（inputId,reg）方法
            if (getText("u11_input", /^[0-9]/)) {

                document.getElementById("u11_inputReg").innerText = "正确";
                document.getElementById("u11_inputReg").style.color = "green";
            } else {
                document.getElementById("u11_inputReg").innerText = "格式错误!";
                document.getElementById("u11_inputReg").style.color = "red";
            }
        }

        //密码输入框，失去焦点 的方法
        function regPassword() {
            //调用getText（inputId,reg）方法
            if (getText("u10_input", /^[0-9]/)) {

                document.getElementById("u10_inputReg").innerText = "正确";
                document.getElementById("u10_inputReg").style.color = "green";
            } else {
                document.getElementById("u10_inputReg").innerText = "格式错误!";
                document.getElementById("u10_inputReg").style.color = "red";
            }

        }
    </script>
</form>
</body>
</html>

