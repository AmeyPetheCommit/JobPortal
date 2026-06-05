package com.model;

public class Company {

	private int companyId;
    private String email;
    private String password;
    private CInfo cinfo;
	public Company() {
		super();
	}
	public Company(String email, String password, CInfo cinfo) {
		super();
		this.email = email;
		this.password = password;
		this.cinfo = cinfo;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public CInfo getCinfo() {
		return cinfo;
	}
	public void setCinfo(CInfo cinfo) {
		this.cinfo = cinfo;
	}
	@Override
	public String toString() {
		return "Company [companyId=" + companyId + ", email=" + email + ", password=" + password + ", cinfo=" + cinfo
				+ "]";
	}
    
    
}
