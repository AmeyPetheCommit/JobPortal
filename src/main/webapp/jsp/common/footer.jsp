<%@ page contentType="text/html;charset=UTF-8" %>

<style>
    .footer {
        margin-top: 60px;
        background: #d7dce0;
        border-top: 1px solid #e5e7eb;
        padding: 20px 30px;
        text-align: center;
        color: #374151;
        font-size: 14px;
        height: 100px;
    }

    .footer span {
        color: #2563eb;
        font-weight: 600;
    }

    .footer-links {
        margin-top: 8px;
    }

    .footer-links a {
        margin: 0 10px;
        color: #2563eb;
        text-decoration: none;
        font-weight: 500;
    }

    .footer-links a:hover {
        text-decoration: underline;
    }
</style>

<div class="footer">
    <div>
        © <%= java.time.Year.now() %> <span>Job Portal</span>. All rights reserved.
    </div>

    <div class="footer-links">
        <a href="#">About</a>
        <a href="#">Contact</a>
        <a href="#">Privacy Policy</a>
    </div>
</div>
