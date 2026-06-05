<%@ page import="com.model.Job, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Job job = (Job) request.getAttribute("job");
    List<Job> moreJobs = (List<Job>) request.getAttribute("moreJobs");

    if (job == null) {
        response.sendRedirect(request.getContextPath() + "/jsk?action=find-jobs");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Job Details</title>

<style>
	body { 
	background:#f3f4f6; 
	font-family:Segoe UI;
	}
	
	.container {
	    max-width:900px;
	    margin:30px auto;
	    background:#fff;
	    padding:30px;
	    border-radius:16px;
	    box-shadow:0 10px 25px rgba(0,0,0,0.08);
	}
	
	.job-details {
	    background: #ffffff;
	    padding: 30px;
	    border-radius: 18px;
	    box-shadow: 0 12px 30px rgba(0,0,0,0.08);
	}
	
	
	.job-header {
	    display: flex;
	    align-items: center;
	    gap: 20px;
	    border-bottom: 1px solid #e5e7eb;
	    padding-bottom: 20px;
	}
	
	.job-logo {
	    width: 80px;
	    height: 80px;
	    border-radius: 50%;
	    background: linear-gradient(135deg, #2563eb, #3b82f6);
	    color: white;
	    font-size: 32px;
	    font-weight: 700;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	}
	
	.job-title-section h2 {
	    margin: 0;
	    font-size: 24px;
	    color: #111827;
	}
	
	.company-name {
	    margin-top: 4px;
	    color: #6b7280;
	    font-weight: 600;
	}
	
	
	.job-meta {
	    margin-top: 25px;
	    display: grid;
	    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	    gap: 20px;
	}
	
	.meta-item {
	    background: #f9fafb;
	    padding: 15px;
	    border-radius: 12px;
	}
	
	.meta-item span {
	    font-size: 13px;
	    color: #6b7280;
	}
	
	.meta-item p {
	    margin: 4px 0 0;
	    font-weight: 600;
	    color: #111827;
	}
	
	.open {
	    color: #16a34a;
	}
	
	.closed {
	    color: #dc2626;
	}
	
	
	.job-description {
	    margin-top: 30px;
	}
	
	.job-description h3 {
	    margin-bottom: 10px;
	    color: #111827;
	}
	
	
	.job-action {
	    margin-top: 30px;
	    text-align: center;
	}
	
	.apply-btn {
	    background: #16a34a;
	    color: white;
	    padding: 14px 30px;
	    border-radius: 12px;
	    text-decoration: none;
	    font-weight: 700;
	    font-size: 16px;
	    transition: background 0.2s ease;
	}
	
	.apply-btn:hover {
	    background: #15803d;
	}
	
	.closed-text {
	    color: #dc2626;
	    font-weight: 700;
	}

	.job-grid {
	    display: grid;
	    grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
	    gap: 25px;
	    margin-top: 30px;
	}
	
	.job-card {
	    background: #ffffff;
	    border-radius: 16px;
	    padding: 25px 20px;
	    box-shadow: 0 8px 22px rgba(0,0,0,0.08);
	    text-align: center;
	    transition: transform 0.25s ease, box-shadow 0.25s ease;
	}
	
	.job-card:hover {
	    transform: translateY(-6px);
	    box-shadow: 0 14px 32px rgba(0,0,0,0.12);
	}
	
	
	.logo {
	    width: 70px;
	    height: 70px;
	    margin: 0 auto 15px;
	    border-radius: 50%;
	    background: linear-gradient(135deg, #2563eb, #3b82f6);
	    color: white;
	    font-size: 28px;
	    font-weight: 700;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	}
	
	
	.job-title {
	    margin: 10px 0 4px;
	    font-size: 18px;
	    font-weight: 700;
	    color: #111827;
	}
	
	
	.company-name {
	    margin: 0;
	    font-size: 14px;
	    font-weight: 600;
	    color: #6b7280;
	}
	

	.meta {
	    margin: 8px 0 18px;
	    font-size: 13px;
	    color: #4b5563;
	}
	
	
	.view-btn {
	    display: inline-block;
	    background: #2563eb;
	    color: white;
	    padding: 10px 22px;
	    border-radius: 10px;
	    font-size: 14px;
	    font-weight: 600;
	    text-decoration: none;
	    transition: background 0.2s ease;
	}
	
	.view-btn:hover {
	    background: #1e40af;
	}
</style>
</head>

<body>

<jsp:include page="../common/header.jsp"/>

<div class="container">

    <div class="job-details">

    <div class="job-header">
        <div class="job-logo">
            <%= job.getCompanyName().substring(0,1).toUpperCase() %>
        </div>

        <div class="job-title-section">
            <h2><%=job.getTitle()%></h2>
            <p class="company-name"><%=job.getCompanyName()%></p>
        </div>
    </div>

    <div class="job-meta">

        <div class="meta-item">
            <span>📍 Location</span>
            <p><%=job.getLocation()%></p>
        </div>

        <div class="meta-item">
            <span>📂 Category</span>
            <p><%=job.getCategory()%></p>
        </div>

        <div class="meta-item">
            <span>👤 Type</span>
            <p><%=job.getCandidateType()%></p>
        </div>

        <div class="meta-item">
            <span>⏳ Experience</span>
            <p><%=job.getExperienceYears()%> Years</p>
        </div>

        <div class="meta-item">
            <span>💰 Salary</span>
            <p><%=job.getSalary()%></p>
        </div>

        <div class="meta-item">
            <span>📌 Status</span>
            <p class="<%= "OPEN".equals(job.getStatus()) ? "open" : "closed" %>">
                <%=job.getStatus()%>
            </p>
        </div>

    </div>

    <div class="job-description">
        <h3>Job Description</h3>
        <p><%=job.getDescription()%></p>
    </div>

    <div class="job-action">

    <% if ("OPEN".equals(job.getStatus())) { %>

        <% if ("success".equals(request.getParameter("applied"))) { %>
            <span style="color:#16a34a;font-weight:700;">
                ✅ Application submitted successfully
            </span>

        <% } else if ("already".equals(request.getParameter("applied"))) { %>
            <span style="color:#2563eb;font-weight:700;">
                ✔ You have already applied for this job
            </span>

        <% } else { %>
            <a class="apply-btn"
               href="<%=request.getContextPath()%>/jsk?action=apply-job&jobId=<%=job.getJobId()%>">
               Apply Now
            </a>
        <% } %>

    <% } else { %>
        <span class="closed-text">This job is closed</span>
    <% } %>

</div>

</div>


	<div class="job-grid">
	<% for (Job j : moreJobs) { %>
	<div class="job-card">
	
	        
	        <div class="logo">
	            <%= j.getCompanyName().substring(0,1).toUpperCase() %>
	        </div>
	
	        
	        <h3 class="job-title"><%= j.getTitle() %></h3>
	
	        <p class="company-name"><%= j.getCompanyName() %></p>
	
	        <p class="meta">
	            <%= j.getLocation() %> • <%= j.getCategory() %>
	        </p>
	
	        <a class="view-btn"
	           href="<%=request.getContextPath()%>/jsk?action=view-job&jobId=<%=j.getJobId()%>">
	           View Job
	        </a>
	
	    </div>
	<% } %>
	</div>

</div>

<jsp:include page="../common/footer.jsp"/>

</body>
</html>

</div>

<jsp:include page="../common/footer.jsp"/>

</body>
</html>
