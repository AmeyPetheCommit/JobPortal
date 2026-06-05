<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Post Job</title>

    <style>
        body { background:#f3f4f6; }

        .job-container {
            max-width: 800px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        .alert-success {
            background: #dcfce7;
            color: #166534;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .alert-error {
            background: #fee2e2;
            color: #991b1b;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-weight: 600;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 8px;
            border: 1px solid #d1d5db;
        }

        button {
            margin-top: 25px;
            padding: 12px 20px;
            background: #16a34a;
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
        }

        button:hover { background:#15803d; }
    </style>

    <script>
        function toggleExperience() {
            const type = document.getElementById("candidateType").value;
            document.getElementById("expBox").style.display =
                (type === "Experienced") ? "block" : "none";
        }
    </script>
</head>

<body>

<jsp:include page="../common/header.jsp"/>

<div class="job-container">

    <% if ("true".equals(request.getParameter("success"))) { %>
        <div class="alert-success">✅ Job posted successfully!</div>
    <% } %>

    <% if ("true".equals(request.getParameter("error"))) { %>
        <div class="alert-error">❌ Failed to post job. Try again.</div>
    <% } %>

    <h2>Post New Job</h2>

    <form method="post" action="<%=request.getContextPath()%>/company?action=save-job">

        <label>Job Title</label>
        <input type="text" name="title" required>

        <label>Description</label>
        <textarea name="description" required></textarea>

        <label>Category</label>
        <select name="category" required>
            <option value="">Select</option>
            <option>IT</option>
            <option>Finance</option>
            <option>Marketing</option>
            <option>HR</option>
            <option>Sales</option>
        </select>

        <label>Candidate Type</label>
        <select name="candidateType" id="candidateType" onchange="toggleExperience()" required>
            <option value="">Select</option>
            <option>Fresher</option>
            <option>Experienced</option>
        </select>

        <div id="expBox" style="display:none;">
            <label>Experience (Years)</label>
            <input type="number" name="experienceYears" min="1">
        </div>

        <label>Location</label>
        <input type="text" name="location">

        <label>Salary</label>
        <input type="text" name="salary">

        <button type="submit">Post Job</button>
    </form>

</div>

<jsp:include page="../common/footer.jsp"/>

</body>
</html>
