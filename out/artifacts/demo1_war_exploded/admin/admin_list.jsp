<%@ page import="java.util.List" %>
<%@ page import="com.admin.entity.AdminInfo" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>AdminList</title>
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
<h1 align="center">管理员信息列表</h1>
<br>
<form action="list" method="post" id="fr">
    <div align="center">
        <label style="size: 48px; align-content: center">
            <strong>管理员查询</strong>
        </label>
    </div>
    <br>
        <div align="center">
            <button type="button" onclick="javascript:location.href='admin_add.jsp';">添加管理员</button>&nbsp;&nbsp;

<%--            ID: <input type="text" name="admin_id" value="<%=searchCondition.getAdmin_id()%>"/>--%>

            账号：<input type="text" name="account" value="<%=searchCondition.getAccount()%>"/>
            &nbsp;&nbsp;
<%--            密码：<input type="text" name="password" value="<%=searchCondition.getPassword()%>"/>--%>

            类别：<input type="text" name="admin_type" value="<%=searchCondition.getAdmin_type()%>"/>
<%--            <select id="brandId" name="brandId" >--%>

<%--                <option value="">全部类别</option>--%>
<%--                <c:forEach items="${}">--%>
<%--                    <option value="${searchCondition.getAdmin_type}">${searchCondition.getAdmin_type}</option>--%>
<%--                </c:forEach>--%>
<%--            </select>--%>
            &nbsp;&nbsp;
            <input type="submit" value="查询">
        </div>
    </div>
</form>
<%--<script>--%>
<%--    function sumb(val){--%>
<%--      var a=  document.getElementsByClassName("admin_type");--%>
<%--        console.log(1)--%>
<%--        console.log(a===undefined)--%>
<%--    }--%>
<%--</script>--%>
<form id="forward" action="" method="post">
    <input type="hidden" name="admin_id" id="admin_id">
</form>
<br>
<table align="center" border="1" width="90%">
    <tr>
        <th width="30%">账号</th>
        <%--        <th width="20%">密码</th>--%>
            <th width="20%">类别</th>
            <th>操作</th>
    </tr>
    <% for (AdminInfo adminInfo : Objects.requireNonNull(adminInfos)) { %>
    <tr>
        <td align="center">
            <a href="#" onclick="getAdminInfo(<%=adminInfo.getAdmin_id()%>)"><%=adminInfo.getAccount()%>
            </a>
        </td>

        <%--        <td align="center"><%=adminInfo.getPassword()%></td>--%>

        <td align="center">
            <%=adminInfo.getAdmin_type()%>
        </td>
        <td align="center">
            <button type="button" id="bmodify" onclick="modifyAdminInfo(<%=adminInfo.getAdmin_id()%>)">修改</button>
            &nbsp
            <button type="button" id="bdelete"
                    onclick="deleteAdminInfo(<%=adminInfo.getAdmin_id()%>, '<%=adminInfo.getAccount()%>')">删除
            </button>
        </td>
    </tr>
    <% } %>
    <tr>
        <td colspan="10" align="center">
            第${pageNum}/${totalPage}页
            总记录数:${totalCount}条
            每页${pageSize}条
            <c:if test="${requestScope.pageNum==1}">
                <a href="?pageNum=${requestScope.pageNum+1}&admin_type=${requestScope.admin_type}&account=${requestScope.account}">下一页</a>&nbsp;&nbsp;
            </c:if>
            <c:if test="${requestScope.pageNum==requestScope.totalPage}">
                <a href="?pageNum=${requestScope.pageNum-1}&admin_type=${requestScope.admin_type}&account=${requestScope.account}">上一页</a>&nbsp;&nbsp;
            </c:if>
            <c:if test="${requestScope.pageNum!=1 && requestScope.pageNum!=requestScope.totalPage}">
                <a href="?pageNum=${requestScope.pageNum-1}&admin_type=${requestScope.admin_type}&account=${requestScope.account}">上一页</a>
                <a href="?pageNum=${requestScope.pageNum+1}&admin_type=${requestScope.admin_type}&account=${requestScope.account}">下一页</a>
            </c:if>
        </td>
    </tr>
<%--    <h1>类型:${requestScope.admin_type}</h1>--%>
<%--        <tr>--%>
    <%--            <td colspan="10" align="center">--%>
    <%--                第${pageNum}/${totalPage}页--%>
    <%--                总记录数:${totalCount}条--%>
    <%--                每页${pageSize}条--%>
    <%--                <c:if test="${requestScope.pageNum!=1}">--%>
    <%--                    <a href="?pageNum=${requestScope.pageNum=1}">[首页]</a>--%>
    <%--                    <a href="?pageNum=${requestScope.pageNum-1}">[上一页]</a>--%>
    <%--                </c:if>--%>
    <%--                <c:if test="${requestScope.pageNum!=requestScope.totalPage}">--%>
    <%--                    <a href="?pageNum=${requestScope.pageNum+1}">[下一页]</a>--%>
    <%--                    <a href="?pageNum=${requestScope.pageNum=requestScope.totalPage}">[尾页]</a>&nbsp;&nbsp;--%>
    <%--                </c:if>--%>
    <%--            </td>--%>
    <%--        </tr>--%>
</table>


<br>
</body>
</html>
