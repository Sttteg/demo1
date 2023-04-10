<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2023/4/8
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.admin.entity.AdminInfo" %>
<%@ page import="java.util.Objects" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>admin_list</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <link href="../resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="../data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="../files/admin_list/styles.css" type="text/css" rel="stylesheet"/>
    <script src="../resources/scripts/jquery-3.2.1.min.js"></script>
    <script src="../resources/scripts/axure/axQuery.js"></script>
    <script src="../resources/scripts/axure/globals.js"></script>
    <script src="../resources/scripts/axutils.js"></script>
    <script src="../resources/scripts/axure/annotation.js"></script>
    <script src="../resources/scripts/axure/axQuery.std.js"></script>
    <script src="../resources/scripts/axure/doc.js"></script>
    <script src="../resources/scripts/messagecenter.js"></script>
    <script src="../resources/scripts/axure/events.js"></script>
    <script src="../resources/scripts/axure/recording.js"></script>
    <script src="../resources/scripts/axure/action.js"></script>
    <script src="../resources/scripts/axure/expr.js"></script>
    <script src="../resources/scripts/axure/geometry.js"></script>
    <script src="../resources/scripts/axure/flyout.js"></script>
    <script src="../resources/scripts/axure/model.js"></script>
    <script src="../resources/scripts/axure/repeater.js"></script>
    <script src="../resources/scripts/axure/sto.js"></script>
    <script src="../resources/scripts/axure/utils.temp.js"></script>
    <script src="../resources/scripts/axure/variables.js"></script>
    <script src="../resources/scripts/axure/drag.js"></script>
    <script src="../resources/scripts/axure/move.js"></script>
    <script src="../resources/scripts/axure/visibility.js"></script>
    <script src="../resources/scripts/axure/style.js"></script>
    <script src="../resources/scripts/axure/adaptive.js"></script>
    <script src="../resources/scripts/axure/tree.js"></script>
    <script src="../resources/scripts/axure/init.temp.js"></script>
    <script src="../resources/scripts/axure/legacy.js"></script>
    <script src="../resources/scripts/axure/viewer.js"></script>
    <script src="../resources/scripts/axure/math.js"></script>
    <script src="../resources/scripts/axure/jquery.nicescroll.min.js"></script>
    <script src="../data/document.js"></script>
    <script src="../files/admin_list/data.js"></script>
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
</head>

<%
    AdminInfo searchCondition = (AdminInfo) session.getAttribute("searchCondition");
    List<AdminInfo> adminInfos = (List) session.getAttribute("adminInfos");
    if (adminInfos != null && searchCondition != null) { %>
<script type="text/javascript">
    <%--alert("<%= "当前管理员数量" + adminInfos.size() + "！" %>");--%>
</script>
<% } else { %>
<script type="text/javascript">
    alert("查询管理员表信息出错！");
</script>
<% }
    assert searchCondition != null;%>
<script type="text/javascript">
    function getAdminInfo(admin_id) {
        let obj = document.getElementById("admin_id");
        obj.value = admin_id;
        let form = document.getElementById("forward");
        form.action = "content";
        form.submit();
    }

    function modifyAdminInfo(admin_id) {
        let obj = document.getElementById("admin_id");
        obj.value = admin_id;
        let form = document.getElementById("forward");
        form.action = "premodify";
        form.submit();
    }

    function deleteAdminInfo(admin_id, account) {
        if (confirm("是否确认删除管理员:" + account + ",ID:" + admin_id + "的信息？") === true) {
            let obj = document.getElementById("admin_id");
            obj.value = admin_id;
            let form = document.getElementById("forward");
            form.action = "delete";
            form.submit();
        }
    }
</script>
<body>
<form action="list" method="post" id="fr">
    <div id="base" class="">

        <!-- Unnamed (组合) -->
        <div id="u0" class="ax_default" data-left="161" data-top="73" data-width="790" data-height="80">

            <!-- Unnamed (矩形) -->
            <div id="u1" class="ax_default box_1">
                <img id="u1_img" class="img " src="../images/admin_list/u1.svg"/>
                <div id="u1_text" class="text " style="display:none; visibility: hidden">
                    <p></p>
                </div>
            </div>

            <div id="u2" class="ax_default button">
            <input type="submit" value="查询">
            </div>
<%--            <!-- Unnamed (矩形) -->--%>
<%--            <div id="u2" class="ax_default button">--%>
<%--                <img id="u2_img" class="img " src="../images/admin_list/u2.svg"/>--%>
<%--                <div id="u2_text" class="text ">--%>
<%--                    <p><span><input type="submit" value="查询"></span></p>--%>
<%--                </div>--%>
<%--            </div>--%>

            <!-- Unnamed (矩形) -->
            <div id="u3" class="ax_default button">
                <img id="u3_img" class="img " src="../images/admin_list/u3.svg"/>
                <div id="u3_text" class="text ">
                    <p><span>添加管理员</span></p>
                    <%--                    <button type="button" onclick="javascript:location.href='admin_add.jsp';"><span>添加管理员</span>--%>
                    <%--                    </button>--%>
                </div>
            </div>
        </div>
    </div>
</form>
<form id="forward" action="" method="post">
    <input type="hidden" name="admin_id" id="admin_id">
</form>

<!-- Unnamed (矩形) -->
<div id="u4" class="ax_default box_1">
    <div id="u4_div" class=""></div>
    <div id="u4_text" class="text " style="display:none; visibility: hidden">
        <p></p>
    </div>
</div>

<!-- Unnamed (矩形) -->
<div id="u5" class="ax_default box_2">
    <div id="u5_div" class=""></div>
    <div id="u5_text" class="text ">
        <p><span>图书管理系统</span></p>
    </div>
</div>

<!-- Unnamed (矩形) -->
<div id="u6" class="ax_default box_2">
    <div id="u6_div" class=""></div>
    <div id="u6_text" class="text ">
        <p><span>图书信息管理</span></p>
    </div>
</div>

<!-- Unnamed (矩形) -->
<div id="u7" class="ax_default box_2">
    <div id="u7_div" class=""></div>
    <div id="u7_text" class="text ">
        <p><span>用户信息管理</span></p>
    </div>
</div>

<!-- Unnamed (矩形) -->
<div id="u8" class="ax_default box_2">
    <div id="u8_div" class=""></div>
    <div id="u8_text" class="text ">
        <p><span>管理员个人信息管理</span></p>
    </div>
</div>

<!-- Unnamed (矩形) -->
<div id="u9" class="ax_default box_2">
    <div id="u9_div" class=""></div>
    <div id="u9_text" class="text ">
        <p><span>借阅管理</span></p>
    </div>
</div>

<!-- Unnamed (表格) -->
<div id="u10" class="ax_default">
    <table>
        <tr>
            <th width="87px"><!-- Unnamed (表格单元) -->
                <div id="u11" class="ax_default table_cell">
                    <img id="u11_img" class="img " src="../images/admin_list/u11.png"/>
                    <div id="u11_text" class="text ">
                        <p><span>ID</span></p>
                    </div>
                </div>
            </th>
            <th width="183px"> <!-- Unnamed (表格单元) -->
                <div id="u12" class="ax_default table_cell">
                    <img id="u12_img" class="img " src="../images/admin_list/u12.png"/>
                    <div id="u12_text" class="text ">
                        <p><span>账号</span></p>
                    </div>
                </div>
            </th>
            <th width="194px"><!-- Unnamed (表格单元) -->
                <div id="u13" class="ax_default table_cell">
                    <img id="u13_img" class="img " src="../images/admin_list/u13.png"/>
                    <div id="u13_text" class="text ">
                        <p><span>密码</span></p>
                    </div>
                </div>
            </th>
            <th width="121px"><!-- Unnamed (表格单元) -->
                <div id="u14" class="ax_default table_cell">
                    <img id="u14_img" class="img " src="../images/admin_list/u14.png"/>
                    <div id="u14_text" class="text ">
                        <p><span>类别</span></p>
                    </div>
                </div>
            </th>
            <th width="202px"><!-- Unnamed (表格单元) -->
                <div id="u15" class="ax_default table_cell">
                    <img id="u15_img" class="img " src="../images/admin_list/u15.png"/>
                    <div id="u15_text" class="text ">
                        <p><span>操作</span></p>
                    </div>
                </div>
            </th>
        </tr>
        <% for (AdminInfo adminInfo : Objects.requireNonNull(adminInfos)) { %>
        <tr>
            <td></td>
            <td>
                <a href="#" onclick="getAdminInfo(<%=adminInfo.getAdmin_id()%>)"><%=adminInfo.getAccount()%></a>
<%--                <!-- Unnamed (表格单元) -->--%>
<%--                <div id="u16" class="ax_default table_cell">--%>
<%--                    <img id="u16_img" class="img " src="../images/admin_list/u16.png"/>--%>
<%--                    <div id="u16_text" class="text ">--%>
<%--                        &lt;%&ndash;                    <p><span>13455</span></p>&ndash;%&gt;--%>
<%--                        --%>
<%--                    </div>--%>
<%--                </div>--%>
            </td>
            <td><!-- Unnamed (表格单元) -->
<%--                <div id="u17" class="ax_default table_cell">--%>
<%--                    <img id="u17_img" class="img " src="../images/admin_list/u17.png"/>--%>
<%--                    <div id="u17_text" class="text ">--%>
<%--                        <p><span>三国演义</span></p>--%>
<%--                    </div>--%>
<%--                </div><!-- Unnamed (表格单元) -->--%>
<%--                <div id="u18" class="ax_default table_cell">--%>
<%--                    <img id="u18_img" class="img " src="../images/admin_list/u18.png"/>--%>
<%--                    <div id="u18_text" class="text ">--%>
<%--                        <p><span>女</span></p>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </td>

            <%--        <td align="center"><%=adminInfo.getPassword()%></td>--%>

            <td>
                <%=adminInfo.getAdmin_type()%>
                <!-- Unnamed (表格单元) -->
<%--                <div id="u19" class="ax_default table_cell">--%>
<%--                    <img id="u19_img" class="img " src="../images/admin_list/u19.png"/>--%>
<%--                    <div id="u19_text" class="text ">--%>
<%--                        &lt;%&ndash;                        <p><span>1</span></p>&ndash;%&gt;--%>
<%--                        <%=adminInfo.getAdmin_type()%>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </td>
            <td>
                <button type="button" id="bmodify" onclick="modifyAdminInfo(<%=adminInfo.getAdmin_id()%>)">修改</button>&nbsp;&nbsp;
                <button type="button" id="bdelete" onclick="deleteAdminInfo(<%=adminInfo.getAdmin_id()%>, '<%=adminInfo.getAccount()%>')">删除</button>
<%--                <!-- Unnamed (矩形) -->--%>
<%--                <div id="u60" class="ax_default button">--%>
<%--                    <img id="u60_img" class="img " src="../images/admin_list/u60.svg"/>--%>
<%--                    <div id="u60_text" class="text ">--%>
<%--                        <button type="button" id="bmodify"--%>
<%--                                onclick="modifyAdminInfo(<%=adminInfo.getAdmin_id()%>)">--%>
<%--                            修改--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <!-- Unnamed (矩形) -->--%>
<%--                <div id="u61" class="ax_default button">--%>
<%--                    <img id="u61_img" class="img " src="../images/admin_list/u61.svg"/>--%>
<%--                    <div id="u61_text" class="text ">--%>
<%--                        <button type="button" id="bdelete"--%>
<%--                                onclick="deleteAdminInfo(<%=adminInfo.getAdmin_id()%>, '<%=adminInfo.getAccount()%>')">--%>
<%--                            删除--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </td>
        </tr>
        <% } %>
    </table>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u20" class="ax_default table_cell">--%>
<%--        <img id="u20_img" class="img " src="../images/admin_list/u20.png"/>--%>
<%--        <div id="u20_text" class="text " style="display:none; visibility: hidden">--%>
<%--            <p></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u21" class="ax_default table_cell">--%>
<%--        <img id="u21_img" class="img " src="../images/admin_list/u16.png"/>--%>
<%--        <div id="u21_text" class="text ">--%>
<%--            <p><span>2333</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u22" class="ax_default table_cell">--%>
<%--        <img id="u22_img" class="img " src="../images/admin_list/u17.png"/>--%>
<%--        <div id="u22_text" class="text ">--%>
<%--            <p><span>四国演义</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u23" class="ax_default table_cell">--%>
<%--        <img id="u23_img" class="img " src="../images/admin_list/u18.png"/>--%>
<%--        <div id="u23_text" class="text ">--%>
<%--            <p><span>男</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u24" class="ax_default table_cell">--%>
<%--        <img id="u24_img" class="img " src="../images/admin_list/u19.png"/>--%>
<%--        <div id="u24_text" class="text ">--%>
<%--            <p><span>1</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u25" class="ax_default table_cell">--%>
<%--        <img id="u25_img" class="img " src="../images/admin_list/u20.png"/>--%>
<%--        <div id="u25_text" class="text " style="display:none; visibility: hidden">--%>
<%--            <p></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u26" class="ax_default table_cell">--%>
<%--        <img id="u26_img" class="img " src="../images/admin_list/u16.png"/>--%>
<%--        <div id="u26_text" class="text ">--%>
<%--            <p><span>55522</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u27" class="ax_default table_cell">--%>
<%--        <img id="u27_img" class="img " src="../images/admin_list/u17.png"/>--%>
<%--        <div id="u27_text" class="text ">--%>
<%--            <p><span>五国演义</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u28" class="ax_default table_cell">--%>
<%--        <img id="u28_img" class="img " src="../images/admin_list/u18.png"/>--%>
<%--        <div id="u28_text" class="text ">--%>
<%--            <p><span>男</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u29" class="ax_default table_cell">--%>
<%--        <img id="u29_img" class="img " src="../images/admin_list/u19.png"/>--%>
<%--        <div id="u29_text" class="text ">--%>
<%--            <p><span>1</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u30" class="ax_default table_cell">--%>
<%--        <img id="u30_img" class="img " src="../images/admin_list/u20.png"/>--%>
<%--        <div id="u30_text" class="text " style="display:none; visibility: hidden">--%>
<%--            <p></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u31" class="ax_default table_cell">--%>
<%--        <img id="u31_img" class="img " src="../images/admin_list/u16.png"/>--%>
<%--        <div id="u31_text" class="text ">--%>
<%--            <p><span>4333</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u32" class="ax_default table_cell">--%>
<%--        <img id="u32_img" class="img " src="../images/admin_list/u17.png"/>--%>
<%--        <div id="u32_text" class="text ">--%>
<%--            <p><span>六国演义</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u33" class="ax_default table_cell">--%>
<%--        <img id="u33_img" class="img " src="../images/admin_list/u18.png"/>--%>
<%--        <div id="u33_text" class="text ">--%>
<%--            <p><span>男</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u34" class="ax_default table_cell">--%>
<%--        <img id="u34_img" class="img " src="../images/admin_list/u19.png"/>--%>
<%--        <div id="u34_text" class="text ">--%>
<%--            <p><span>1</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u35" class="ax_default table_cell">--%>
<%--        <img id="u35_img" class="img " src="../images/admin_list/u20.png"/>--%>
<%--        <div id="u35_text" class="text " style="display:none; visibility: hidden">--%>
<%--            <p></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u36" class="ax_default table_cell">--%>
<%--        <img id="u36_img" class="img " src="../images/admin_list/u16.png"/>--%>
<%--        <div id="u36_text" class="text ">--%>
<%--            <p><span>5333</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u37" class="ax_default table_cell">--%>
<%--        <img id="u37_img" class="img " src="../images/admin_list/u17.png"/>--%>
<%--        <div id="u37_text" class="text ">--%>
<%--            <p><span>气国演义</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u38" class="ax_default table_cell">--%>
<%--        <img id="u38_img" class="img " src="../images/admin_list/u18.png"/>--%>
<%--        <div id="u38_text" class="text ">--%>
<%--            <p><span>男</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u39" class="ax_default table_cell">--%>
<%--        <img id="u39_img" class="img " src="../images/admin_list/u19.png"/>--%>
<%--        <div id="u39_text" class="text ">--%>
<%--            <p><span>1</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u40" class="ax_default table_cell">--%>
<%--        <img id="u40_img" class="img " src="../images/admin_list/u20.png"/>--%>
<%--        <div id="u40_text" class="text " style="display:none; visibility: hidden">--%>
<%--            <p></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u41" class="ax_default table_cell">--%>
<%--        <img id="u41_img" class="img " src="../images/admin_list/u16.png"/>--%>
<%--        <div id="u41_text" class="text ">--%>
<%--            <p><span>3333</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u42" class="ax_default table_cell">--%>
<%--        <img id="u42_img" class="img " src="../images/admin_list/u17.png"/>--%>
<%--        <div id="u42_text" class="text ">--%>
<%--            <p><span>八国演义</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u43" class="ax_default table_cell">--%>
<%--        <img id="u43_img" class="img " src="../images/admin_list/u18.png"/>--%>
<%--        <div id="u43_text" class="text ">--%>
<%--            <p><span>男</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u44" class="ax_default table_cell">--%>
<%--        <img id="u44_img" class="img " src="../images/admin_list/u19.png"/>--%>
<%--        <div id="u44_text" class="text ">--%>
<%--            <p><span>1</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u45" class="ax_default table_cell">--%>
<%--        <img id="u45_img" class="img " src="../images/admin_list/u20.png"/>--%>
<%--        <div id="u45_text" class="text " style="display:none; visibility: hidden">--%>
<%--            <p></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u46" class="ax_default table_cell">--%>
<%--        <img id="u46_img" class="img " src="../images/admin_list/u46.png"/>--%>
<%--        <div id="u46_text" class="text ">--%>
<%--            <p><span>33333</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u47" class="ax_default table_cell">--%>
<%--        <img id="u47_img" class="img " src="../images/admin_list/u47.png"/>--%>
<%--        <div id="u47_text" class="text ">--%>
<%--            <p><span>九国演义</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u48" class="ax_default table_cell">--%>
<%--        <img id="u48_img" class="img " src="../images/admin_list/u48.png"/>--%>
<%--        <div id="u48_text" class="text ">--%>
<%--            <p><span>男</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Unnamed (表格单元) -->--%>
<%--    <div id="u49" class="ax_default table_cell">--%>
<%--        <img id="u49_img" class="img " src="../images/admin_list/u49.png"/>--%>
<%--        <div id="u49_text" class="text ">--%>
<%--            <p><span>1</span></p>--%>
<%--        </div>--%>
<%--    </div>--%>

    <!-- Unnamed (表格单元) -->
<%--    <div id="u50" class="ax_default table_cell">--%>
<%--        <img id="u50_img" class="img " src="../images/admin_list/u50.png"/>--%>
<%--        <div id="u50_text" class="text " style="display:none; visibility: hidden">--%>
<%--            <p></p>--%>
<%--        </div>--%>
<%--    </div>--%>
</div>
<%--<td colspan="10" align="center">--%>
<%--    第${pageNum}/${totalPage}页--%>
<%--    总记录数:${totalCount}条--%>
<%--    每页${pageSize}条--%>
<%--    <c:if test="${requestScope.pageNum==1}">--%>
<%--        <a href="?pageNum=${requestScope.pageNum+1}&admin_type=${requestScope.admin_type}&account=${requestScope.account}">下一页</a>&nbsp;&nbsp;--%>
<%--    </c:if>--%>
<%--    <c:if test="${requestScope.pageNum==requestScope.totalPage}">--%>
<%--        <a href="?pageNum=${requestScope.pageNum-1}&admin_type=${requestScope.admin_type}&account=${requestScope.account}">上一页</a>&nbsp;&nbsp;--%>
<%--    </c:if>--%>
<%--    <c:if test="${requestScope.pageNum!=1 && requestScope.pageNum!=requestScope.totalPage}">--%>
<%--        <a href="?pageNum=${requestScope.pageNum-1}&admin_type=${requestScope.admin_type}&account=${requestScope.account}">上一页</a>--%>
<%--        <a href="?pageNum=${requestScope.pageNum+1}&admin_type=${requestScope.admin_type}&account=${requestScope.account}">下一页</a>--%>
<%--    </c:if>--%>
<%--</td>--%>

<c:if test="${requestScope.pageNum==1}">
    <a href="?pageNum=${requestScope.pageNum+1}&admin_type=${requestScope.admin_type}&account=${requestScope.account}">下一页</a>&nbsp;&nbsp;
</c:if>
<c:if test="${requestScope.pageNum==requestScope.totalPage}">
    <a href="?pageNum=${requestScope.pageNum-1}&admin_type=${requestScope.admin_type}&account=${requestScope.account}">上一页</a>&nbsp;&nbsp;
</c:if>
<c:if test="${requestScope.pageNum!=1 && requestScope.pageNum!=requestScope.totalPage}">
    <!-- Unnamed (矩形) -->
    <div id="u53" class="ax_default button">
        <img id="u53_img" class="img " src="../images/admin_list/u53.svg"/>
        <div id="u53_text" class="text ">
            <p><span href="?pageNum=${requestScope.pageNum-1}&admin_type=${requestScope.admin_type}&account=${requestScope.account}">&lt;上一页</span></p>
        </div>
    </div>

    <!-- Unnamed (矩形) -->
    <div id="u54" class="ax_default button">
        <img id="u54_img" class="img " src="../images/admin_list/u53.svg"/>
        <div id="u54_text" class="text ">
            <p><span href="?pageNum=${requestScope.pageNum+1}&admin_type=${requestScope.admin_type}&account=${requestScope.account}">下一页&gt;</span></p>
        </div>
    </div>
<%--    <a href="?pageNum=${requestScope.pageNum-1}&admin_type=${requestScope.admin_type}&account=${requestScope.account}">上一页</a>--%>
<%--    <a href="?pageNum=${requestScope.pageNum+1}&admin_type=${requestScope.admin_type}&account=${requestScope.account}">下一页</a>--%>
</c:if>

<!-- Unnamed (矩形) -->
<div id="u51" class="ax_default button">
    <img id="u51_img" class="img " src="../images/admin_list/u51.svg"/>
    <div id="u51_text" class="text ">
        <p><span href="?pageNum=${requestScope.pageNum==1}&admin_type=${requestScope.admin_type}&account=${requestScope.account}">首页</span></p>
    </div>
</div>

<!-- Unnamed (矩形) -->
<div id="u52" class="ax_default button">
    <img id="u52_img" class="img " src="../images/admin_list/u52.svg"/>
    <div id="u52_text" class="text ">
        <p><span href="?pageNum=${requestScope.pageNum==requestScope.totalPage}&admin_type=${requestScope.admin_type}&account=${requestScope.account}">尾页</span></p>
    </div>
</div>



<!-- Unnamed (矩形) -->
<div id="u55" class="ax_default box_1">
    <img id="u55_img" class="img " src="../images/admin_list/u55.svg"/>
    <div id="u55_text" class="text ">
        <p><span>第${pageNum}/${totalPage}页</span></p>
    </div>
</div>

<!-- Unnamed (矩形) -->
<div id="u56" class="ax_default box_1">
    <img id="u56_img" class="img " src="../images/admin_list/u55.svg"/>
    <div id="u56_text" class="text ">
        <p><span>总记录数:${totalCount}条</span></p>
    </div>
</div>

<!-- Unnamed (矩形) -->
<div id="u57" class="ax_default box_1">
    <img id="u57_img" class="img " src="../images/admin_list/u57.svg"/>
    <div id="u57_text" class="text ">
        <p><span>当前页共${pageSize}条记录</span></p>
    </div>
</div>

<!-- Unnamed (矩形) -->
<div id="u58" class="ax_default box_1">
    <img id="u58_img" class="img " src="../images/admin_list/u58.svg"/>
    <div id="u58_text" class="text " style="display:none; visibility: hidden">
        <p></p>
    </div>
</div>

<!-- Unnamed (矩形) -->
<div id="u59" class="ax_default box_1">
    <img id="u59_img" class="img " src="../images/admin_list/u59.svg"/>
    <div id="u59_text" class="text " style="display:none; visibility: hidden">
        <p></p>
    </div>
</div>


<%--<!-- Unnamed (矩形) -->--%>
<%--<div id="u62" class="ax_default button">--%>
<%--    <img id="u62_img" class="img " src="../images/admin_list/u60.svg"/>--%>
<%--    <div id="u62_text" class="text ">--%>
<%--        <p><span>修改</span></p>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<!-- Unnamed (矩形) -->--%>
<%--<div id="u63" class="ax_default button">--%>
<%--    <img id="u63_img" class="img " src="../images/admin_list/u61.svg"/>--%>
<%--    <div id="u63_text" class="text ">--%>
<%--        <p><span>删除</span></p>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<!-- Unnamed (矩形) -->--%>
<%--<div id="u64" class="ax_default button">--%>
<%--    <img id="u64_img" class="img " src="../images/admin_list/u60.svg"/>--%>
<%--    <div id="u64_text" class="text ">--%>
<%--        <p><span>修改</span></p>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<!-- Unnamed (矩形) -->--%>
<%--<div id="u65" class="ax_default button">--%>
<%--    <img id="u65_img" class="img " src="../images/admin_list/u61.svg"/>--%>
<%--    <div id="u65_text" class="text ">--%>
<%--        <p><span>删除</span></p>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<!-- Unnamed (矩形) -->--%>
<%--<div id="u66" class="ax_default button">--%>
<%--    <img id="u66_img" class="img " src="../images/admin_list/u60.svg"/>--%>
<%--    <div id="u66_text" class="text ">--%>
<%--        <p><span>修改</span></p>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<!-- Unnamed (矩形) -->--%>
<%--<div id="u67" class="ax_default button">--%>
<%--    <img id="u67_img" class="img " src="../images/admin_list/u61.svg"/>--%>
<%--    <div id="u67_text" class="text ">--%>
<%--        <p><span>删除</span></p>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<!-- Unnamed (矩形) -->--%>
<%--<div id="u68" class="ax_default button">--%>
<%--    <img id="u68_img" class="img " src="../images/admin_list/u60.svg"/>--%>
<%--    <div id="u68_text" class="text ">--%>
<%--        <p><span>修改</span></p>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<!-- Unnamed (矩形) -->--%>
<%--<div id="u69" class="ax_default button">--%>
<%--    <img id="u69_img" class="img " src="../images/admin_list/u61.svg"/>--%>
<%--    <div id="u69_text" class="text ">--%>
<%--        <p><span>删除</span></p>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<!-- Unnamed (矩形) -->--%>
<%--<div id="u70" class="ax_default button">--%>
<%--    <img id="u70_img" class="img " src="../images/admin_list/u60.svg"/>--%>
<%--    <div id="u70_text" class="text ">--%>
<%--        <p><span>修改</span></p>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<!-- Unnamed (矩形) -->--%>
<%--<div id="u71" class="ax_default button">--%>
<%--    <img id="u71_img" class="img " src="../images/admin_list/u61.svg"/>--%>
<%--    <div id="u71_text" class="text ">--%>
<%--        <p><span>删除</span></p>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<!-- Unnamed (矩形) -->--%>
<%--<div id="u72" class="ax_default button">--%>
<%--    <img id="u72_img" class="img " src="../images/admin_list/u60.svg"/>--%>
<%--    <div id="u72_text" class="text ">--%>
<%--        <p><span>修改</span></p>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<!-- Unnamed (矩形) -->--%>
<%--<div id="u73" class="ax_default button">--%>
<%--    <img id="u73_img" class="img " src="../images/admin_list/u61.svg"/>--%>
<%--    <div id="u73_text" class="text ">--%>
<%--        <p><span>删除</span></p>--%>
<%--    </div>--%>
<%--</div>--%>

<!-- 书名 (文本框(单行)) -->
<div id="u74" class="ax_default text_field" data-label="书名">
    <div id="u74_div" class=""></div>
    <input id="u74_input" type="search" value="" class="u74_input"/>
</div>

<!--账号 (文本框(单行)) -->
<div id="u75" class="ax_default text_field" data-label="账号">
    <div id="u75_div" class=""></div>
    <%--    <input id="u75_input" type="search" value="" class="u75_input"/>--%>
    <input type="text" name="account" id="u75_input" class="u75_input"
           value="<%=searchCondition.getAccount()%>"/>
</div>

<!-- 类别 (文本框(单行)) -->
<div id="u76" class="ax_default text_field" data-label="类别">
    <div id="u76_div" class=""></div>
    <%--    <input id="u76_input" type="search" value="" class="u76_input"/>--%>
    <input type="text" name="admin_type" id="u76_input" class="u76_input"
           value="<%=searchCondition.getAdmin_type()%>"/>
</div>

<!-- Unnamed (矩形) -->
<div id="u77" class="ax_default box_1">
    <img id="u77_img" class="img " src="../images/admin_list/u77.svg"/>
    <div id="u77_text" class="text ">
        <p><span>ID:</span></p>
    </div>
</div>

<!-- Unnamed (矩形) -->
<div id="u78" class="ax_default box_1">
    <img id="u78_img" class="img " src="../images/admin_list/u78.svg"/>
    <div id="u78_text" class="text ">
        <p><span>账号:</span></p>
    </div>
</div>

<!-- Unnamed (矩形) -->
<div id="u79" class="ax_default box_1">
    <img id="u79_img" class="img " src="../images/admin_list/u79.svg"/>
    <div id="u79_text" class="text ">
        <p><span>类别:</span></p>
    </div>
</div>

<!-- Unnamed (矩形) -->
<div id="u80" class="ax_default box_1">
    <div id="u80_div" class=""></div>
    <div id="u80_text" class="text " style="display:none; visibility: hidden">
        <p></p>
    </div>
</div>

<!-- Unnamed (图像) -->
<div id="u81" class="ax_default _图像">
    <img id="u81_img" class="img " src="../images/admin_list/u81.svg"/>
    <div id="u81_text" class="text " style="display:none; visibility: hidden">
        <p></p>
    </div>
</div>

<!-- Unnamed (矩形) -->
<div id="u82" class="ax_default box_1">
    <img id="u82_img" class="img " src="../images/admin_list/u82.svg"/>
    <div id="u82_text" class="text ">
        <p><span>刘于川</span></p>
    </div>
</div>

<!-- Unnamed (图像) -->
<div id="u83" class="ax_default _图像">
    <img id="u83_img" class="img " src="../images/admin_list/u83.svg"/>
    <div id="u83_text" class="text " style="display:none; visibility: hidden">
        <p></p>
    </div>
</div>

<!-- Unnamed (矩形) -->
<div id="u84" class="ax_default box_1">
    <img id="u84_img" class="img " src="../images/admin_list/u82.svg"/>
    <div id="u84_text" class="text ">
        <p><span>退出</span></p>
    </div>
</div>

<!-- Unnamed (组合) -->
<div id="u85" class="ax_default ax_default_hidden" style="display:none; visibility: hidden" data-left="817"
     data-top="40" data-width="109" data-height="68">

    <!-- Unnamed (矩形) -->
    <div id="u86" class="ax_default button">
        <img id="u86_img" class="img " src="../images/admin_list/u86.svg"/>
        <div id="u86_text" class="text ">
            <p><span>个人信息</span></p>
        </div>
    </div>

    <!-- Unnamed (矩形) -->
    <div id="u87" class="ax_default button">
        <img id="u87_img" class="img " src="../images/admin_list/u86.svg"/>
        <div id="u87_text" class="text ">
            <p><span>退出登录</span></p>
        </div>
    </div>
</div>

<!-- Unnamed (组合) -->
<div id="u88" class="ax_default ax_default_hidden" style="display:none; visibility: hidden" data-left="339"
     data-top="201" data-width="346" data-height="113">

    <!-- Unnamed (矩形) -->
    <div id="u89" class="ax_default box_1">
        <img id="u89_img" class="img " src="../images/admin_list/u89.svg"/>
        <div id="u89_text" class="text " style="display:none; visibility: hidden">
            <p></p>
        </div>
    </div>

    <!-- Unnamed (矩形) -->
    <div id="u90" class="ax_default box_1">
        <img id="u90_img" class="img " src="../images/admin_list/u90.svg"/>
        <div id="u90_text" class="text ">
            <p><span>确认是否删除？</span></p>
        </div>
    </div>

    <!-- Unnamed (矩形) -->
    <div id="u91" class="ax_default box_1">
        <img id="u91_img" class="img " src="../images/admin_list/u91.svg"/>
        <div id="u91_text" class="text ">
            <p><span>确认</span></p>
        </div>
    </div>

    <!-- Unnamed (矩形) -->
    <div id="u92" class="ax_default box_1">
        <div id="u92_div" class=""></div>
        <div id="u92_text" class="text ">
            <p><span>取消</span></p>
        </div>
    </div>
</div>

<!-- Unnamed (组合) -->
<div id="u93" class="ax_default ax_default_hidden" style="display:none; visibility: hidden" data-left="339"
     data-top="197" data-width="346" data-height="121">

    <!-- Unnamed (组合) -->
    <div id="u94" class="ax_default" data-left="339" data-top="197" data-width="346" data-height="121">

        <!-- Unnamed (矩形) -->
        <div id="u95" class="ax_default box_1">
            <img id="u95_img" class="img " src="../images/admin_list/u95.svg"/>
            <div id="u95_text" class="text " style="display:none; visibility: hidden">
                <p></p>
            </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u96" class="ax_default box_1">
            <img id="u96_img" class="img " src="../images/admin_list/u96.svg"/>
            <div id="u96_text" class="text ">
                <p><span>删除成功</span></p>
            </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u97" class="ax_default box_1">
            <img id="u97_img" class="img " src="../images/admin_list/u97.svg"/>
            <div id="u97_text" class="text ">
                <p><span>确认</span></p>
            </div>
        </div>
    </div>
</div>
</div>
<script src="../resources/scripts/axure/ios.js"></script>

</body>
</html>

