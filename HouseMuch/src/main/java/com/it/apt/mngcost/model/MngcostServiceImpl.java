package com.it.apt.mngcost.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.it.apt.adminLiving.add.model.AddFacilityInfoVO;
import com.it.apt.energy.UtilityCostInfoVO;
import com.it.apt.household.model.HouseholdVO;

@Service
public class MngcostServiceImpl implements MngcostService{
	@Autowired private MngcostDAO mngcostDao;

	//입주자
	@Override
	public List<MngcostMainCtgVO> selectMCtgList() {
		return mngcostDao.selectMCtgList();
	}

	@Override
	public List<MngcostSubCtgVO> selectSCtgList(int mngcostMCtgNo) {
		return mngcostDao.selectSCtgList(mngcostMCtgNo);
	}

	@Override
	public List<MngcostPaymentListVO> selectPayList(String householdCode) {
		return mngcostDao.selectPayList(householdCode);
	}

	@Override
	public List<MngcostInfoVO> selectMngcostInfoByClaim(InquiryInfoVO inqVo) {
		return mngcostDao.selectMngcostInfoByClaim(inqVo);
	}
	
	@Override
	public List<AddFacilityInfoVO> plusAddInfo(InquiryInfoVO inqVo) {
		return mngcostDao.plusAddInfo(inqVo);
	}
	
	@Override
	@Transactional
	public int updatePaymentListMulti(List<MngcostPaymentListVO> mngcostPaymentListList) {
		int cnt=0;
		try {
			for(MngcostPaymentListVO mngcostPaymentListVo:mngcostPaymentListList) {
				cnt=mngcostDao.updatePaymentList(mngcostPaymentListVo);
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	@Override
	public List<MngcostPaymentListVO> selectUnpaidPaymentList(String householdCode) {
		return mngcostDao.selectUnpaidPaymentList(householdCode);
	}
	
	
	
	//관리자
	@Override
	public List<MngcostInfoVO> adminSelectMngcostInfo(InquiryInfoVO inqVo) {
		return mngcostDao.adminSelectMngcostInfo(inqVo);
	}

	@Override
	public int cntAlreadyOrder(InquiryInfoVO inqVo) {
		return mngcostDao.cntAlreadyOrder(inqVo);
	}

	@Override
	@Transactional
	public int insertMngcostInfoMulti(List<MngcostInfoVO> mngcostInfoList) {
		int cnt=0;
		try {
			for(MngcostInfoVO mngcostInfoVo : mngcostInfoList) {
				cnt=mngcostDao.insertMngcostInfo(mngcostInfoVo);
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	@Override
	@Transactional
	public int deleteMngcostInfoMulti(String[] mngcostNoArray) {
		int cnt=0;
		try {
			for(String mngcostNo : mngcostNoArray) {
				cnt=mngcostDao.deleteMngcostInfo(Integer.parseInt(mngcostNo));
				System.out.println(mngcostNo);
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	@Override
	public MngcostInfoVO selectMngcostInfoAddMCtgNo(int mngcostNo) {
		return mngcostDao.selectMngcostInfoAddMCtgNo(mngcostNo);
	}

	@Override
	public int updateMngcostInfo(MngcostInfoVO mngcostInfoVo) {
		return mngcostDao.updateMngcostInfo(mngcostInfoVo);
	}

	@Override
	public List<Map<String, Object>> selectMngcostOrderList(int aptNo) {
		return mngcostDao.selectMngcostOrderList(aptNo);
	}

	@Override
	public int insertMngcostPaymentList(InquiryInfoVO inqVo) {
		return mngcostDao.insertMngcostPaymentList(inqVo);
	}

	@Override
	public List<String> selectMyDongList(int aptNo) {
		return mngcostDao.selectMyDongList(aptNo);
	}

	@Override
	public List<String> selectMyHoList(int aptNo) {
		return mngcostDao.selectMyHoList(aptNo);
	}

	@Override
	public List<Map<String, Object>> selectMngcostPaymentList(HouseholdVO householdVo) {
		return mngcostDao.selectMngcostPaymentList(householdVo);
	}

	@Override
	public List<HouseholdVO> selectHouseholdList(int aptNo) {
		return mngcostDao.selectHouseholdList(aptNo);
	}

	@Override
	@Transactional
	public int insertUtilityCostInfoMulti(List<UtilityCostInfoVO> utilityCostList) {
		int cnt=0;
		try {
			for(UtilityCostInfoVO utilityCostVo : utilityCostList) {
				cnt=mngcostDao.insertUtilityCostInfo(utilityCostVo);
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	@Override
	public List<String> adminElectricChargeRegDupCheckMulti(List<String> householdCodeList) {
		List<String> alreadyCode=new ArrayList<String>();
		for(String householdCode:householdCodeList) {
			int cnt=mngcostDao.adminElectricChargeRegDupCheck(householdCode);
			if(cnt>0) {
				int count=0;
				for(String s:alreadyCode) {
					if(householdCode.equals(s)) {
						count++;
						break;
					}
				}
				if(count==0) alreadyCode.add(householdCode);
			}
		}
		return alreadyCode;
	}

	@Override
	public int selectTotalRecordMngcostPaymentList(HouseholdVO householdVo) {
		return mngcostDao.selectTotalRecordMngcostPaymentList(householdVo);
	}
	
	//미납세대 이메일 조회
	@Override
	public String selectEmailUnpaidHousehold(String householdCode) {
		return mngcostDao.selectEmailUnpaidHousehold(householdCode);
	}
}
