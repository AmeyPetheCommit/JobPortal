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
    <title>Edit Company Profile</title>

    <style>
        body { background:#f3f4f6; }

        .edit-container {
            max-width: 750px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        h2 { margin-bottom: 20px; }

        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 8px;
            border: 1px solid #d1d5db;
        }

        textarea { min-height: 90px; }

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
</head>

<body>

<jsp:include page="../common/header.jsp"/>

<div class="edit-container">

    <h2>Edit Company Profile</h2>

    <form method="post" action="<%=request.getContextPath()%>/company?action=update">

        <!-- COMPANY TABLE -->
        <label>Email</label>
        <input type="email" name="email" value="<%= company.getEmail() %>" required>

        <!-- CINFO TABLE -->
        <label>Company Name</label>
        <input type="text" name="companyName"
               value="<%= company.getCinfo().getCompanyName() %>" required>

        <label>Location</label>
        <input type="text" name="location"
               value="<%= company.getCinfo().getLocation() %>">

        <label>Website</label>
        <input type="text" name="website"
               value="<%= company.getCinfo().getWebsite() %>">

        <label>Description</label>
        <textarea name="description"><%= company.getCinfo().getDescription() %></textarea>

        <button type="submit">Update Company Profile</button>
    </form>

</div>

<jsp:include page="../common/footer.jsp"/>

</body>
</html>
