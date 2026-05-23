<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>名片管理系统 - 名片列表</title>
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
        .header-right { display: flex; align-items: center; gap: 15px; }
        .header-right span { font-size: 14px; opacity: 0.9; }
        .header-right a {
            color: #fff;
            text-decoration: none;
            font-size: 14px;
            opacity: 0.9;
            transition: opacity 0.3s;
        }
        .header-right a:hover { opacity: 1; text-decoration: underline; }
        .container { max-width: 1100px; margin: 20px auto; padding: 0 20px; }
        .toolbar {
            background: #fff;
            border-radius: 8px;
            padding: 15px 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .search-form { display: flex; gap: 10px; align-items: center; }
        .search-form input {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            width: 250px;
        }
        .search-form input:focus { outline: none; border-color: #667eea; }
        .btn {
            display: inline-block;
            padding: 8px 18px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
            transition: opacity 0.3s;
        }
        .btn:hover { opacity: 0.85; }
        .btn-primary { background: #667eea; color: #fff; }
        .btn-success { background: #2ecc71; color: #fff; }
        .btn-danger { background: #e74c3c; color: #fff; }
        .btn-warning { background: #f39c12; color: #fff; }
        .btn-sm { padding: 5px 12px; font-size: 12px; }
        .card-table {
            width: 100%;
            background: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }
        .card-table table {
            width: 100%;
            border-collapse: collapse;
        }
        .card-table th {
            background: #f8f9fa;
            padding: 12px 15px;
            text-align: left;
            font-size: 14px;
            color: #555;
            border-bottom: 2px solid #e9ecef;
        }
        .card-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #f0f0f0;
            font-size: 14px;
            color: #333;
        }
        .card-table tr:hover { background: #f8f9ff; }
        .logo-img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
        }
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
            gap: 5px;
        }
        .pagination a, .pagination span {
            display: inline-block;
            padding: 8px 14px;
            border-radius: 5px;
            font-size: 14px;
            text-decoration: none;
            color: #667eea;
            background: #fff;
            border: 1px solid #ddd;
            transition: all 0.3s;
        }
        .pagination a:hover { background: #667eea; color: #fff; border-color: #667eea; }
        .pagination .active { background: #667eea; color: #fff; border-color: #667eea; }
        .pagination .info { border: none; color: #666; background: transparent; }
        .empty-msg {
            text-align: center;
            padding: 40px;
            color: #999;
            font-size: 16px;
        }
        .action-group { display: flex; gap: 5px; }
    </style>
</head>
<body>
    <div class="header">
        <h1>名片管理系统</h1>
        <div class="header-right">
            <span>欢迎您，${sessionScope.user.username}</span>
            <a href="${pageContext.request.contextPath}/logout">退出登录</a>
        </div>
    </div>

    <div class="container">
        <div class="toolbar">
            <form class="search-form" action="${pageContext.request.contextPath}/cardList" method="get">
                <input type="text" name="keyword" placeholder="搜索姓名/公司/电话..." value="${keyword}"/>
                <button type="submit" class="btn btn-primary">搜索</button>
                <c:if test="${not empty keyword}">
                    <a href="${pageContext.request.contextPath}/cardList" class="btn btn-warning">取消搜索</a>
                </c:if>
            </form>
            <a href="${pageContext.request.contextPath}/toAddCard" class="btn btn-success">+ 添加名片</a>
        </div>

        <div class="card-table">
            <table>
                <thead>
                    <tr>
                        <th>Logo</th>
                        <th>姓名</th>
                        <th>公司</th>
                        <th>职位</th>
                        <th>电话</th>
                        <th>邮箱</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty cardList}">
                            <tr>
                                <td colspan="7">
                                    <div class="empty-msg">暂无名片数据</div>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${cardList}" var="card">
                                <tr>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty card.logo}">
                                                <img src="${pageContext.request.contextPath}/${card.logo}" class="logo-img"/>
                                            </c:when>
                                            <c:otherwise>
                                                <img src="${pageContext.request.contextPath}/images/default.png" class="logo-img" style="background:#f0f0f0;"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${card.name}</td>
                                    <td>${card.company}</td>
                                    <td>${card.position}</td>
                                    <td>${card.phone}</td>
                                    <td>${card.email}</td>
                                    <td>
                                        <div class="action-group">
                                            <a href="${pageContext.request.contextPath}/toUpdateCard?id=${card.id}" class="btn btn-warning btn-sm">修改</a>
                                            <a href="${pageContext.request.contextPath}/deleteCard?id=${card.id}"
                                               class="btn btn-danger btn-sm"
                                               onclick="return confirm('确定要删除该名片吗？')">删除</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>

        <!-- 分页 -->
        <c:if test="${pageInfo.totalPages > 1}">
            <div class="pagination">
                <span class="info">共 ${pageInfo.totalCount} 条记录</span>
                <c:if test="${pageInfo.pageNum > 1}">
                    <a href="${pageContext.request.contextPath}/cardList?pageNum=${pageInfo.pageNum - 1}${not empty keyword ? '&keyword='.concat(keyword) : ''}">上一页</a>
                </c:if>
                <c:forEach items="${pageInfo.pageList}" var="p">
                    <c:choose>
                        <c:when test="${p == pageInfo.pageNum}">
                            <span class="active">${p}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/cardList?pageNum=${p}${not empty keyword ? '&keyword='.concat(keyword) : ''}">${p}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${pageInfo.pageNum < pageInfo.totalPages}">
                    <a href="${pageContext.request.contextPath}/cardList?pageNum=${pageInfo.pageNum + 1}${not empty keyword ? '&keyword='.concat(keyword) : ''}">下一页</a>
                </c:if>
            </div>
        </c:if>
    </div>
</body>
</html>
