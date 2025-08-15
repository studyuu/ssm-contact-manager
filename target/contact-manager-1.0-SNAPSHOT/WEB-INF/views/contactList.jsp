<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>联系人列表</title>
            <style>
                table {
                    width: 100%;
                    border-collapse: collapse;
                }

                table,
                th,
                td {
                    border: 1px solid #ddd;
                    padding: 8px;
                }

                th {
                    background-color: #f2f2f2;
                }

                tr:hover {
                    background-color: #f5f5f5;
                }

                .action-buttons {
                    display: flex;
                    gap: 5px;
                }

                .success-message {
                    color: green;
                    margin: 10px 0;
                }

                .error-message {
                    color: red;
                    margin: 10px 0;
                }
            </style>
        </head>

        <body>
        <!-- 登录状态显示 -->
    <div style="margin-bottom: 20px;">
        欢迎 ${user.username}! 
        <a href="${pageContext.request.contextPath}/logout">退出</a>
    </div>
            <!-- 显示操作结果消息 -->
            <c:if test="${not empty successMessage}">
                <div class="success-message">${successMessage}</div>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="error-message">${errorMessage}</div>
            </c:if>

            <h2>联系人列表</h2>
            <a href="${pageContext.request.contextPath}/contacts/add">添加联系人</a>
            <table>
                <tr>
                    <th>ID</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>地址</th>
                    <th>邮箱</th>
                    <th>电话</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${contacts}" var="contact">
                    <tr>
                        <td>${contact.id}</td>
                        <td>${contact.name}</td>
                        <td>${contact.sex}</td>
                        <td>${contact.address}</td>
                        <td>${contact.e_mail}</td>
                        <td>${contact.phoneNumber}</td>
                        <td>
                            <div class="action-buttons">
                                <a href="${pageContext.request.contextPath}/contacts/edit/${contact.id}">编辑</a>
                                <a href="${pageContext.request.contextPath}/contacts/delete/${contact.id}"
                                    onclick="return confirm('确定要删除吗?')">删除</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </body>

        </html>