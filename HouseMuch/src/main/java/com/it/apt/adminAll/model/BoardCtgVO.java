package com.it.apt.adminAll.model;

public class BoardCtgVO {
	private int boardCtgNo;  /* 번호 */
	private int aptNo;  /* 아파트 번호 */
	private String boardCtgName;  /* 이름 */
	
	public int getBoardCtgNo() {
		return boardCtgNo;
	}
	public void setBoardCtgNo(int boardCtgNo) {
		this.boardCtgNo = boardCtgNo;
	}
	public int getAptNo() {
		return aptNo;
	}
	public void setAptNo(int aptNo) {
		this.aptNo = aptNo;
	}
	public String getBoardCtgName() {
		return boardCtgName;
	}
	public void setBoardCtgName(String boardCtgName) {
		this.boardCtgName = boardCtgName;
	}
	
	@Override
	public String toString() {
		return "BoardCtgVO [boardCtgNo=" + boardCtgNo + ", aptNo=" + aptNo + ", boardCtgName=" + boardCtgName + "]";
	}
	
	
	
}
