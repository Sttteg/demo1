<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>AdminAdd</title>
</head>
<body>
<h1 align="center">新增管理员信息</h1>
<br/>
<form action="add" method="post">
    <table align="center" border="0" width="60%">
        <tr>
            <td width="25%" align="right">账号：</td>
            <td align="left" width="100%">
                <input type="text" name="account" value="" style="width: 75%">
            </td>
        </tr>
        <tr>
            <td align="right">密码：</td>
            <td align="left" width="100%">
                <input type="text" name="password" value="" style="width: 75%">
        </tr>
        <tr>
            <td align="right">类型：</td>
            <td align="left" width="100%">
                <input type="text" name="admin_type" value="" style="width: 75%">
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
