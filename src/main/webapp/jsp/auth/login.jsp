<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login | Job Portal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #43cea2, #185a9d);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .container {
            background: #fff;
            padding: 30px;
            width: 380px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        select, input, button {
            width: 100%;
            margin: 8px 0;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button {
            background: #185a9d;
            color: #fff;
            border: none;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: #144e86;
        }

        .hidden {
            display: none;
        }

        .link {
            text-align: center;
            margin-top: 10px;
        }

        .link a {
            color: #185a9d;
            text-decoration: none;
        }
    </style>

    <script>
        function toggleLoginFields() {
            let role = document.getElementById("role").value;

            document.getElementById("jskLogin").style.display =
                role === "JSK" ? "block" : "none";

            document.getElementById("companyLogin").style.display =
                role === "COMPANY" ? "block" : "none";
        }
    </script>
</head>

<body>
<div class="container">
    <h2>Login</h2>

    <form action="<%=request.getContextPath()%>/login" method="post">

        <select name="role" id="role" required onchange="toggleLoginFields()">
            <option value="">Select Role</option>
            <option value="JSK">Job Seeker</option>
            <option value="COMPANY">Company</option>
        </select>

        <!-- Job Seeker Login -->
        <div id="jskLogin" class="hidden">
            <input type="email" name="email" placeholder="Email">
        </div>

        <!-- Company Login -->
        <div id="companyLogin" class="hidden">
            <input type="number" name="companyId" placeholder="Company ID">
        </div>

        <input type="password" name="password" placeholder="Password" required>

        <button type="submit">Login</button>
    </form>

    <div class="link">
        New user? <a href="register.jsp">Create Account</a>
    </div>
</div>
</body>
</html>
