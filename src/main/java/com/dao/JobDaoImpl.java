package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.Job;

public class JobDaoImpl implements JobDao {

    @Override
    public boolean addJobs(Job job) {
        String sql = """
            INSERT INTO jobs
            (company_id, title, description, category, candidate_type,
             experience_years, location, salary)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, job.getCompanyId());
            ps.setString(2, job.getTitle());
            ps.setString(3, job.getDescription());
            ps.setString(4, job.getCategory());
            ps.setString(5, job.getCandidateType());
            ps.setInt(6, job.getExperienceYears());
            ps.setString(7, job.getLocation());
            ps.setString(8, job.getSalary());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Job> getJobsByCompanyId(int companyId) {
        List<Job> list = new ArrayList<>();

        String sql = "SELECT * FROM jobs WHERE company_id=? ORDER BY posted_date DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, companyId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Job j = new Job();
                j.setJobId(rs.getInt("job_id"));
                j.setTitle(rs.getString("title"));
                j.setCategory(rs.getString("category"));
                j.setCandidateType(rs.getString("candidate_type"));
                j.setExperienceYears(rs.getInt("experience_years"));
                j.setLocation(rs.getString("location"));
                j.setSalary(rs.getString("salary"));
                j.setStatus(rs.getString("status"));
                list.add(j);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Job getJobById(int jobId, int companyId) {
        Job j = null;

        String sql = "SELECT * FROM jobs WHERE job_id=? AND company_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, jobId);
            ps.setInt(2, companyId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                j = new Job();
                j.setJobId(jobId);
                j.setTitle(rs.getString("title"));
                j.setDescription(rs.getString("description"));
                j.setCategory(rs.getString("category"));
                j.setCandidateType(rs.getString("candidate_type"));
                j.setExperienceYears(rs.getInt("experience_years"));
                j.setLocation(rs.getString("location"));
                j.setSalary(rs.getString("salary"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return j;
    }

    @Override
    public boolean updateJob(Job job) {
        String sql = """
            UPDATE jobs SET
            title=?, description=?, category=?, candidate_type=?,
            experience_years=?, location=?, salary=?
            WHERE job_id=? AND company_id=?
        """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, job.getTitle());
            ps.setString(2, job.getDescription());
            ps.setString(3, job.getCategory());
            ps.setString(4, job.getCandidateType());
            ps.setInt(5, job.getExperienceYears());
            ps.setString(6, job.getLocation());
            ps.setString(7, job.getSalary());
            ps.setInt(8, job.getJobId());
            ps.setInt(9, job.getCompanyId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteJob(int jobId, int companyId) {
        String sql = "DELETE FROM jobs WHERE job_id=? AND company_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, jobId);
            ps.setInt(2, companyId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean closeJob(int jobId, int companyId) {
        String sql = "UPDATE jobs SET status='CLOSED' WHERE job_id=? AND company_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, jobId);
            ps.setInt(2, companyId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    @Override
    public List<Job> searchJobs(String keyword, String category,
                                String candidateType, Integer expYears) {

        List<Job> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder("""
            SELECT j.*, cinfo.company_name
            FROM jobs j
            JOIN cinfo ON j.company_id = cinfo.company_id
            WHERE j.status='OPEN'
        """);

        if (keyword != null && !keyword.isEmpty()) {
            sql.append(" AND (j.title LIKE ? OR cinfo.company_name LIKE ?)");
        }
        if (category != null && !category.isEmpty()) {
            sql.append(" AND j.category=?");
        }
        if (candidateType != null && !candidateType.isEmpty()) {
            sql.append(" AND j.candidate_type=?");
        }
        if (expYears != null) {
            sql.append(" AND j.experience_years <= ?");
        }

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql.toString())) {

            int index = 1;

            if (keyword != null && !keyword.isEmpty()) {
                ps.setString(index++, "%" + keyword + "%");
                ps.setString(index++, "%" + keyword + "%");
            }
            if (category != null && !category.isEmpty()) {
                ps.setString(index++, category);
            }
            if (candidateType != null && !candidateType.isEmpty()) {
                ps.setString(index++, candidateType);
            }
            if (expYears != null) {
                ps.setInt(index++, expYears);
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Job j = new Job();
                j.setJobId(rs.getInt("job_id"));
                j.setTitle(rs.getString("title"));
                j.setCategory(rs.getString("category"));
                j.setCandidateType(rs.getString("candidate_type"));
                j.setExperienceYears(rs.getInt("experience_years"));
                j.setLocation(rs.getString("location"));
                j.setSalary(rs.getString("salary"));
                j.setCompanyName(rs.getString("company_name"));
                list.add(j);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Job getJobDetailsById(int jobId) {

        Job j = null;

        String sql = """
            SELECT j.*, cinfo.company_name
            FROM jobs j
            JOIN cinfo ON j.company_id = cinfo.company_id
            WHERE j.job_id = ?
        """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, jobId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                // ✅ CREATE OBJECT FIRST
                j = new Job();

                // ✅ THEN SET VALUES
                j.setJobId(rs.getInt("job_id"));
                j.setCompanyId(rs.getInt("company_id"));
                j.setTitle(rs.getString("title"));
                j.setDescription(rs.getString("description"));
                j.setCategory(rs.getString("category"));
                j.setCandidateType(rs.getString("candidate_type"));
                j.setExperienceYears(rs.getInt("experience_years"));
                j.setLocation(rs.getString("location"));
                j.setSalary(rs.getString("salary"));
                j.setStatus(rs.getString("status"));
                j.setCompanyName(rs.getString("company_name"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return j; // may be null if jobId not found
    }



	@Override
	public List<Job> getRecentOpenJobs(int limit) {
	
	    List<Job> list = new ArrayList<>();
	
	    String sql = """
	        SELECT j.job_id, j.title, j.location, j.category,
	               cinfo.company_name
	        FROM jobs j
	        JOIN cinfo ON j.company_id = cinfo.company_id
	        WHERE j.status='OPEN'
	        ORDER BY j.posted_date DESC
	        LIMIT ?
	    """;
	
	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {
	
	        ps.setInt(1, limit);
	        ResultSet rs = ps.executeQuery();
	
	        while (rs.next()) {
	            Job j = new Job();
	            j.setJobId(rs.getInt("job_id"));
	            j.setTitle(rs.getString("title"));
	            j.setLocation(rs.getString("location"));
	            j.setCategory(rs.getString("category"));
	            j.setCompanyName(rs.getString("company_name"));
	            list.add(j);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}

}
