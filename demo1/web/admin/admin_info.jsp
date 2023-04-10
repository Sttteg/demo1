<%@ page import="java.util.List" %>
<%@ page import="com.admin.entity.AdminInfo" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>AdminInfo</title>
</head>
<%
    AdminInfo adminInfo = (AdminInfo) session.getAttribute("adminInfo");
    if(adminInfo == null) { %>
<script type="text/javascript">
    alert("未查询到指定管理员的信息！");
</script>
<%  } %>
<body>
<h1 align="center">书籍详细信息</h1>
<br/>
<form action="list" method="post">
</form>
<table align="center" border="1" width="60%">
    <tr>
        <td width="25%" align="center">账号</td>
        <td align="center"><%=Objects.requireNonNull(adminInfo).getAccount()%></td>
    </tr>
    <tr>
        <td align="center">密码</td>
        <td align="center"><%=adminInfo.getPassword()%></td>
    </tr>
    <tr>
        <td align="center">类别</td>
        <td align="center"><%=adminInfo.getAdmin_type()%></td>
    </tr>
</table>
<br>
<div align="center">
    <button type="button" onclick="javascript:history.back();">返回</button>
</div>
</body>
</html>
