package com.it.apt.userBoard.model;

import java.sql.Timestamp;

public class UserBoardVO {
	private int boardNo; /* 번호 */
	private int boardCtgNo;  /* 입주민 게시판 분류 번호 */
	private String boardTitle; /* 제목 */
	private String boardContent;  /* 내용 */
	private Timestamp boardRegdate; /* 등록일 */
	private int boardReadcount; /* 조회수 */
	private int memberNo;  /* 회원 번호 */
	private int aptNo; /* 아파트 번호 */
	
	/* 파일업로드 */
	private int bStorageNo; /* 번호 */
	private String boardFilename;  /* 파일명 */
	private String boardOriginalFilename;  /* 기존 파일명 */
	private long boardFilesize; /* 파일크기 */
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getBoardCtgNo() {
		return boardCtgNo;
	}
	public void setBoardCtgNo(int boardCtgNo) {
		this.boardCtgNo = boardCtgNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Timestamp getBoardRegdate() {
		return boardRegdate;
	}
	public void setBoardRegdate(Timestamp boardRegdate) {
		this.boardRegdate = boardRegdate;
	}
	public int getBoardReadcount() {
		return boardReadcount;
	}
	public void setBoardReadcount(int boardReadcount) {
		this.boardReadcount = boardReadcount;
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
	/* 파일업로드 getter/setter */
	public int getbStorageNo() {
		return bStorageNo;
	}
	public void setbStorageNo(int bStorageNo) {
		this.bStorageNo = bStorageNo;
	}
	public String getBoardFilename() {
		return boardFilename;
	}
	public void setBoardFilename(String boardFilename) {
		this.boardFilename = boardFilename;
	}
	public String getBoardOriginalFilename() {
		return boardOriginalFilename;
	}
	public void setBoardOriginalFilename(String boardOriginalFilename) {
		this.boardOriginalFilename = boardOriginalFilename;
	}
	public long getBoardFilesize() {
		return boardFilesize;
	}
	public void setBoardFilesize(long boardFilesize) {
		this.boardFilesize = boardFilesize;
	}
	
	@Override
	public String toString() {
		return "UserBoardVO [boardNo=" + boardNo + ", boardCtgNo=" + boardCtgNo + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardRegdate=" + boardRegdate + ", boardReadcount="
				+ boardReadcount + ", memberNo=" + memberNo + ", aptNo=" + aptNo + ", bStorageNo=" + bStorageNo
				+ ", boardFilename=" + boardFilename + ", boardOriginalFilename=" + boardOriginalFilename
				+ ", boardFilesize=" + boardFilesize + "]";
	}
	
	
	
}
