<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register | Job Portal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #667eea, #764ba2);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .container {
            background: #fff;
            padding: 30px;
            width: 420px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        select, input, textarea, button {
            width: 100%;
            margin: 8px 0;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        textarea {
            resize: none;
        }

        button {
            background: #667eea;
            color: #fff;
            border: none;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: #5a67d8;
        }

        .hidden {
            display: none;
        }

        .link {
            text-align: center;
            margin-top: 10px;
        }

        .link a {
            color: #667eea;
            text-decoration: none;
        }
    </style>

    <script>
        function toggleFields() {
            let role = document.getElementById("role").value;

            document.getElementById("jskFields").style.display =
                role === "JSK" ? "block" : "none";

            document.getElementById("companyFields").style.display =
                role === "COMPANY" ? "block" : "none";
        }
    </script>
</head>

<body>
<div class="container">
    <h2>Create Account</h2>

    <form action="<%=request.getContextPath()%>/register" method="post">

        <select name="role" id="role" required onchange="toggleFields()">
            <option value="">Select Role</option>
            <option value="JSK">Job Seeker</option>
            <option value="COMPANY">Company</option>
        </select>

        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>

        <!-- Job Seeker Fields -->
        <div id="jskFields" class="hidden">
            <input type="text" name="name" placeholder="Full Name">
            <input type="text" name="phone" placeholder="Phone">
            <input type="text" name="skills" placeholder="Skills">
            <input type="text" name="experience" placeholder="Experience">
            <input type="text" name="qualification" placeholder="Qualification">
        </div>

        <!-- Company Fields -->
        <div id="companyFields" class="hidden">
            <input type="text" name="companyName" placeholder="Company Name">
            <input type="text" name="location" placeholder="Location">
            <input type="text" name="website" placeholder="Website">
            <textarea name="description" placeholder="Company Description"></textarea>
        </div>

        <button type="submit">Register</button>
    </form>

    <div class="link">
        Already have an account? <a href="login.jsp">Login</a>
    </div>
</div>
</body>
</html>
