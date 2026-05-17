<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>名片管理系统 - 登录</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: "Microsoft YaHei", sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .login-container {
            background: #fff;
            border-radius: 10px;
            padding: 40px;
            width: 380px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }
        .login-title {
            text-align: center;
            font-size: 26px;
            color: #333;
            margin-bottom: 30px;
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s;
        }
        .form-group input:focus {
            outline: none;
            border-color: #667eea;
        }
        .code-group {
            display: flex;
            gap: 10px;
        }
        .code-group input {
            flex: 1;
        }
        .code-group img {
            height: 42px;
            cursor: pointer;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        .msg {
            color: #e74c3c;
            font-size: 13px;
            margin-bottom: 15px;
            text-align: center;
        }
        .login-btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: opacity 0.3s;
        }
        .login-btn:hover { opacity: 0.9; }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-title">名片管理系统</div>
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label>用户名</label>
                <input type="text" name="username" placeholder="请输入用户名" required/>
            </div>
            <div class="form-group">
                <label>密码</label>
                <input type="password" name="password" placeholder="请输入密码" required/>
            </div>
            <div class="form-group">
                <label>验证码</label>
                <div class="code-group">
                    <input type="text" name="code" placeholder="请输入验证码" required maxlength="4"/>
                    <img src="${pageContext.request.contextPath}/image" id="codeImg" onclick="refreshCode()" title="点击刷新验证码"/>
                </div>
            </div>
            <div class="msg">${msg}</div>
            <button type="submit" class="login-btn">登 录</button>
        </form>
        <div style="text-align:center;margin-top:15px;font-size:14px;color:#999;">
            还没有账号？<a href="${pageContext.request.contextPath}/toRegister" style="color:#667eea;text-decoration:none;">立即注册</a>
        </div>
    </div>
    <script>
        function refreshCode() {
            document.getElementById("codeImg").src = "${pageContext.request.contextPath}/image?t=" + new Date().getTime();
        }
    </script>
</body>
</html>
