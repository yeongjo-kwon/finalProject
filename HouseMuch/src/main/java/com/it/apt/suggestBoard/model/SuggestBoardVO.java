package com.it.apt.suggestBoard.model;

import java.sql.Timestamp;

public class SuggestBoardVO {
	private int suggBoardNo; /* 번호 */
	private int suggCtgNo; /* 건의게시판 분류번호 */
	private String suggTitle; /* 제목, default 제목없음 */
	private String suggContent; /* 내용 */
	private Timestamp suggRegdate; /* 등록일 */
	private int memberNo; /* 회원 번호 */
	private int aptNo; /* 아파트 번호 */
	
	private SuggestCategoryVO suggestCategoryVo;
	
	public int getSuggBoardNo() {
		return suggBoardNo;
	}
	public void setSuggBoardNo(int suggBoardNo) {
		this.suggBoardNo = suggBoardNo;
	}
	public int getSuggCtgNo() {
		return suggCtgNo;
	}
	public void setSuggCtgNo(int suggCtgNo) {
		this.suggCtgNo = suggCtgNo;
	}
	public String getSuggTitle() {
		return suggTitle;
	}
	public void setSuggTitle(String suggTitle) {
		this.suggTitle = suggTitle;
	}
	public String getSuggContent() {
		return suggContent;
	}
	public void setSuggContent(String suggContent) {
		this.suggContent = suggContent;
	}
	public Timestamp getSuggRegdate() {
		return suggRegdate;
	}
	public void setSuggRegdate(Timestamp suggRegdate) {
		this.suggRegdate = suggRegdate;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getAptNo() {
		return aptNo;
	}
	public void setAptNo(int aptNo) {
		this.aptNo = aptNo;
	}
	
	public SuggestCategoryVO getSuggestCategoryVo() {
		return suggestCategoryVo;
	}
	public void setSuggestCategoryVo(SuggestCategoryVO suggestCategoryVo) {
		this.suggestCategoryVo = suggestCategoryVo;
	}
	
	@Override
	public String toString() {
		return "SuggestBoardVO [suggBoardNo=" + suggBoardNo + ", suggCtgNo=" + suggCtgNo + ", suggTitle=" + suggTitle
				+ ", suggContent=" + suggContent + ", suggRegdate=" + suggRegdate + ", memberNo=" + memberNo
				+ ", aptNo=" + aptNo + ", suggestCategoryVo=" + suggestCategoryVo + "]";
	}
	
}
