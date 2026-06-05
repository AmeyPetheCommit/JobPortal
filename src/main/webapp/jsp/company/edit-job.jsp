<%@ page import="com.model.Job" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    if (session == null || !"COMPANY".equals(session.getAttribute("role"))) {
        response.sendRedirect("../auth/login.jsp");
        return;
    }

    Job job = (Job) request.getAttribute("job");
    if (job == null) {
        response.sendRedirect(request.getContextPath() + "/company?action=manage-jobs");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Job | Company</title>

    <style>
        body {
            background: #f3f4f6;
            font-family: "Segoe UI", Arial, sans-serif;
        }

        .job-container {
            max-width: 800px;
            margin: 40px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        h2 {
            margin-bottom: 20px;
            color: #1f2937;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            color: #374151;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 8px;
            border: 1px solid #d1d5db;
            font-size: 14px;
        }

        textarea {
            min-height: 90px;
            resize: vertical;
        }

        .actions {
            margin-top: 25px;
            display: flex;
            gap: 15px;
        }

        .btn {
            padding: 12px 22px;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
            border: none;
            cursor: pointer;
        }

        .btn-primary {
            background: #2563eb;
            color: white;
        }

        .btn-primary:hover {
            background: #1e40af;
        }

        .btn-secondary {
            background: #9ca3af;
            color: white;
        }

        .btn-secondary:hover {
            background: #6b7280;
        }
    </style>

    <script>
        function toggleExperience() {
            const type = document.getElementById("candidateType").value;
            document.getElementById("expBox").style.display =
                (type === "Experienced") ? "block" : "none";
        }

        window.onload = toggleExperience;
    </script>
</head>

<body>

<jsp:include page="../common/header.jsp"/>

<div class="job-container">

    <h2>Edit Job</h2>

    <form method="post" action="<%=request.getContextPath()%>/company?action=update-job">

        <input type="hidden" name="jobId" value="<%=job.getJobId()%>">

        <label>Job Title</label>
        <input type="text" name="title" value="<%=job.getTitle()%>" required>

        <label>Description</label>
        <textarea name="description" required><%=job.getDescription()%></textarea>

        <label>Category</label>
        <input type="text" name="category" value="<%=job.getCategory()%>" required>

        <label>Candidate Type</label>
        <select name="candidateType" id="candidateType"
                onchange="toggleExperience()" required>
            <option value="Fresher" <%= "Fresher".equals(job.getCandidateType()) ? "selected" : "" %>>
                Fresher
            </option>
            <option value="Experienced" <%= "Experienced".equals(job.getCandidateType()) ? "selected" : "" %>>
                Experienced
            </option>
        </select>

        <div id="expBox">
            <label>Experience (Years)</label>
            <input type="number" name="experienceYears" min="0"
                   value="<%=job.getExperienceYears()%>">
        </div>

        <label>Location</label>
        <input type="text" name="location" value="<%=job.getLocation()%>">

        <label>Salary</label>
        <input type="text" name="salary" value="<%=job.getSalary()%>">

        <div class="actions">
            <button type="submit" class="btn btn-primary">Update Job</button>
            <a href="<%=request.getContextPath()%>/company?action=manage-jobs"
               class="btn btn-secondary">Cancel</a>
        </div>

    </form>

</div>

<jsp:include page="../common/footer.jsp"/>

</body>
</html>
