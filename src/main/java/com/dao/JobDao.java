package com.dao;

import java.util.List;

import com.model.Job;

public interface JobDao {

	boolean addJobs(Job job);
	List<Job> getJobsByCompanyId(int companyId);
	Job getJobById(int jobId, int companyId);
	boolean updateJob(Job job);
	boolean deleteJob(int jobId, int companyId);
	boolean closeJob(int jobId, int companyId);
	List<Job> searchJobs(String keyword, String category, String candidateType, Integer expYears);
	Job getJobDetailsById(int jobId);
	List<Job> getRecentOpenJobs(int limit);

}
