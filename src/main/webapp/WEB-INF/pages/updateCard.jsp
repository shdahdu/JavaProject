<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>名片管理系统 - 修改名片</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: "Microsoft YaHei", sans-serif;
            background: #f5f7fa;
            min-height: 100vh;
        }
        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #fff;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header h1 { font-size: 22px; }
        .header a {
            color: #fff;
            text-decoration: none;
            font-size: 14px;
            opacity: 0.9;
        }
        .header a:hover { opacity: 1; text-decoration: underline; }
        .container { max-width: 600px; margin: 30px auto; padding: 0 20px; }
        .form-card {
            background: #fff;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }
        .form-card h2 {
            font-size: 20px;
            color: #333;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 1px solid #f0f0f0;
        }
        .form-group {
            margin-bottom: 18px;
        }
        .form-group label {
            display: block;
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s;
        }
        .form-group input:focus, .form-group select:focus {
            outline: none;
            border-color: #667eea;
        }
        .form-group input[type="file"] { padding: 8px 0; border: none; }
        .form-row {
            display: flex;
            gap: 15px;
        }
        .form-row .form-group { flex: 1; }
        .msg {
            color: #e74c3c;
            font-size: 13px;
            margin-bottom: 15px;
        }
        .current-logo {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 5px;
        }
        .current-logo img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
            border: 1px solid #ddd;
        }
        .current-logo span {
            font-size: 13px;
            color: #999;
        }
        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        .btn {
            display: inline-block;
            padding: 10px 25px;
            border: none;
            border-radius: 5px;
            font-size: 15px;
            cursor: pointer;
            text-decoration: none;
            transition: opacity 0.3s;
        }
        .btn:hover { opacity: 0.85; }
        .btn-primary { background: #667eea; color: #fff; }
        .btn-secondary { background: #95a5a6; color: #fff; }
    </style>
</head>
<body>
    <div class="header">
        <h1>名片管理系统</h1>
        <a href="${pageContext.request.contextPath}/cardList">返回列表</a>
    </div>
    <div class="container">
        <div class="form-card">
            <h2>修改名片</h2>
            <div class="msg">${msg}</div>
            <form action="${pageContext.request.contextPath}/updateCard" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${card.id}"/>
                <div class="form-row">
                    <div class="form-group">
                        <label>姓名 *</label>
                        <input type="text" name="name" value="${card.name}" required placeholder="请输入姓名"/>
                    </div>
                    <div class="form-group">
                        <label>电话 *</label>
                        <input type="text" name="phone" value="${card.phone}" required placeholder="请输入电话"/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>公司</label>
                        <input type="text" name="company" value="${card.company}" placeholder="请输入公司"/>
                    </div>
                    <div class="form-group">
                        <label>职位</label>
                        <input type="text" name="position" value="${card.position}" placeholder="请输入职位"/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>邮箱</label>
                        <input type="email" name="email" value="${card.email}" placeholder="请输入邮箱"/>
                    </div>
                    <div class="form-group">
                        <label>类型</label>
                        <select name="type">
                            <option value="">请选择</option>
                            <option value="客户" ${card.type == '客户' ? 'selected' : ''}>客户</option>
                            <option value="供应商" ${card.type == '供应商' ? 'selected' : ''}>供应商</option>
                            <option value="朋友" ${card.type == '朋友' ? 'selected' : ''}>朋友</option>
                            <option value="同事" ${card.type == '同事' ? 'selected' : ''}>同事</option>
                            <option value="其他" ${card.type == '其他' ? 'selected' : ''}>其他</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label>地址</label>
                    <input type="text" name="address" value="${card.address}" placeholder="请输入地址"/>
                </div>
                <div class="form-group">
                    <label>Logo图片</label>
                    <input type="file" name="logoFile" accept="image/*"/>
                    <c:if test="${not empty card.logo}">
                        <div class="current-logo">
                            <img src="${pageContext.request.contextPath}/${card.logo}"/>
                            <span>当前Logo（留空则不修改）</span>
                        </div>
                    </c:if>
                </div>
                <div class="btn-group">
                    <button type="submit" class="btn btn-primary">保存修改</button>
                    <a href="${pageContext.request.contextPath}/cardList" class="btn btn-secondary">取消</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
