<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
</head>
<body>
    <h1>用户登录</h1>
    <form action="${pageContext.request.contextPath}/user/login" method="post">
        <label for="username">用户名:</label>
        <input type="text" id="username" name="username" required><br>
        <label for="password">密码:</label>
        <input type="password" id="password" name="password" required><br>
        <input type="submit" value="登录">
    </form>
    ${error}
    ${message}
    <a href="${pageContext.request.contextPath}/user/register">注册</a>
</body>
</html>