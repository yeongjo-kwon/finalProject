package com.it.apt.mngcost.model;

import java.util.List;

import com.it.apt.apart.model.ApartVO;

public class IMPVO {
	private List<MngcostPaymentListVO> mngcostPaymentListList;//변수명 주의
	private ApartVO apartVo;
	private String payName;
	private int payAmount;
	
	public List<MngcostPaymentListVO> getMngcostPaymentListList() {
		return mngcostPaymentListList;
	}
	public void setMngcostPaymentListList(List<MngcostPaymentListVO> mngcostPaymentListList) {
		this.mngcostPaymentListList = mngcostPaymentListList;
	}
	public ApartVO getApartVo() {
		return apartVo;
	}
	public void setApartVo(ApartVO apartVo) {
		this.apartVo = apartVo;
	}
	public String getPayName() {
		return payName;
	}
	public void setPayName(String payName) {
		this.payName = payName;
	}
	public int getPayAmount() {
		return payAmount;
	}
	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}
	
	@Override
	public String toString() {
		return "IMPVO [mngcostPaymentListList=" + mngcostPaymentListList + ", apartVo=" + apartVo + ", payName="
				+ payName + ", payAmount=" + payAmount + "]";
	}
}
