package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.db.DBConnection;
import com.model.CInfo;
import com.model.Company;

public class CompanyDaoImpl implements CompanyDao {

    @Override
    public Company getCompanyProfileById(Integer companyId) {

        Company company = null;

        String sql = """
            SELECT c.company_email,
                   ci.company_name,
                   ci.location,
                   ci.website,
                   ci.description
            FROM company c
            JOIN cinfo ci ON c.company_id = ci.company_id
            WHERE c.company_id = ?
        """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, companyId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                company = new Company();
                company.setCompanyId(companyId);
                company.setEmail(rs.getString("company_email"));

                CInfo cinfo = new CInfo();
                cinfo.setCompanyName(rs.getString("company_name"));
                cinfo.setLocation(rs.getString("location"));
                cinfo.setWebsite(rs.getString("website"));
                cinfo.setDescription(rs.getString("description"));

                // HAS-A mapping
                company.setCinfo(cinfo);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return company;
    }

    @Override
    public boolean updateCompanyInfo(CInfo cinfo) {

        String sql = """
            UPDATE cinfo
            SET company_name=?, location=?, website=?, description=?
            WHERE company_id=?
        """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, cinfo.getCompanyName());
            ps.setString(2, cinfo.getLocation());
            ps.setString(3, cinfo.getWebsite());
            ps.setString(4, cinfo.getDescription());
            ps.setInt(5, cinfo.getCompanyId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
