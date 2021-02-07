package com.it.apt.adminOwner.model;

public class AuthorityVO {
	private String authCode;
	private String authName;
	private String authContent;
	private int authLevel;
	
	public String getAuthCode() {
		return authCode;
	}
	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}
	public String getAuthName() {
		return authName;
	}
	public void setAuthName(String authName) {
		this.authName = authName;
	}
	public String getAuthContent() {
		return authContent;
	}
	public void setAuthContent(String authContent) {
		this.authContent = authContent;
	}
	public int getAuthLevel() {
		return authLevel;
	}
	public void setAuthLevel(int authLevel) {
		this.authLevel = authLevel;
	}
	
	@Override
	public String toString() {
		return "AuthorityVO [authCode=" + authCode + ", authName=" + authName + ", authContent=" + authContent
				+ ", authLevel=" + authLevel + "]";
	}
	
}
