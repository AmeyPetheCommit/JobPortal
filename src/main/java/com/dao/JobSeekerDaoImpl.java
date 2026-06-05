package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.db.DBConnection;
import com.model.JInfo;

public class JobSeekerDaoImpl implements JobSeekerDao {

    @Override
    public JInfo getJobSeekerInfoById(int jskId) {

        JInfo jinfo = null;

        String sql = "SELECT name, phone, skills, experience, qualification FROM jinfo WHERE jsk_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, jskId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                jinfo = new JInfo();
                jinfo.setName(rs.getString("name"));
                jinfo.setPhone(rs.getString("phone"));
                jinfo.setSkills(rs.getString("skills"));
                jinfo.setExperience(rs.getString("experience"));
                jinfo.setQualification(rs.getString("qualification"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return jinfo;
    }

    @Override
    public boolean updateJobSeekerInfo(JInfo jinfo) {

        String sql = """
            UPDATE jinfo
            SET name=?, phone=?, skills=?, experience=?, qualification=?
            WHERE jsk_id=?
        """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, jinfo.getName());
            ps.setString(2, jinfo.getPhone());
            ps.setString(3, jinfo.getSkills());
            ps.setString(4, jinfo.getExperience());
            ps.setString(5, jinfo.getQualification());
            ps.setInt(6, jinfo.getJskId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
