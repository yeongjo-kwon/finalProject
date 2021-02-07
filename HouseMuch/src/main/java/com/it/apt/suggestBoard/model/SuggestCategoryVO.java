package com.it.apt.suggestBoard.model;

/*건의게시판 카테고리*/
public class SuggestCategoryVO {
	private int suggCtgNo; /* 번호 */
	private String suggCtgName; /* 이름 */
	
	public int getSuggCtgNo() {
		return suggCtgNo;
	}
	public void setSuggCtgNo(int suggCtgNo) {
		this.suggCtgNo = suggCtgNo;
	}
	public String getSuggCtgName() {
		return suggCtgName;
	}
	public void setSuggCtgName(String suggCtgName) {
		this.suggCtgName = suggCtgName;
	}
	
	@Override
	public String toString() {
		return "SuggestCategoryVO [suggCtgNo=" + suggCtgNo + ", suggCtgName=" + suggCtgName + "]";
	}
	
	
}
