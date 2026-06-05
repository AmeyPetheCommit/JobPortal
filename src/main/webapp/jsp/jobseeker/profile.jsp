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
    <title>My Profile | Job Portal</title>

    <style>
        body {
            overflow-x: hidden;
        }

        .profile-container {
            max-width: 900px;
            margin: 40px auto;
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            padding: 30px;
        }

        .profile-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #e5e7eb;
            padding-bottom: 20px;
        }

        .header-left {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .avatar {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background: linear-gradient(135deg, #2563eb, #3b82f6);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 36px;
            color: white;
            font-weight: bold;
        }

        .profile-body {
            margin-top: 30px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .info-card {
            background: #f9fafb;
            padding: 20px;
            border-radius: 12px;
            border-left: 5px solid #2563eb;
        }

        .info-card h4 {
            margin: 0 0 5px;
            color: #2563eb;
        }

        .info-card p {
            margin: 0;
            color: #374151;
            font-weight: 500;
        }

        .actions a {
            background: #2563eb;
            color: white;
            padding: 10px 18px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
        }

        .actions a:hover {
            background: #1e40af;
        }
    </style>
</head>

<body>

<jsp:include page="../common/header.jsp"/>

<div class="profile-container">

    <!-- 🔹 HEADER -->
    <div class="profile-header">
        <div class="header-left">
            <div class="avatar">
                <%= (jinfo != null && jinfo.getName() != null)
                        ? jinfo.getName().substring(0,1).toUpperCase()
                        : "U" %>
            </div>
            <div>
                <h2>
                    <%= (jinfo != null && jinfo.getName() != null)
                            ? jinfo.getName()
                            : "User" %>
                </h2>
                <p>Job Seeker Profile</p>
            </div>
        </div>

        <!-- ✅ CORRECT EDIT PROFILE LINK -->
        <div class="actions">
            <a href="<%=request.getContextPath()%>/jsk?action=edit">
                Edit Profile
            </a>
        </div>
    </div>

    <!-- 🔹 PROFILE DETAILS -->
    <div class="profile-body">

        <div class="info-card">
            <h4>Phone</h4>
            <p><%= (jinfo != null && jinfo.getPhone() != null && !jinfo.getPhone().isEmpty())
                    ? jinfo.getPhone()
                    : "Not Provided" %></p>
        </div>

        <div class="info-card">
            <h4>Skills</h4>
            <p><%= (jinfo != null && jinfo.getSkills() != null && !jinfo.getSkills().isEmpty())
                    ? jinfo.getSkills()
                    : "Not Provided" %></p>
        </div>

        <div class="info-card">
            <h4>Experience</h4>
            <p><%= (jinfo != null && jinfo.getExperience() != null && !jinfo.getExperience().isEmpty())
                    ? jinfo.getExperience()
                    : "Not Provided" %></p>
        </div>

        <div class="info-card">
            <h4>Qualification</h4>
            <p><%= (jinfo != null && jinfo.getQualification() != null && !jinfo.getQualification().isEmpty())
                    ? jinfo.getQualification()
                    : "Not Provided" %></p>
        </div>

    </div>

</div>

<jsp:include page="../common/footer.jsp"/>

</body>
</html>
