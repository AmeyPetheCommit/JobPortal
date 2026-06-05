<%@ page import="java.util.List" %>
<%@ page import="com.model.Job" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    if (session == null || !"COMPANY".equals(session.getAttribute("role"))) {
        response.sendRedirect("../auth/login.jsp");
        return;
    }

    List<Job> jobs = (List<Job>) request.getAttribute("jobs");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Jobs</title>

    <style>
        body { background:#f3f4f6; }

        .container {
            max-width: 1000px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #e5e7eb;
            text-align: left;
        }

        th { background:#f9fafb; }

        .open { color: green; font-weight: 600; }
        .closed { color: red; font-weight: 600; }

        .btn {
            padding: 6px 12px;
            border-radius: 6px;
            text-decoration: none;
            color: white;
            font-size: 14px;
        }

        .close-btn { background:#dc2626; }
        .close-btn:hover { background:#b91c1c; }
        .action-btn {
		    padding: 6px 12px;
		    border-radius: 6px;
		    text-decoration: none;
		    font-size: 13px;
		    font-weight: 600;
		    margin-right: 6px;
		    display: inline-block;
		}
		
		.edit-btn {
		    background: #2563eb;
		    color: white;
		}
		
		.edit-btn:hover {
		    background: #1e40af;
		}
		
		.delete-btn {
		    background: #dc2626;
		    color: white;
		}
		
		.delete-btn:hover {
		    background: #b91c1c;
		}
		
		.close-btn {
		    background: #f97316;
		    color: white;
		}
		
		.close-btn:hover {
		    background: #ea580c;
		}
		
		.disabled-btn {
		    background: #9ca3af;
		    color: white;
		    cursor: not-allowed;
		}
        
    </style>
</head>

<body>

<jsp:include page="../common/header.jsp"/>

<div class="container">

    <h2>Manage Jobs</h2>

    <% if ("true".equals(request.getParameter("closed"))) { %>
        <div style="background:#dcfce7;color:#166534;padding:10px;border-radius:6px;">
            ✅ Job closed successfully
        </div>
    <% } %>

    <table>
        <tr>
            <th>Title</th>
            <th>Category</th>
            <th>Candidate</th>
            <th>Experience(years)</th>
            <th>Location</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <% if (jobs != null && !jobs.isEmpty()) {
            for (Job j : jobs) { %>
            <tr>
                <td><%= j.getTitle() %></td>
                <td><%= j.getCategory() %></td>
                <td><%= j.getCandidateType() %></td>
                <td><%= j.getExperienceYears() %></td>
                <td><%= j.getLocation() %></td>
                <td class="<%= j.getStatus().equals("OPEN") ? "open" : "closed" %>">
                    <%= j.getStatus() %>
                </td>
                <td>
				    <a class="action-btn edit-btn"
				       href="<%=request.getContextPath()%>/company?action=edit-job&jobId=<%=j.getJobId()%>">
				        Edit
				    </a>
				
				    <a class="action-btn delete-btn"
				       href="<%=request.getContextPath()%>/company?action=delete-job&jobId=<%=j.getJobId()%>"
				       onclick="return confirm('Delete this job?')">
				        Delete
				    </a>
				
				    <% if ("OPEN".equals(j.getStatus())) { %>
				        <a class="action-btn close-btn"
				           href="<%=request.getContextPath()%>/company?action=close-job&jobId=<%=j.getJobId()%>">
				            Close
				        </a>
				    <% } else { %>
				        <span class="action-btn disabled-btn">Closed</span>
				    <% } %>
				</td>


            </tr>
        <% }} else { %>
            <tr><td colspan="7">No jobs posted</td></tr>
        <% } %>
    </table>

</div>

<jsp:include page="../common/footer.jsp"/>

</body>
</html>
