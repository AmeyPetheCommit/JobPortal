package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.JInfo;
import com.model.Job;

public class ApplicationDaoImpl implements ApplicationDao {

    @Override
    public boolean hasApplied(int jobId, int jskId) {
        String sql = "SELECT 1 FROM applications WHERE job_id=? AND jsk_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, jobId);
            ps.setInt(2, jskId);
            return ps.executeQuery().next();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean applyJob(int jobId, int jskId) {
        String sql = "INSERT INTO applications (job_id, jsk_id) VALUES (?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, jobId);
            ps.setInt(2, jskId);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // 🔹 MY APPLICATIONS
    @Override
    public List<Job> getApplicationsByJobSeeker(int jskId) {

        List<Job> list = new ArrayList<>();

        String sql = """
            SELECT j.job_id, j.title, j.location, j.category,
                   a.status, cinfo.company_name
            FROM applications a
            JOIN jobs j ON a.job_id = j.job_id
            JOIN cinfo ON j.company_id = cinfo.company_id
            WHERE a.jsk_id = ?
            ORDER BY a.applied_date DESC
        """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, jskId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Job j = new Job();
                j.setJobId(rs.getInt("job_id"));
                j.setTitle(rs.getString("title"));
                j.setLocation(rs.getString("location"));
                j.setCategory(rs.getString("category"));
                j.setCompanyName(rs.getString("company_name"));
                j.setStatus(rs.getString("status"));
                list.add(j);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    @Override
    public List<JInfo> getApplicantsByCompany(int companyId) {

        List<JInfo> list = new ArrayList<>();

        String sql = """
            SELECT a.jsk_id,a.job_id,ji.name,ji.phone,ji.skills,ji.experience,ji.qualification,j.title
            FROM applications a JOIN jobs j ON a.job_id = j.job_id JOIN jinfo ji ON a.jsk_id = ji.jsk_id
            WHERE j.company_id = ? ORDER BY a.applied_date DESC
        """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, companyId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                JInfo ji = new JInfo();

                ji.setJskId(rs.getInt("jsk_id"));
                ji.setJobId(rs.getInt("job_id"));

                
                ji.setName(rs.getString("name"));
                ji.setPhone(rs.getString("phone"));
                ji.setSkills(rs.getString("skills"));
                ji.setExperience(rs.getString("experience"));
                ji.setQualification(rs.getString("qualification"));

                
                ji.setAppliedJobTitle(rs.getString("title"));

                list.add(ji);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    
    @Override
    public boolean updateApplicationStatus(int jskId, int jobId, String status) {

        String sql = """
            UPDATE applications
            SET status = ?
            WHERE jsk_id = ? AND job_id = ?
        """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2, jskId);
            ps.setInt(3, jobId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
