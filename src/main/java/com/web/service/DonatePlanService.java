package com.web.service;


import java.util.List;

import com.web.model.raisefunding.CrowdFundingBean;
import com.web.model.raisefunding.DonatePlanBean;
import com.web.model.raisefunding.PurchaseBean;

public interface DonatePlanService {
	public int createNewPlan(DonatePlanBean dpBean);
	public int updatePlan(DonatePlanBean dpBean);
	public DonatePlanBean getDonateBean(Integer planId);
	public int createPurchaseData( PurchaseBean pcBean);
	public PurchaseBean getPurchase(Integer purchaseId);
	public List<PurchaseBean> getAllPurchases();
	public List<PurchaseBean> getPurchases(Integer planId);
	public List<PurchaseBean> getPersonalPurchases(Integer memberId);
	public Boolean DonatingTransaction(PurchaseBean pcBean);
	public List<PurchaseBean> getProjMemberByPurchase(Integer projectId);
	public List<PurchaseBean> getMemberPurchaseById(Integer memberId);
	public CrowdFundingBean getProjectDetail(Integer projectId);
	
}

