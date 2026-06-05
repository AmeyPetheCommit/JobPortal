package com.model;

import java.time.LocalDateTime;

public class Application {

	private int applicationId;
	private int jobId;
	private int jskId;
	private String status;
    private LocalDateTime appliedDate;
	public Application() {
		super();
	}
	public Application(int jobId, int jskId, String status, LocalDateTime appliedDate) {
		super();
		this.jobId = jobId;
		this.jskId = jskId;
		this.status = status;
		this.appliedDate = appliedDate;
	}
	public int getApplicationId() {
		return applicationId;
	}
	public void setApplicationId(int applicationId) {
		this.applicationId = applicationId;
	}
	public int getJobId() {
		return jobId;
	}
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	public int getJskId() {
		return jskId;
	}
	public void setJskId(int jskId) {
		this.jskId = jskId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public LocalDateTime getAppliedDate() {
		return appliedDate;
	}
	public void setAppliedDate(LocalDateTime appliedDate) {
		this.appliedDate = appliedDate;
	}
	@Override
	public String toString() {
		return "Application [applicationId=" + applicationId + ", jobId=" + jobId + ", jskId=" + jskId + ", status="
				+ status + ", appliedDate=" + appliedDate + "]";
	}
    
    
	
}
