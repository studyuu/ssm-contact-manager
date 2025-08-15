<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>用户登录</title>
            <style>
                :root {
                    --primary-color: #4361ee;
                    --primary-hover: #3a56d4;
                    --success-color: #4cc9f0;
                    --error-color: #f72585;
                    --text-color: #2b2d42;
                    --light-gray: #f8f9fa;
                    --border-color: #e9ecef;
                }

                body {
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 100vh;
                    margin: 0;
                    color: var(--text-color);
                }

                .login-container {
                    background-color: white;
                    padding: 2.5rem;
                    border-radius: 12px;
                    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
                    width: 100%;
                    max-width: 400px;
                    text-align: center;
                    animation: fadeIn 0.6s ease-in-out;
                }

                @keyframes fadeIn {
                    from {
                        opacity: 0;
                        transform: translateY(20px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                .logo {
                    font-size: 2rem;
                    font-weight: 700;
                    color: var(--primary-color);
                    margin-bottom: 0.5rem;
                }

                .subtitle {
                    color: #6c757d;
                    margin-bottom: 2rem;
                    font-size: 0.9rem;
                }

                .form-group {
                    margin-bottom: 1.5rem;
                    text-align: left;
                }

                label {
                    display: block;
                    margin-bottom: 0.5rem;
                    font-weight: 500;
                    font-size: 0.9rem;
                }

                input[type="text"],
                input[type="password"] {
                    width: 100%;
                    padding: 0.8rem 1rem;
                    border: 1px solid var(--border-color);
                    border-radius: 8px;
                    box-sizing: border-box;
                    font-size: 1rem;
                    transition: border-color 0.3s;
                }

                input[type="text"]:focus,
                input[type="password"]:focus {
                    border-color: var(--primary-color);
                    outline: none;
                    box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
                }

                .btn {
                    background-color: var(--primary-color);
                    color: white;
                    border: none;
                    padding: 0.8rem;
                    border-radius: 8px;
                    cursor: pointer;
                    font-size: 1rem;
                    width: 100%;
                    transition: all 0.3s;
                    font-weight: 500;
                    margin-top: 0.5rem;
                }

                .btn:hover {
                    background-color: var(--primary-hover);
                    transform: translateY(-2px);
                    box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
                }

                .message {
                    margin: 1.2rem 0;
                    padding: 0.8rem;
                    border-radius: 8px;
                    font-size: 0.9rem;
                }

                .success-message {
                    background-color: rgba(76, 201, 240, 0.1);
                    color: var(--success-color);
                    border-left: 4px solid var(--success-color);
                }

                .error-message {
                    background-color: rgba(247, 37, 133, 0.1);
                    color: var(--error-color);
                    border-left: 4px solid var(--error-color);
                }

                .footer-links {
                    margin-top: 1.5rem;
                    font-size: 0.9rem;
                    text-align: center;
                }

                .footer-links a {
                    color: var(--primary-color);
                    text-decoration: none;
                    transition: color 0.3s;
                }

                .footer-links a:hover {
                    color: var(--primary-hover);
                    text-decoration: underline;
                }

                @media (max-width: 480px) {
                    .login-container {
                        padding: 1.5rem;
                        margin: 0 15px;
                    }
                }
            </style>
        </head>

        <body>
            <div class="login-container">
                <div class="logo">欢迎登录</div>
                <div class="subtitle">请输入您的账号和密码</div>

                <!-- 显示退出成功消息 -->
                <c:if test="${not empty message}">
                    <div class="message success-message">${message}</div>
                </c:if>

                <!-- 显示登录错误消息 -->
                <c:if test="${not empty error}">
                    <div class="message error-message">${error}</div>
                </c:if>

                <form action="${pageContext.request.contextPath}/user/login" method="post">
                    <div class="form-group">
                        <label for="username">用户名</label>
                        <input type="text" id="username" name="username" required placeholder="请输入用户名">
                    </div>

                    <div class="form-group">
                        <label for="password">密码</label>
                        <input type="password" id="password" name="password" required placeholder="请输入密码">
                    </div>

                    <button type="submit" class="btn">登录</button>
                </form>

                <div class="footer-links">
                    还没有账号? <a href="${pageContext.request.contextPath}/user/register">立即注册</a>
                </div>
            </div>
        </body>

        </html>