<%@ page contentType="text/html;charset=UTF-8" %>
<%
    if (session == null || !"JSK".equals(session.getAttribute("role"))) {
        response.sendRedirect("../auth/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Job Seeker Dashboard</title>

    <style>
        .container {
            padding: 30px;
        }

        .welcome {
            margin-bottom: 30px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            transition: transform 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            margin-top: 0;
            color: #2563eb;
        }

        .card p {
            color: #555;
        }

        .card a {
            display: inline-block;
            margin-top: 10px;
            text-decoration: none;
            color: #2563eb;
            font-weight: 600;
        }
    </style>
</head>

<body>

<!-- HEADER -->
<jsp:include page="../common/header.jsp"/>

<div class="container">

    <div class="welcome">
        <h2>Welcome, Job Seeker 👋</h2>
        <p>Manage your profile, explore jobs, and track applications from here.</p>
    </div>

    <div class="cards">

        <div class="card">
            <h3>My Profile</h3>
            <p>View and manage your personal and professional details.</p>
            <a href="<%=request.getContextPath()%>/jsk?action=profile">Go to Profile →</a>
        </div>

        <div class="card">
            <h3>Find Jobs</h3>
            <p>Browse latest job openings posted by companies.</p>
            <a href="<%=request.getContextPath()%>/jsk?action=find-jobs">View Jobs →</a>
        </div>

        <div class="card">
            <h3>My Applications</h3>
            <p>Track jobs you have applied for and their status.</p>
            <a href="<%=request.getContextPath()%>/jsk?action=my-applications">View Applications →</a>
        </div>

    </div>

</div>
<br><br><br>
<jsp:include page="../common/footer.jsp"/>

</body>
</html>
