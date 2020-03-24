package com.web.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.PurchaseBeanDao;
import com.web.model.raisefunding.CrowdFundingBean;
import com.web.model.raisefunding.PurchaseBean;
@Repository
public class PurchaseBeanDaoImp implements PurchaseBeanDao {
	private static final long serialVersionUID = 1L;
	SessionFactory factory;
	
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	@Override
	public int createPurchaseData(PurchaseBean pcBean) {
		int n = 0 ;
		Session session = factory.getCurrentSession();
		session.save(pcBean);
		n++;
		return n;
	}
	

	@Override
	public PurchaseBean getPurchase(Integer purchaseId) {
		Session session = factory.getCurrentSession();
		PurchaseBean pcBean = session.get(PurchaseBean.class, purchaseId);
		return pcBean;
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PurchaseBean> getProjMemberByPurchase(Integer projectId) throws SQLException {
		String hql = "select distinct p.mbBean.memberId ,p.mbBean.memberName from PurchaseBean p  where p.projBean.projectId = :pjId";
		Session session = factory.getCurrentSession();
		List<PurchaseBean> list = session.createQuery(hql).setParameter("pjId", projectId).getResultList();
		return list;
	}

	@Override
	public List<PurchaseBean> getAllPurchases() {
		
		return null;
	}

	@Override
	public List<PurchaseBean> getPurchases(Integer planId) {
		Session session = factory.getCurrentSession();
		String hql = "From PurchaseBean where planId = :id";
		List<PurchaseBean> list = session.createQuery(hql)
		.setParameter("id", planId)
		.getResultList();
		return list;
	}

	@Override
	public List<PurchaseBean> getPersonalPurchases(Integer memberId) {
		Session session = factory.getCurrentSession();
		String hql = "From PurchaseBean where memberId = :id";
		List<PurchaseBean> pcBeans = session.createQuery(hql)
		.setParameter("id", memberId)
		.getResultList();
		for(PurchaseBean pcBean:pcBeans) {
			CrowdFundingBean cfBean = pcBean.getProjBean().getCfBean();
		if(cfBean.getFundsGoal()!= null) {
			double num = (double)cfBean.getFundsNow()/cfBean.getFundsGoal();
			System.out.println(num);
			cfBean.setPercent((int)Math.round(num*100));
			System.out.println("-----------test--------:"+cfBean.getPercent());
			}
		}
		return pcBeans;
	}
	//檢查會員是不是有買過: 是回傳true
	@Override
	public boolean checkProjectMember(PurchaseBean psBean) {
		String hql = "From PurchaseBean  where memberId = :mbId and projectId = :pjId";
		Session session = factory.getCurrentSession();
		List<PurchaseBean> list = session.createQuery(hql).setParameter("mbId", psBean.getMbBean().getMemberId())
								.setParameter("pjId", psBean.getProjBean().getProjectId())
								.getResultList();
		if(list.size()<2) {
			return false;
		}else
		return true;
	}

	public List<PurchaseBean> getProjectMember(Integer projectId) {
		String hql = "From PurchaseBean where projectId = :id";
		Session session = factory.getCurrentSession();
		List<PurchaseBean> list = session.createQuery(hql).setParameter("id", projectId)
								.getResultList();
		return list;
	}

}
