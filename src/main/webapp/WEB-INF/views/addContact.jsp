<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加联系人</title>
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
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            padding: 30px;
        }
        
        .page-header {
            margin-bottom: 25px;
            text-align: center;
        }
        
        .page-title {
            font-size: 1.8rem;
            font-weight: 600;
            color: var(--text-color);
            margin: 0 0 10px 0;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            font-size: 0.9rem;
        }
        
        .form-control {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 1rem;
            transition: border-color 0.3s;
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            outline: none;
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
        }
        
        .btn {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 0.8rem 1.5rem;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            transition: all 0.3s;
            font-weight: 500;
        }
        
        .btn:hover {
            background-color: var(--primary-hover);
            transform: translateY(-1px);
            box-shadow: 0 2px 8px rgba(67, 97, 238, 0.2);
        }
        
        .btn-block {
            display: block;
            width: 100%;
        }
        
        .back-link {
            display: inline-block;
            margin-top: 1.5rem;
            color: var(--primary-color);
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .back-link:hover {
            color: var(--primary-hover);
            text-decoration: underline;
        }
        
        .error-message {
            color: var(--danger-color);
            font-size: 0.8rem;
            margin-top: 0.3rem;
        }
        
        @media (max-width: 640px) {
            .container {
                padding: 1.5rem;
            }
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="page-header">
            <h1 class="page-title">添加联系人</h1>
        </div>
        
        <form:form action="${pageContext.request.contextPath}/contacts/add" method="post" modelAttribute="infro">
            <div class="form-group">
                <label for="id">ID</label>
                <form:input path="id" cssClass="form-control" id="id" />
                <form:errors path="id" cssClass="error-message" />
            </div>
            
            <div class="form-group">
                <label for="name">姓名</label>
                <form:input path="name" cssClass="form-control" id="name" />
                <form:errors path="name" cssClass="error-message" />
            </div>
            
            <div class="form-group">
                <label for="sex">性别</label>
                <form:select path="sex" cssClass="form-control" id="sex">
                    <form:option value="">-- 请选择 --</form:option>
                    <form:option value="男">男</form:option>
                    <form:option value="女">女</form:option>
                </form:select>
                <form:errors path="sex" cssClass="error-message" />
            </div>
            
            <div class="form-group">
                <label for="address">地址</label>
                <form:input path="address" cssClass="form-control" id="address" />
                <form:errors path="address" cssClass="error-message" />
            </div>
            
            <div class="form-group">
                <label for="e_mail">邮箱</label>
                <form:input path="e_mail" type="email" cssClass="form-control" id="e_mail" />
                <form:errors path="e_mail" cssClass="error-message" />
            </div>
            
            <div class="form-group">
                <label for="phoneNumber">电话</label>
                <form:input path="phoneNumber" cssClass="form-control" id="phoneNumber" />
                <form:errors path="phoneNumber" cssClass="error-message" />
            </div>
            
            <button type="submit" class="btn btn-block">提交</button>
        </form:form>
        
        <a href="${pageContext.request.contextPath}/contacts/list" class="back-link">← 返回联系人列表</a>
    </div>
</body>

</html>