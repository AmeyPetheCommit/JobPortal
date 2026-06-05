package com.controller;

import com.db.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String role = req.getParameter("role");

        try (Connection con = DBConnection.getConnection()) {

        	
            if ("JSK".equals(role)) {

                String email = req.getParameter("email");
                String password = req.getParameter("password");

                String sql =
                        "SELECT jskId FROM job_seeker WHERE email=? AND password=?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, email);
                ps.setString(2, password);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    HttpSession session = req.getSession();
                    session.setAttribute("role", "JSK");
                    session.setAttribute("jskId", rs.getInt("jskId"));

                    res.sendRedirect("jsp/jobseeker/dashboard.jsp");
                } else {
                    res.sendRedirect("jsp/auth/login.jsp?error=invalid");
                }
            }

            
            else if ("COMPANY".equals(role)) {

                int companyId = Integer.parseInt(req.getParameter("companyId"));
                String password = req.getParameter("password");

                String sql =
                        "SELECT company_id FROM company WHERE company_id=? AND password=?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, companyId);
                ps.setString(2, password);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    HttpSession session = req.getSession();
                    session.setAttribute("role", "COMPANY");
                    session.setAttribute("companyId", companyId);

                    res.sendRedirect(req.getContextPath() + "/jsp/company/dashboard.jsp");

                } else {
                    res.sendRedirect("jsp/auth/login.jsp?error=invalid");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("jsp/auth/login.jsp?error=server");
        }
    }
}
