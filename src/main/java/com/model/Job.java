package com.model;

import java.time.LocalDateTime;

public class Job {

	private int jobId;
	private int companyId;
	private String title;
    private String description;
    private String category;
    private String candidateType;
    private int experienceYears;
    private String location;
    private String salary;
    private LocalDateTime postedDate;
    private String status;
    private String companyName;
    
	public Job() {
		super();
	}
	public Job(int companyId, String title, String description,String category, String candidateType, int experienceYears,  String location, String salary,
			LocalDateTime postedDate, String status) {
		super();
		this.companyId = companyId;
		this.title = title;
		this.description = description;
		this.category = category;
		this.candidateType = candidateType;
		this.experienceYears = experienceYears;
		this.location = location;
		this.salary = salary;
		this.postedDate = postedDate;
		this.status = status;
		
	}
	public int getJobId() {
		return jobId;
	}
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCandidateType() {
		return candidateType;
	}
	public void setCandidateType(String candidateType) {
		this.candidateType = candidateType;
	}
	public int getExperienceYears() {
		return experienceYears;
	}
	public void setExperienceYears(int experienceYears) {
		this.experienceYears = experienceYears;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public LocalDateTime getPostedDate() {
		return postedDate;
	}
	public void setPostedDate(LocalDateTime postedDate) {
		this.postedDate = postedDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCompanyName() {
	    return companyName;
	}

	public void setCompanyName(String companyName) {
	    this.companyName = companyName;
	}
	@Override
	public String toString() {
		return "Job [jobId=" + jobId + ", companyId=" + companyId + ", title=" + title + ", description=" + description
				+ ", category=" + category + ", candidateType=" + candidateType + ", experienceYears=" + experienceYears
				+ ", location=" + location + ", salary=" + salary + ", postedDate=" + postedDate +", status=" + status+", companyName="+companyName+ "]";
	}
	
	
	
	
    
    
}
