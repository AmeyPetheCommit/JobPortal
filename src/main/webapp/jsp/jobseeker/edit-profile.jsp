<%@ page import="com.model.JInfo" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    if (session == null || !"JSK".equals(session.getAttribute("role"))) {
        response.sendRedirect("../auth/login.jsp");
        return;
    }

    if (request.getAttribute("jinfo") == null) {
        response.sendRedirect(request.getContextPath() + "/jsk?action=profile");
        return;
    }

    JInfo jinfo = (JInfo) request.getAttribute("jinfo");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile | Job Seeker</title>

    <style>
        body { background:#f3f4f6; }

        .edit-container {
            max-width: 700px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        h2 { margin-bottom: 20px; }

        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 8px;
            border: 1px solid #d1d5db;
        }

        button {
            margin-top: 25px;
            padding: 12px 20px;
            background: #2563eb;
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
        }

        button:hover { background:#1e40af; }
    </style>
</head>

<body>

<jsp:include page="../common/header.jsp"/>

<div class="edit-container">

    <h2>Edit Job Seeker Profile</h2>

    <form method="post" action="<%=request.getContextPath()%>/jsk?action=update">

        <!-- ID NOT EDITABLE -->
        <label>Name</label>
        <input type="text" name="name" value="<%= jinfo.getName() %>" required>

        <label>Phone</label>
        <input type="text" name="phone" value="<%= jinfo.getPhone() %>">

        <label>Skills</label>
        <input type="text" name="skills" value="<%= jinfo.getSkills() %>">

        <label>Experience</label>
        <input type="text" name="experience" value="<%= jinfo.getExperience() %>">

        <label>Qualification</label>
        <input type="text" name="qualification" value="<%= jinfo.getQualification() %>">

        <button type="submit">Update Profile</button>
    </form>

</div>

<jsp:include page="../common/footer.jsp"/>

</body>
</html>
