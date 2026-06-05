<%@ page contentType="text/html;charset=UTF-8" %>

<style>
    body {
        margin: 0;
        font-family: "Segoe UI", Arial, sans-serif;
        background-color: #f4f6f9;
    }

    .topbar {
        background: #2563eb;
        color: white;
        padding: 15px 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .topbar h2 {
        margin: 0;
        font-size: 22px;
    }

    .nav-links a {
        color: white;
        margin-left: 20px;
        text-decoration: none;
        font-weight: 500;
    }

    .nav-links a:hover {
        text-decoration: underline;
    }
</style>

<%
    String role = (session != null) ? (String) session.getAttribute("role") : null;
%>

<div class="topbar">
    <h2>Job Portal</h2>

    <div class="nav-links">

        <%-- ✅ HOME LINK BASED ON ROLE --%>
        <% if ("COMPANY".equals(role)) { %>
            <a href="<%=request.getContextPath()%>/jsp/company/dashboard.jsp">Home</a>
            <a href="<%=request.getContextPath()%>/company?action=profile">Profile</a>
        <% } else if ("JSK".equals(role)) { %>
            <a href="<%=request.getContextPath()%>/jsp/jobseeker/dashboard.jsp">Home</a>
            <a href="<%=request.getContextPath()%>/jsk?action=profile">Profile</a>
        <% } %>

        <% if (role != null) { %>
            <a href="<%=request.getContextPath()%>/logout">Logout</a>
        <% } %>

    </div>
</div>
