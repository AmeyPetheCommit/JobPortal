<%@ page import="com.model.Company" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    if (session == null || !"COMPANY".equals(session.getAttribute("role"))) {
        response.sendRedirect("../auth/login.jsp");
        return;
    }

    if (request.getAttribute("company") == null) {
        response.sendRedirect(request.getContextPath() + "/company?action=profile");
        return;
    }

    Company company = (Company) request.getAttribute("company");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Company Profile | Job Portal</title>

    <style>
    
    	a{
    		text-decoration: none;
    		color: #374151;
    		
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
            background: linear-gradient(135deg, #16a34a, #22c55e);
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
            border-left: 5px solid #16a34a;
        }
        .info-card2 {
            background: #f9fafb;
            padding: 20px;
            border-radius: 12px;
            border-left: 5px solid #16a34a;
            height: 200px
        }

        .info-card h4 {
            margin: 0 0 5px;
            color: #16a34a;
        }

        .info-card p {
            margin: 0;
            color: #374151;
            font-weight: 500;
        }

        .actions a {
            background: #16a34a;
            color: white;
            padding: 10px 18px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
        }

        .actions a:hover {
            background: #15803d;
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
                <%= (company != null && company.getCinfo() != null &&
                     company.getCinfo().getCompanyName() != null)
                        ? company.getCinfo().getCompanyName().substring(0,1).toUpperCase()
                        : "C" %>
            </div>
            <div>
                <h2>
                    <%= (company != null && company.getCinfo() != null &&
                         company.getCinfo().getCompanyName() != null)
                            ? company.getCinfo().getCompanyName()
                            : "Company" %>
                </h2>
                <p>Company Profile</p>
            </div>
        </div>

        <div class="actions">
            <a href="<%=request.getContextPath()%>/company?action=edit">
                Edit Profile
            </a>
        </div>
    </div>

    <!-- 🔹 PROFILE DETAILS -->
    <div class="profile-body">

        <div class="info-card">
            <h4>Email</h4>
            <p><%= company != null ? company.getEmail() : "Not Provided" %></p>
        </div>

        <div class="info-card">
            <h4>Location</h4>
            <p><%= (company != null && company.getCinfo() != null)
                    ? company.getCinfo().getLocation()
                    : "Not Provided" %></p>
        </div>

        <div class="info-card">
            <h4>Website</h4>
            <a href="<%=company.getCinfo().getWebsite()%>" target="_blank"><%= (company != null && company.getCinfo() != null)
                    ? company.getCinfo().getWebsite()
                    : "Not Provided" %></a>
        </div>

        

    </div>
    <br>
    <div class="info-card2">
            <h4>Description</h4>
            <p><%= (company != null && company.getCinfo() != null)
                    ? company.getCinfo().getDescription()
                    : "Not Provided" %></p>
        </div>

</div>

<jsp:include page="../common/footer.jsp"/>


</body>
</html>
