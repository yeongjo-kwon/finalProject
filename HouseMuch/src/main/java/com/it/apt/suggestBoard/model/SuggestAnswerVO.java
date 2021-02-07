package com.it.apt.suggestBoard.model;

import java.sql.Timestamp;

public class SuggestAnswerVO {
	private int answNo; /* 번호 */
	private String answContent; /* 내용 */
	private int memberNo; /* 회원 번호 */
	private Timestamp answRegdate;  /* 작성일자 */
	private int suggBoardNo; /* 건의게시판 번호 */
	
	public int getAnswNo() {
		return answNo;
	}
	public void setAnswNo(int answNo) {
		this.answNo = answNo;
	}
	public String getAnswContent() {
		return answContent;
	}
	public void setAnswContent(String answContent) {
		this.answContent = answContent;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public Timestamp getAnswRegdate() {
		return answRegdate;
	}
	public void setAnswRegdate(Timestamp answRegdate) {
		this.answRegdate = answRegdate;
	}
	public int getSuggBoardNo() {
		return suggBoardNo;
	}
	public void setSuggBoardNo(int suggBoardNo) {
		this.suggBoardNo = suggBoardNo;
	}
	
	@Override
	public String toString() {
		return "SuggestAnswerVO [answNo=" + answNo + ", answContent=" + answContent + ", memberNo=" + memberNo
				+ ", answRegdate=" + answRegdate + ", suggBoardNo=" + suggBoardNo + "]";
	}
	
	
}
