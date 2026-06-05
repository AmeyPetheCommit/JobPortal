<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.JInfo" %>

<%
    if (session == null || !"COMPANY".equals(session.getAttribute("role"))) {
        response.sendRedirect("../auth/login.jsp");
        return;
    }

    List<JInfo> applicants = (List<JInfo>) request.getAttribute("applicants");
%>

<!DOCTYPE html>
<html>
<head>
<title>Applicants</title>

<style>
    body { 
        background:#f3f4f6; 
        font-family: "Segoe UI", Arial, sans-serif; 
    }

    .container {
        max-width:1100px;
        margin:40px auto;
        background:#fff;
        padding:30px;
        border-radius:16px;
        box-shadow:0 10px 25px rgba(0,0,0,0.08);
    }

    table {
        width:100%;
        border-collapse:collapse;
        margin-top:20px;
    }

    th, td {
        padding:14px;
        border-bottom:1px solid #e5e7eb;
        text-align:left;
    }

    th { 
        background:#f9fafb; 
        font-weight:600;
    }

    .btn {
        padding:6px 14px;
        border-radius:6px;
        text-decoration:none;
        font-weight:600;
        font-size:14px;
        color:white;
        display:inline-block;
    }

    .accept {
        background:#16a34a;
    }

    .accept:hover {
        background:#15803d;
    }

    .reject {
        background:#dc2626;
    }

    .reject:hover {
        background:#b91c1c;
    }
    .act-btn{
    	display: flex;
    	gap: 10px
    }
</style>
</head>

<body>

<jsp:include page="../common/header.jsp"/>

<div class="container">

<h2>Job Applicants</h2>

<table>
<tr>
    <th>Name</th>
    <th>Applied For</th>
    <th>Phone</th>
    <th>Skills</th>
    <th>Experience</th>
    <th>Qualification</th>
    <th>Action</th>
</tr>

<% if (applicants != null && !applicants.isEmpty()) {
   for (JInfo j : applicants) { %>

<tr>
    <td><%= j.getName() %></td>
    <td><%= j.getAppliedJobTitle() %></td>
    <td><%= j.getPhone() %></td>
    <td><%= j.getSkills() %></td>
    <td><%= j.getExperience() %></td>
    <td><%= j.getQualification() %></td>
    <td>
    <div class="act-btn">
        <a class="btn accept"
       href="<%=request.getContextPath()%>/company?action=update-application&status=ACCEPTED&jskId=<%=j.getJskId()%>&jobId=<%=j.getJobId()%>">
       Accept
    </a>

    <a class="btn reject"
       href="<%=request.getContextPath()%>/company?action=update-application&status=REJECTED&jskId=<%=j.getJskId()%>&jobId=<%=j.getJobId()%>"
       onclick="return confirm('Reject this application?')">
       Reject
    </a>
        </div>
    </td>
</tr>

<% }} else { %>
<tr>
    <td colspan="7">No applicants yet</td>
</tr>
<% } %>

</table>

</div>

<jsp:include page="../common/footer.jsp"/>

</body>
</html>
