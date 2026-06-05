<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="com.model.Job" %>

<%
    List<Job> jobs = (List<Job>) request.getAttribute("jobs");
%>

<!DOCTYPE html>
<html>
<head>
<title>Find Jobs</title>

<style>
body { background:#f3f4f6; font-family:Segoe UI; }

.container {
    max-width:1100px;
    margin:30px auto;
    background:#fff;
    padding:25px;
    border-radius:14px;
    box-shadow:0 10px 25px rgba(0,0,0,0.08);
}

.filters {
    display:grid;
    grid-template-columns: repeat(auto-fit,minmax(180px,1fr));
    gap:15px;
}

input, select {
    padding:10px;
    border-radius:8px;
    border:1px solid #d1d5db;
}

button {
    background:#2563eb;
    color:white;
    border:none;
    border-radius:8px;
    font-weight:600;
    cursor:pointer;
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

<h2>Find Jobs</h2>

<form method="get" action="<%=request.getContextPath()%>/jsk">
<input type="hidden" name="action" value="find-jobs">

<div class="filters">
    <input type="text" name="keyword" placeholder="Job or Company">

    <select name="category">
        <option value="">Category</option>
        <option>IT</option>
        <option>Finance</option>
        <option>HR</option>
        <option>Marketing</option>
    </select>

    <select name="candidateType">
        <option value="">Candidate Type</option>
        <option>Fresher</option>
        <option>Experienced</option>
    </select>

    <input type="number" name="experienceYears" placeholder="Max Experience">

    <button type="submit">Search</button>
</div>
</form>

	<div class="job-grid">
	<% if (jobs != null && !jobs.isEmpty()) {
	    for (Job j : jobs) { %>
	
	    <div class="job-card">
	
	        
	        <div class="logo">
	            J
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
	
	<% } } %>
	</div>

</div>

<br><br><br><br><br><br><br><br>


<jsp:include page="../common/footer.jsp"/>

</body>
</html>
