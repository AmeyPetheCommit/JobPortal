package com.model;

public class JobSeeker {

	private int jskId;
	private String email;
	private String password;
	private JInfo jinfo;
	
	public JobSeeker() {
		super();
	}

	public JobSeeker(String email, String password, JInfo jinfo) {
		super();
		
		this.email = email;
		this.password = password;
		this.jinfo = jinfo;
	}

	public int getJskId() {
		return jskId;
	}

	public void setJskId(int jskId) {
		this.jskId = jskId;
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

	public JInfo getJinfo() {
		return jinfo;
	}

	public void setJinfo(JInfo jinfo) {
		this.jinfo = jinfo;
	}

	@Override
	public String toString() {
		return "JobSeeker [jskId=" + jskId + ", email=" + email + ", password=" + password + ", jinfo=" + jinfo + "]";
	}
	
	
}
