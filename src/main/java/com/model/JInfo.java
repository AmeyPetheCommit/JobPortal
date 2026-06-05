package com.model;

public class JInfo {

    private int jinfoId;
    private int jskId;
    private int jobId;
    private String name;
    private String phone;
    private String skills;
    private String experience;
    private String qualification;
    private String appliedJobTitle;

    public JInfo() {}

    public int getJinfoId() {
        return jinfoId;
    }

    public void setJinfoId(int jinfoId) {
        this.jinfoId = jinfoId;
    }

    public int getJskId() {
        return jskId;
    }

    public void setJskId(int jskId) {
        this.jskId = jskId;
    }
    
    public int getJobId() {
        return jobId;
    }
    
    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }
    
    public String getAppliedJobTitle() {
        return appliedJobTitle;
    }

    public void setAppliedJobTitle(String appliedJobTitle) {
        this.appliedJobTitle = appliedJobTitle;
    }

	@Override
	public String toString() {
		return "JInfo [jinfoId=" + jinfoId + ", jskId=" + jskId + ", name=" + name + ", phone=" + phone + ", skills="
				+ skills + ", experience=" + experience + ", qualification=" + qualification + ", appliedJobTitle="
				+ appliedJobTitle + "]";
	}
    
    
}
