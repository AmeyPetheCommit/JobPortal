package com.dao;

import java.util.List;

import com.model.JInfo;
import com.model.Job;

public interface ApplicationDao {

    boolean hasApplied(int jobId, int jskId);

    boolean applyJob(int jobId, int jskId);

	List<Job> getApplicationsByJobSeeker(int jskId);

	List<JInfo> getApplicantsByCompany(int companyId);

	boolean updateApplicationStatus(int jskId, int jobId, String status);
}
