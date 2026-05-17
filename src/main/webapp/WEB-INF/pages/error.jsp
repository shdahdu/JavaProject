<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>错误页面</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: "Microsoft YaHei", sans-serif;
            background: #f5f7fa;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .error-container {
            background: #fff;
            border-radius: 10px;
            padding: 50px;
            text-align: center;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            max-width: 500px;
            width: 100%;
        }
        .error-icon {
            font-size: 60px;
            color: #e74c3c;
            margin-bottom: 20px;
        }
        .error-container h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 15px;
        }
        .error-container p {
            font-size: 14px;
            color: #666;
            margin-bottom: 10px;
            line-height: 1.6;
        }
        .error-detail {
            background: #fdf0ed;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
            padding: 12px;
            margin: 15px 0;
            text-align: left;
            font-size: 13px;
            color: #e74c3c;
            word-break: break-all;
        }
        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 25px;
            background: #667eea;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 15px;
            cursor: pointer;
            text-decoration: none;
            transition: opacity 0.3s;
        }
        .btn:hover { opacity: 0.9; }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-icon">&#9888;</div>
        <h2>系统出现异常</h2>
        <p>抱歉，系统在处理您的请求时遇到了问题，请稍后重试。</p>
        <div class="error-detail">
            <strong>错误信息：</strong>${errorMsg}
        </div>
        <p style="font-size:12px;color:#999;">请求地址：${url}</p>
        <a href="${pageContext.request.contextPath}/cardList" class="btn">返回首页</a>
    </div>
</body>
</html>
