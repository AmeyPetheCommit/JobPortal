<%@ page contentType="text/html;charset=UTF-8" %>

<%
    if (session == null || !"COMPANY".equals(session.getAttribute("role"))) {
        response.sendRedirect("../auth/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Company Dashboard | Job Portal</title>

    <style>
        body {
            background: #f4f6f9;
            font-family: "Segoe UI", Arial, sans-serif;
            overflow: hidden;
        }

        .container {
            padding: 30px;
            max-width: 1100px;
            margin: auto;
        }

        h2 {
            margin-bottom: 10px;
        }

        .subtitle {
            color: #6b7280;
            margin-bottom: 30px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 25px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.08);
            transition: transform 0.2s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            margin-top: 0;
            color: #2563eb;
        }

        .card p {
            color: #4b5563;
            margin-bottom: 15px;
        }

        .card a {
            text-decoration: none;
            font-weight: 600;
            color: #2563eb;
        }
    </style>
</head>

<body>

<jsp:include page="../common/header.jsp"/>

<div class="container">

    <h2>Welcome, Company </h2>
    <p class="subtitle">Manage jobs, applications and your company profile</p>

    <div class="cards">

        
        <div class="card">
            <h3>Post New Job</h3>
            <p>Create and publish job openings</p>
            <a href="<%=request.getContextPath()%>/jsp/company/post-job.jsp">Post Job →</a>
        </div>

        
        <div class="card">
            <h3>Manage Jobs</h3>
            <p>Edit or close posted jobs</p>
            <a href="<%=request.getContextPath()%>/company?action=manage-jobs">
                View Jobs →
            </a>
        </div>

        
        <div class="card">
            <h3>View Applications</h3>
            <p>See applicants for your jobs</p>
            <a href="<%=request.getContextPath()%>/company?action=view-applicants">Applications →</a>
        </div>

        
        

    </div>

</div>
<br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="../common/footer.jsp"/>

</body>
</html>
