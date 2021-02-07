package com.it.apt.userBoard.model;

import java.sql.Timestamp;

public class boardCommentVO {
	private int commNo; /* 번호 */
	private String commContent; /* 내용 */
	private int memberNo; /* 회원 번호 */
	private Timestamp commRegdate; /* 작성일자 */
	private int boardNo; /* 입주민 게시판 번호 */

	public int getCommNo() {
		return commNo;
	}
	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}
	public String getCommContent() {
		return commContent;
	}
	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public Timestamp getCommRegdate() {
		return commRegdate;
	}
	public void setCommRegdate(Timestamp commRegdate) {
		this.commRegdate = commRegdate;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
	@Override
	public String toString() {
		return "boardCommentVO [commNo=" + commNo + ", commContent=" + commContent + ", memberNo=" + memberNo
				+ ", commRegdate=" + commRegdate + ", boardNo=" + boardNo + "]";
	}
	
	
}
