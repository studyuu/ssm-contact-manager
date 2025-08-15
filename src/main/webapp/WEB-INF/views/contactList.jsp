<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>联系人列表</title>
            <style>
                :root {
                    --primary-color: #4361ee;
                    --primary-hover: #3a56d4;
                    --danger-color: #f72585;
                    --success-color: #4cc9f0;
                    --text-color: #2b2d42;
                    --light-gray: #f8f9fa;
                    --border-color: #e9ecef;
                }

                body {
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    background-color: #f8fafc;
                    color: var(--text-color);
                    margin: 0;
                    padding: 20px;
                }

                .container {
                    max-width: 1200px;
                    margin: 0 auto;
                    background-color: white;
                    border-radius: 12px;
                    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
                    padding: 30px;
                }

                .user-bar {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 25px;
                    padding-bottom: 15px;
                    border-bottom: 1px solid var(--border-color);
                }

                .welcome-message {
                    font-size: 1.1rem;
                    font-weight: 500;
                }

                .welcome-message span {
                    color: var(--primary-color);
                    font-weight: 600;
                }

                .logout-btn {
                    background-color: var(--light-gray);
                    color: var(--text-color);
                    border: none;
                    padding: 8px 16px;
                    border-radius: 6px;
                    cursor: pointer;
                    text-decoration: none;
                    font-size: 0.9rem;
                    transition: all 0.2s;
                    display: flex;
                    align-items: center;
                    gap: 6px;
                }

                .logout-btn:hover {
                    background-color: #e9ecef;
                }

                .logout-btn::before {
                    content: "🚪";
                }

                .page-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 25px;
                }

                .page-title {
                    font-size: 1.8rem;
                    font-weight: 600;
                    color: var(--text-color);
                    margin: 0;
                }

                .add-contact-btn {
                    background-color: var(--primary-color);
                    color: white;
                    padding: 10px 20px;
                    border-radius: 6px;
                    text-decoration: none;
                    font-weight: 500;
                    transition: all 0.2s;
                }

                .add-contact-btn:hover {
                    background-color: var(--primary-hover);
                    transform: translateY(-1px);
                    box-shadow: 0 2px 8px rgba(67, 97, 238, 0.2);
                }

                .message {
                    padding: 12px 16px;
                    border-radius: 6px;
                    margin-bottom: 20px;
                    font-size: 0.95rem;
                }

                .success-message {
                    background-color: rgba(76, 201, 240, 0.1);
                    color: var(--success-color);
                    border-left: 4px solid var(--success-color);
                }

                .error-message {
                    background-color: rgba(247, 37, 133, 0.1);
                    color: var(--danger-color);
                    border-left: 4px solid var(--danger-color);
                }

                .contacts-table {
                    width: 100%;
                    border-collapse: separate;
                    border-spacing: 0;
                    margin-top: 20px;
                }

                .contacts-table th {
                    background-color: var(--light-gray);
                    color: var(--text-color);
                    font-weight: 600;
                    text-align: left;
                    padding: 12px 16px;
                    position: sticky;
                    top: 0;
                }

                .contacts-table td {
                    padding: 12px 16px;
                    border-bottom: 1px solid var(--border-color);
                    vertical-align: middle;
                }

                .contacts-table tr:not(:first-child):hover {
                    background-color: rgba(67, 97, 238, 0.03);
                }

                .action-buttons {
                    display: flex;
                    gap: 8px;
                }

                .action-btn {
                    padding: 6px 12px;
                    border-radius: 4px;
                    text-decoration: none;
                    font-size: 0.85rem;
                    transition: all 0.2s;
                }

                .edit-btn {
                    background-color: rgba(67, 97, 238, 0.1);
                    color: var(--primary-color);
                }

                .edit-btn:hover {
                    background-color: rgba(67, 97, 238, 0.2);
                }

                .delete-btn {
                    background-color: rgba(247, 37, 133, 0.1);
                    color: var(--danger-color);
                }

                .delete-btn:hover {
                    background-color: rgba(247, 37, 133, 0.2);
                }

                .empty-state {
                    text-align: center;
                    padding: 40px 0;
                    color: #6c757d;
                }

                .empty-state-icon {
                    font-size: 3rem;
                    margin-bottom: 15px;
                    opacity: 0.5;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <!-- 登录状态显示和退出按钮 -->
                <div class="user-bar">
                    <div class="welcome-message">欢迎 <span>${user.username}</span>!</div>
                    <a href="${pageContext.request.contextPath}/logout" class="logout-btn">退出登录</a>
                </div>

                <!-- 显示操作结果消息 -->
                <c:if test="${not empty successMessage}">
                    <div class="message success-message">${successMessage}</div>
                </c:if>
                <c:if test="${not empty errorMessage}">
                    <div class="message error-message">${errorMessage}</div>
                </c:if>

                <div class="page-header">
                    <h1 class="page-title">联系人列表</h1>
                    <a href="${pageContext.request.contextPath}/contacts/add" class="add-contact-btn">+ 添加联系人</a>
                </div>

                <table class="contacts-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>地址</th>
                            <th>邮箱</th>
                            <th>电话</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty contacts}">
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
                                                <a href="${pageContext.request.contextPath}/contacts/edit/${contact.id}"
                                                    class="action-btn edit-btn">编辑</a>
                                                <a href="${pageContext.request.contextPath}/contacts/delete/${contact.id}"
                                                    class="action-btn delete-btn"
                                                    onclick="return confirm('确定要删除此联系人吗？')">删除</a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="7">
                                        <div class="empty-state">
                                            <div class="empty-state-icon">📇</div>
                                            <h3>暂无联系人</h3>
                                            <p>点击上方按钮添加第一个联系人</p>
                                        </div>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>

            <script>
                // 可以在这里添加退出前的确认对话框
                document.querySelector('.logout-btn').addEventListener('click', function (e) {
                    if (!confirm('确定要退出登录吗？')) {
                        e.preventDefault();
                    }
                });
            </script>
        </body>

        </html>