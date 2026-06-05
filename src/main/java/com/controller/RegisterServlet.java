package com.controller;

import com.db.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String role = req.getParameter("role");

        try (Connection con = DBConnection.getConnection()) {

            if ("JSK".equals(role)) {

                String email = req.getParameter("email");
                String password = req.getParameter("password");
                String name = req.getParameter("name");
                String phone = req.getParameter("phone");
                String skills = req.getParameter("skills");
                String experience = req.getParameter("experience");
                String qualification = req.getParameter("qualification");

                
                String sql1 = "INSERT INTO job_seeker(email, password) VALUES (?, ?)";
                PreparedStatement ps1 =
                        con.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
                ps1.setString(1, email);
                ps1.setString(2, password);
                ps1.executeUpdate();

                ResultSet rs = ps1.getGeneratedKeys();
                int jskId = 0;
                if (rs.next()) {
                    jskId = rs.getInt(1);
                }

                
                String sql2 =
                        "INSERT INTO jinfo(jsk_id, name, phone, skills, experience, qualification) " +
                        "VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement ps2 = con.prepareStatement(sql2);
                ps2.setInt(1, jskId);
                ps2.setString(2, name);
                ps2.setString(3, phone);
                ps2.setString(4, skills);
                ps2.setString(5, experience);
                ps2.setString(6, qualification);
                ps2.executeUpdate();

                res.sendRedirect("jsp/auth/login.jsp");
            }

            
            else if ("COMPANY".equals(role)) {

                String email = req.getParameter("email");
                String password = req.getParameter("password");
                String companyName = req.getParameter("companyName");
                String location = req.getParameter("location");
                String website = req.getParameter("website");
                String description = req.getParameter("description");

                
                String sql1 =
                        "INSERT INTO company(company_email, password) VALUES (?, ?)";
                PreparedStatement ps1 =
                        con.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
                ps1.setString(1, email);
                ps1.setString(2, password);
                ps1.executeUpdate();

                ResultSet rs = ps1.getGeneratedKeys();
                int companyId = 0;
                if (rs.next()) {
                    companyId = rs.getInt(1);
                }

                
                String sql2 =
                        "INSERT INTO cinfo(company_id, company_name, location, website, description) " +
                        "VALUES (?, ?, ?, ?, ?)";
                PreparedStatement ps2 = con.prepareStatement(sql2);
                ps2.setInt(1, companyId);
                ps2.setString(2, companyName);
                ps2.setString(3, location);
                ps2.setString(4, website);
                ps2.setString(5, description);
                ps2.executeUpdate();

                res.sendRedirect("jsp/auth/login.jsp");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            res.sendRedirect("jsp/auth/register.jsp?error=db");
        }
    }
}
