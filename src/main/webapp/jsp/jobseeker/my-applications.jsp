<%@ page import="java.util.List" %>
<%@ page import="com.model.Job" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    if (session == null || !"JSK".equals(session.getAttribute("role"))) {
        response.sendRedirect("../auth/login.jsp");
        return;
    }

    List<Job> applications = (List<Job>) request.getAttribute("applications");
%>

<!DOCTYPE html>
<html>
<head>
<title>My Applications</title>

<style>
	body { background:#f3f4f6; font-family:Segoe UI; }
	
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
	
	th { background:#f9fafb; }
	
	.status {
	    font-weight:700;
	}
	
	.APPLIED { color:#2563eb; }
	.ACCEPTED { color:#0ba300; }
	.REJECTED { color:#dc2626; }
	
	.view-btn {
	    background:#2563eb;
	    color:white;
	    padding:6px 12px;
	    border-radius:6px;
	    text-decoration:none;
	    font-weight:600;
	}
</style>
</head>

<body>

<jsp:include page="../common/header.jsp"/>

	<div class="container">
	
	<h2>My Applications</h2>
	
	<table>
	<tr>
	    <th>Job Title</th>
	    <th>Company</th>
	    <th>Category</th>
	    <th>Location</th>
	    <th>Status</th>
	    <th>Action</th>
	</tr>
	
	<% if (applications != null && !applications.isEmpty()) {
	   for (Job j : applications) { %>
	
	<tr>
	    <td><%= j.getTitle() %></td>
	    <td><%= j.getCompanyName() %></td>
	    <td><%= j.getCategory() %></td>
	    <td><%= j.getLocation() %></td>
	    <td class="status <%=j.getStatus()%>">
	        <%= j.getStatus() %>
	    </td>
	    <td>
	        <a class="view-btn"
	           href="<%=request.getContextPath()%>/jsk?action=view-job&jobId=<%=j.getJobId()%>">
	           View
	        </a>
	    </td>
	</tr>
	
	<% }} else { %>
	<tr>
	    <td colspan="6">You haven’t applied to any jobs yet</td>
	</tr>
	<% } %>
	
	</table>
	
	</div>

<jsp:include page="../common/footer.jsp"/>

</body>
</html>
