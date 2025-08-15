<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>编辑联系人</title>
                <style>
                    .error-message {
                        color: red;
                        margin-bottom: 15px;
                    }

                    form {
                        width: 500px;
                        margin: 0 auto;
                    }

                    label {
                        display: block;
                        margin-bottom: 5px;
                    }

                    input {
                        width: 100%;
                        padding: 8px;
                        margin-bottom: 15px;
                        border: 1px solid #ddd;
                        border-radius: 4px;
                    }

                    button {
                        background-color: #4CAF50;
                        color: white;
                        padding: 10px 15px;
                        border: none;
                        border-radius: 4px;
                        cursor: pointer;
                    }

                    button:hover {
                        background-color: #45a049;
                    }
                </style>
            </head>

            <body>
                <c:if test="${infro == null}">
                    <div class="error-message">
                        <p>错误：未找到该联系人信息。</p>
                        <a href="${pageContext.request.contextPath}/contacts/list">返回列表</a>
                    </div>
                </c:if>

                <c:if test="${infro != null}">
                    <h2>编辑联系人</h2>
                    <form:form action="${pageContext.request.contextPath}/contacts/edit" method="post"
                        modelAttribute="infro">
                        <label>ID:</label>
                        <form:input path="id" readonly="true" />
                        <label>姓名:</label>
                        <form:input path="name" />
                        <label>性别:</label>
                        <form:input path="sex" />
                        <label>地址:</label>
                        <form:input path="address" />
                        <label>邮箱:</label>
                        <form:input path="e_mail" />
                        <label>电话:</label>
                        <form:input path="phoneNumber" />
                        <button type="submit">更新</button>
                    </form:form>
                    <a href="${pageContext.request.contextPath}/contacts/list">返回列表</a>
                </c:if>
            </body>

            </html>