package com.it.apt.adminLiving.notice.model;

public class NoticeStorageVO extends NoticeBoardVO{
	private int nStorageNo;
	private int noticeNo;
	private String noticeFilename;
	private String noticeOriginalFilename;
	private long noticeFilesize;
	
	
	public int getnStorageNo() {
		return nStorageNo;
	}
	public void setnStorageNo(int nStorageNo) {
		this.nStorageNo = nStorageNo;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeFilename() {
		return noticeFilename;
	}
	public void setNoticeFilename(String noticeFilename) {
		this.noticeFilename = noticeFilename;
	}
	public String getnoticeOriginalFilename() {
		return noticeOriginalFilename;
	}
	public void setnoticeOriginalFilename(String noticeOriginalFilename) {
		this.noticeOriginalFilename = noticeOriginalFilename;
	}
	public long getNoticeFilesize() {
		return noticeFilesize;
	}
	public void setNoticeFilesize(long noticeFilesize) {
		this.noticeFilesize = noticeFilesize;
	}
	
	
	@Override
	public String toString() {
		return "NoticeStorageVO [nStorageNo=" + nStorageNo + ", noticeNo=" + noticeNo + ", noticeFilename="
				+ noticeFilename + ", noticeOriginalFilename=" + noticeOriginalFilename + ", noticeFilesize="
				+ noticeFilesize + "]";
	}
	
	

	
	
}
