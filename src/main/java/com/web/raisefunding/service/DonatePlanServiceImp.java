package com.web.raisefunding.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.login.Dao.MembersDao;
import com.web.raisefunding.dao.CrowdFundingDao;
import com.web.raisefunding.dao.DonatePlanDao;
import com.web.raisefunding.dao.ProjectDao;
import com.web.raisefunding.dao.PurchaseBeanDao;
import com.web.raisefunding.model.CrowdFundingBean;
import com.web.raisefunding.model.DonatePlanBean;
import com.web.raisefunding.model.PurchaseBean;
@Service
public class DonatePlanServiceImp implements DonatePlanService {
	@Autowired
	DonatePlanDao dpDao;
	@Autowired
	PurchaseBeanDao pcDao;
	@Autowired
	CrowdFundingDao cfDao;
	@Autowired
	MembersDao mbDao;
	@Autowired
	ProjectDao projDao;
	
	@Transactional
	@Override
	public DonatePlanBean getDonateBean(Integer planId) {
		return dpDao.getPlan(planId);
	}
	
	@Transactional
	@Override
	public int createNewPlan(DonatePlanBean dpBean) {
		int n = 0;
		dpDao.createNewPlan(dpBean);
		n++;
		return n;
	}
	@Transactional
	@Override
	public int updatePlan(DonatePlanBean dpBean) {
		int n = 0;
		dpDao.updatePlan(dpBean);
		n++;
		return n;
	}
	@Transactional
	@Override
	public int createPurchaseData(PurchaseBean pcBean) {
		int n = 0;
		pcDao.createPurchaseData(pcBean);
		
		n++;
		return n;
	}
	@Transactional
	@Override
	public PurchaseBean getPurchase(Integer purchaseId) {
		return  pcDao.getPurchase(purchaseId);
	}
	
	@Transactional
	@Override
	public List<PurchaseBean> getAllPurchases() {
		return pcDao.getAllPurchases();
	}
	@Transactional
	@Override
	public List<PurchaseBean> getPurchases(Integer planId) {
		return pcDao.getAllPurchases();
	}
	@Transactional
	@Override
	public List<PurchaseBean> getPersonalPurchases(Integer memberId) {
		return pcDao.getPersonalPurchases(memberId);
	}
	
	@Transactional
	@Override
	public Boolean DonatingTransaction(PurchaseBean pcBean){
		dpDao.donatingOnce(pcBean.getDpBean().getPlanId());//賣一個單位扣除一個庫存
		if(pcDao.checkProjectMember(pcBean)!=true) {//確認有沒有買過其他同專案的商品
			cfDao.addNewBacker(pcBean);//沒買過就加一人
		}
		cfDao.addDonateToFund(pcBean);//增加金額
		return true;
	}
	@Transactional
	@Override
	public CrowdFundingBean getProjectDetail(Integer projectId) {
		return cfDao.getCrowdFundingBean(projectId);
	}
	
	
	
	@Transactional
	@Override
	public List<PurchaseBean> getProjMemberByPurchase(Integer projectId){
		List<PurchaseBean> list = null;
		try {
			list = pcDao.getProjMemberByPurchase(projectId);
		} catch (SQLException e) {
			e.printStackTrace();System.out.println("SQL語法出問題");
		} 
		return list ;
	}
	
	@Transactional
	@Override
	public List<PurchaseBean> getMemberPurchaseById(Integer memberId){
		return pcDao.getPersonalPurchases(memberId);
	}

}
