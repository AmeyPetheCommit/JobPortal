package com.controller;

import com.dao.ApplicationDao;
import com.dao.ApplicationDaoImpl;
import com.dao.JobDao;
import com.dao.JobDaoImpl;
import com.dao.JobSeekerDao;
import com.dao.JobSeekerDaoImpl;
import com.model.JInfo;
import com.model.Job;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/jsk")
public class JobSeekerController extends HttpServlet {

    JobSeekerDao dao = new JobSeekerDaoImpl();
    JobDao jobDao = new JobDaoImpl();
    ApplicationDao appDao = null;
    boolean flag;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"JSK".equals(session.getAttribute("role"))) {
            response.sendRedirect("jsp/auth/login.jsp");
            return;
        }

        String action = request.getParameter("action");
        Integer jskId = (Integer) session.getAttribute("jskId");

        
        if (action == null || action.equals("profile")) {
            JInfo jinfo = dao.getJobSeekerInfoById(jskId);
            request.setAttribute("jinfo", jinfo);
            request.getRequestDispatcher("jsp/jobseeker/profile.jsp")
                   .forward(request, response);
        }

        
        if ("edit".equals(action)) {
            JInfo jinfo = dao.getJobSeekerInfoById(jskId);
            request.setAttribute("jinfo", jinfo);
            request.getRequestDispatcher("jsp/jobseeker/edit-profile.jsp")
                   .forward(request, response);
        }
        
        if ("find-jobs".equals(action)) {

            String keyword = request.getParameter("keyword");
            String category = request.getParameter("category");
            String candidateType = request.getParameter("candidateType");
            Integer expYears = null;

            if (request.getParameter("experienceYears") != null &&
                !request.getParameter("experienceYears").isEmpty()) {
                expYears = Integer.parseInt(request.getParameter("experienceYears"));
            }

            List<Job> jobs = jobDao.searchJobs(
                    keyword, category, candidateType, expYears);

            request.setAttribute("jobs", jobs);
            request.getRequestDispatcher("jsp/jobseeker/find-jobs.jsp")
                   .forward(request, response);
        }
        if ("view-job".equals(action)) {

            int jobId = Integer.parseInt(request.getParameter("jobId"));

            Job job = jobDao.getJobDetailsById(jobId);

            if (job == null) {
                response.sendRedirect(request.getContextPath() + "/jsk?action=find-jobs");
                return;
            }

            List<Job> moreJobs = jobDao.getRecentOpenJobs(6);

            request.setAttribute("job", job);
            request.setAttribute("moreJobs", moreJobs);

            request.getRequestDispatcher("jsp/jobseeker/view-job.jsp")
                   .forward(request, response);
        }

        if ("apply-job".equals(action)) {
        	int jobId = Integer.parseInt(request.getParameter("jobId"));
            

            appDao = new ApplicationDaoImpl();

            if (appDao.hasApplied(jobId, jskId)) {
                response.sendRedirect("jsk?action=view-job&jobId=" + jobId + "&applied=already");
                return;
            }

            boolean applied = appDao.applyJob(jobId, jskId);

            if (applied) {
                response.sendRedirect("jsk?action=view-job&jobId=" + jobId + "&applied=success");
            } else {
                response.sendRedirect("jsk?action=view-job&jobId=" + jobId + "&applied=error");
            }
        }
        
        if ("my-applications".equals(action)) {
        	appDao = new ApplicationDaoImpl();
            List<Job> applications = appDao.getApplicationsByJobSeeker(jskId);

            request.setAttribute("applications", applications);
            request.getRequestDispatcher("jsp/jobseeker/my-applications.jsp")
                   .forward(request, response);
        }
        
        

    }
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer jskId = (Integer) session.getAttribute("jskId");

        String action = request.getParameter("action");

        if ("update".equals(action)) {
            JInfo jinfo = new JInfo();
            jinfo.setJskId(jskId);
            jinfo.setName(request.getParameter("name"));
            jinfo.setPhone(request.getParameter("phone"));
            jinfo.setSkills(request.getParameter("skills"));
            jinfo.setExperience(request.getParameter("experience"));
            jinfo.setQualification(request.getParameter("qualification"));

            flag = dao.updateJobSeekerInfo(jinfo);

            if (flag) {
                response.sendRedirect("jsk?action=profile");
            } else {
                response.sendRedirect("failed.jsp");
            }
        }
    }
}
