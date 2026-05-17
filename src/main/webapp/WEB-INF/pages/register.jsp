<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>名片管理系统 - 注册</title>
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
        .register-container {
            background: #fff;
            border-radius: 10px;
            padding: 40px;
            width: 420px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }
        .register-title {
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
        .msg {
            color: #e74c3c;
            font-size: 13px;
            margin-bottom: 15px;
            text-align: center;
        }
        .msg-success {
            color: #2ecc71;
            font-size: 13px;
            margin-bottom: 15px;
            text-align: center;
        }
        .register-btn {
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
        .register-btn:hover { opacity: 0.9; }
        .login-link {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
            color: #999;
        }
        .login-link a {
            color: #667eea;
            text-decoration: none;
        }
        .login-link a:hover { text-decoration: underline; }
        .check-status {
            font-size: 12px;
            margin-top: 3px;
        }
        .check-status.available { color: #2ecc71; }
        .check-status.unavailable { color: #e74c3c; }
        .check-status.checking { color: #f39c12; }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="register-title">用户注册</div>
        <div class="msg">${msg}</div>
        <form action="${pageContext.request.contextPath}/register" method="post" onsubmit="return checkForm()">
            <div class="form-group">
                <label>用户名</label>
                <input type="text" name="username" id="username" placeholder="请输入用户名" required onblur="checkUsername()"/>
                <div class="check-status" id="checkResult"></div>
            </div>
            <div class="form-group">
                <label>密码</label>
                <input type="password" name="password" id="password" placeholder="请输入密码" required/>
            </div>
            <div class="form-group">
                <label>确认密码</label>
                <input type="password" id="repassword" placeholder="请再次输入密码" required onblur="checkPassword()"/>
                <div class="check-status" id="pwdResult"></div>
            </div>
            <button type="submit" class="register-btn">注 册</button>
        </form>
        <div class="login-link">
            已有账号？<a href="${pageContext.request.contextPath}/toLogin">立即登录</a>
        </div>
    </div>
    <script>
        var usernameOk = false;

        // AJAX检查用户名是否可用
        function checkUsername() {
            var username = document.getElementById("username").value;
            var checkResult = document.getElementById("checkResult");
            
            if (username == "") {
                checkResult.innerHTML = "";
                checkResult.className = "check-status";
                usernameOk = false;
                return;
            }

            checkResult.innerHTML = "正在检查...";
            checkResult.className = "check-status checking";

            var xhr = new XMLHttpRequest();
            xhr.open("GET", "${pageContext.request.contextPath}/checkUName?username=" + encodeURIComponent(username), true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    if (xhr.responseText == "true") {
                        checkResult.innerHTML = "✓ 用户名可用";
                        checkResult.className = "check-status available";
                        usernameOk = true;
                    } else {
                        checkResult.innerHTML = "✗ 用户名已存在";
                        checkResult.className = "check-status unavailable";
                        usernameOk = false;
                    }
                }
            };
            xhr.send();
        }

        // 检查两次密码是否一致
        function checkPassword() {
            var pwd = document.getElementById("password").value;
            var repwd = document.getElementById("repassword").value;
            var pwdResult = document.getElementById("pwdResult");

            if (repwd == "") {
                pwdResult.innerHTML = "";
                pwdResult.className = "check-status";
                return;
            }

            if (pwd == repwd) {
                pwdResult.innerHTML = "✓ 密码一致";
                pwdResult.className = "check-status available";
            } else {
                pwdResult.innerHTML = "✗ 两次密码输入不一致";
                pwdResult.className = "check-status unavailable";
            }
        }

        // 提交前校验
        function checkForm() {
            if (!usernameOk) {
                alert("请检查用户名是否可用！");
                return false;
            }
            var pwd = document.getElementById("password").value;
            var repwd = document.getElementById("repassword").value;
            if (pwd != repwd) {
                alert("两次密码输入不一致！");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
