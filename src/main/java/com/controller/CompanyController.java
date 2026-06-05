package com.controller;

import com.dao.ApplicationDao;
import com.dao.ApplicationDaoImpl;
import com.dao.CompanyDao;
import com.dao.CompanyDaoImpl;
import com.dao.JobDao;
import com.dao.JobDaoImpl;
import com.model.CInfo;
import com.model.Company;
import com.model.JInfo;
import com.model.Job;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/company")
public class CompanyController extends HttpServlet {

    CompanyDao dao = new CompanyDaoImpl();
    JobDao jobDao = new JobDaoImpl();
    boolean flag;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"COMPANY".equals(session.getAttribute("role"))) {
            response.sendRedirect("jsp/auth/login.jsp");
            return;
        }

        String action = request.getParameter("action");
        Integer companyId = (Integer) session.getAttribute("companyId");

        
        if (action == null) {
            request.getRequestDispatcher("jsp/company/dashboard.jsp")
                   .forward(request, response);
            return;
        }

        
        if ("profile".equals(action)) {
            Company company = dao.getCompanyProfileById(companyId);
            request.setAttribute("company", company);
            request.getRequestDispatcher("jsp/company/profile.jsp")
                   .forward(request, response);
            return;
        }

        
        if ("edit".equals(action)) {
            Company company = dao.getCompanyProfileById(companyId);
            request.setAttribute("company", company);
            request.getRequestDispatcher("jsp/company/edit-profile.jsp")
                   .forward(request, response);
            return;
        }

        
        if ("post-job".equals(action)) {
            request.getRequestDispatcher("jsp/company/post-job.jsp")
                   .forward(request, response);
            return;
        }

        
        if ("manage-jobs".equals(action)) {
            List<Job> jobs = jobDao.getJobsByCompanyId(companyId);
            request.setAttribute("jobs", jobs);
            request.getRequestDispatcher("jsp/company/manage-jobs.jsp")
                   .forward(request, response);
            return;
        }

        
        if ("close-job".equals(action)) {
            int jobId = Integer.parseInt(request.getParameter("jobId"));
            boolean closed = jobDao.closeJob(jobId, companyId);

            if (closed) {
                response.sendRedirect("company?action=manage-jobs&closed=true");
            } else {
                response.sendRedirect("company?action=manage-jobs&error=true");
            }
        }
        
     
        if ("edit-job".equals(action)) {
            int jobId = Integer.parseInt(request.getParameter("jobId"));
            Job job = jobDao.getJobById(jobId, companyId);
            request.setAttribute("job", job);
            request.getRequestDispatcher("jsp/company/edit-job.jsp")
                   .forward(request, response);
            return;
        }

        
        if ("delete-job".equals(action)) {
            int jobId = Integer.parseInt(request.getParameter("jobId"));
            jobDao.deleteJob(jobId, companyId);
            response.sendRedirect("company?action=manage-jobs");
            return;
        }
        if ("view-applicants".equals(action)) {


            ApplicationDao appDao = new ApplicationDaoImpl();
            List<JInfo> applicants = appDao.getApplicantsByCompany(companyId);

            request.setAttribute("applicants", applicants);
            request.getRequestDispatcher("jsp/company/view-applicants.jsp")
                   .forward(request, response);
            return;
        }
        if ("update-application".equals(action)) {

            int jskId = Integer.parseInt(request.getParameter("jskId"));
            int jobId = Integer.parseInt(request.getParameter("jobId"));
            String status = request.getParameter("status");

            ApplicationDao appDao = new ApplicationDaoImpl();
            boolean updated = appDao.updateApplicationStatus(jskId, jobId, status);

            response.sendRedirect("company?action=view-applicants");
            return;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer companyId = (Integer) session.getAttribute("companyId");
        String action = request.getParameter("action");

        
        if ("update".equals(action)) {

            CInfo cinfo = new CInfo();
            cinfo.setCompanyId(companyId);
            cinfo.setCompanyName(request.getParameter("companyName"));
            cinfo.setLocation(request.getParameter("location"));
            cinfo.setWebsite(request.getParameter("website"));
            cinfo.setDescription(request.getParameter("description"));

            flag = dao.updateCompanyInfo(cinfo);

            if (flag) {
                response.sendRedirect("company?action=profile");
            } else {
                response.sendRedirect("failed.jsp");
            }
        }

        
        if ("save-job".equals(action)) {

            Job job = new Job();
            job.setCompanyId(companyId);
            job.setTitle(request.getParameter("title"));
            job.setDescription(request.getParameter("description"));
            job.setCategory(request.getParameter("category"));
            job.setCandidateType(request.getParameter("candidateType"));
            job.setLocation(request.getParameter("location"));
            job.setSalary(request.getParameter("salary"));

            int expYears = 0;
            if ("Experienced".equals(request.getParameter("candidateType"))) {
                expYears = Integer.parseInt(request.getParameter("experienceYears"));
            }
            job.setExperienceYears(expYears);

            flag = jobDao.addJobs(job);

            if (flag) {
                response.sendRedirect("company?action=post-job&success=true");
            } else {
                response.sendRedirect("company?action=post-job&error=true");
            }
        
            
        }
        if ("update-job".equals(action)) {

            Job job = new Job();
            job.setJobId(Integer.parseInt(request.getParameter("jobId")));
            job.setCompanyId(companyId);
            job.setTitle(request.getParameter("title"));
            job.setDescription(request.getParameter("description"));
            job.setCategory(request.getParameter("category"));
            job.setCandidateType(request.getParameter("candidateType"));
            job.setLocation(request.getParameter("location"));
            job.setSalary(request.getParameter("salary"));

            int exp = 0;
            if ("Experienced".equals(request.getParameter("candidateType"))) {
                exp = Integer.parseInt(request.getParameter("experienceYears"));
            }
            job.setExperienceYears(exp);

            jobDao.updateJob(job);
            response.sendRedirect("company?action=manage-jobs");
        }
    }
}

