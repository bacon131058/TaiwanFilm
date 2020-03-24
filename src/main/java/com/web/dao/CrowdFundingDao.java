package com.web.dao;

import java.util.List;

import com.web.model.raisefunding.CrowdFundingBean;
import com.web.model.raisefunding.PurchaseBean;

public interface CrowdFundingDao {
	public int createNewCrowdFunding(CrowdFundingBean cfBean);
	public int updateFund(CrowdFundingBean cfBean);
	public CrowdFundingBean getCrowdFundingBean(Integer projectId);
	List<CrowdFundingBean> getAllFunding();
	public List<CrowdFundingBean> getAllFundingById();
	public List<CrowdFundingBean> getAllFundingByDate();
	public void addNewBacker(PurchaseBean pcBean);
	public void addDonateToFund(PurchaseBean pcBean);
}
