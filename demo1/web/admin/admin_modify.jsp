<%@ page import="java.util.List" %>
<%@ page import="com.admin.entity.AdminInfo" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>AdminModify</title>
</head>
<%
    AdminInfo adminInfo = (AdminInfo) session.getAttribute("adminInfo");
    if (adminInfo == null) { %>
<script type="text/javascript">
    alert("未查询到指定管理员的信息！");
</script>
<% } %>
<body>
<h1 align="center">修改书籍信息</h1>
<br/>
<form action="modify" method="post">
    <input type="hidden" name="admin_id" value="<%=adminInfo.getAdmin_id()%>">
    <table align="center" border="0" width="60%">
        <tr>
            <td width="25%" align="right">账号：</td>
            <td align="left" width="100%">
                <label>
                    <input type="text" name="account" value="<%=adminInfo.getAccount()%>" style="width: 75%">
                </label>
            </td>
        </tr>
        <tr>
            <td align="right">密码：</td>
            <td align="left" width="100%">
                <input type="text" name="password" value="<%=adminInfo.getPassword()%>" style="width: 75%">
        </tr>
        <tr>
            <td align="right">类别：</td>
            <td align="left" width="100%">
                <input type="text" name="admin_type" value="<%=adminInfo.getAdmin_type()%>" style="width: 75%">
            </td>
        </tr>
    </table>
    <br>
    <div align="center">
        <button type="submit">提交</button>
        &nbsp;
        <button type="button" onclick="javascript:history.back();">返回</button>
    </div>
</form>
</body>
</html>
