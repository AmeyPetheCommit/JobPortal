package com.model;

public class CInfo {

	private int cinfoId;
	private int companyId;
	private String companyName;
	private String location;
	private String website;
	private String description;
	public CInfo() {
		super();
	}
	public CInfo(int companyId, String companyName, String location, String website, String description) {
		super();
		this.companyId = companyId;
		this.companyName = companyName;
		this.location = location;
		this.website = website;
		this.description = description;
	}
	public int getCinfoId() {
		return cinfoId;
	}
	public void setCinfoId(int cinfoId) {
		this.cinfoId = cinfoId;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "CInfo [cinfoId=" + cinfoId + ", companyId=" + companyId + ", companyName=" + companyName + ", location="
				+ location + ", website=" + website + ", description=" + description + "]";
	}
	
	
}
