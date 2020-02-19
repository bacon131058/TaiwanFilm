package com.web.raisefunding.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.raisefunding.model.CrowdFundingBean;
import com.web.raisefunding.model.PurchaseBean;
@Repository
public class CrowdFundingDaoImp implements CrowdFundingDao {
	SessionFactory factory;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.factory = sessionFactory;
	}

	@Override
	public int createNewCrowdFunding(CrowdFundingBean cfBean) {
	Session session = factory.getCurrentSession();
	int n = 0;
	session.save(cfBean);
	n++;
		return n;
	}

	@Override
	public int updateFund(CrowdFundingBean cfBean) {
	Session session = factory.getCurrentSession();
	int n = 0;
	session.update(cfBean);
		return n;
	}

	@Override
	public CrowdFundingBean getCrowdFundingBean(Integer projectId) { 
		CrowdFundingBean cfBean = new CrowdFundingBean();
		String hql = "From CrowdFundingBean where projectId = :projId";
				Session session = factory.getCurrentSession();
		try {
			cfBean = (CrowdFundingBean) session.createQuery(hql).setParameter("projId",projectId)
									  .getSingleResult();
		} catch (Exception e) {
			System.out.println("there is no cfBean");
		}
		return cfBean;
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CrowdFundingBean> getAllFunding() {
		Session session = factory.getCurrentSession();
		String hql = "From CrowdFundingBean";
		List<CrowdFundingBean> list= session.createQuery(hql).getResultList();
		
			for(CrowdFundingBean cfBean:list) {
				if(cfBean.getFundsGoal()!= null) {
				double num = (double)cfBean.getFundsNow()/cfBean.getFundsGoal();
				System.out.println(num);
				cfBean.setPercent((int)Math.round(num*100));
				System.out.println("-----------test--------:"+cfBean.getPercent());
				}
			}
			return list;
	}
	
	@Override
	public List<CrowdFundingBean> getAllFundingById() {
		Session session = factory.getCurrentSession();
		String hql = "From CrowdFundingBean order by actionId desc";
		List<CrowdFundingBean> list= session.createQuery(hql).getResultList();
		
			for(CrowdFundingBean cfBean:list) {
				if(cfBean.getFundsGoal()!= null) {
				double num = (double)cfBean.getFundsNow()/cfBean.getFundsGoal();
				cfBean.setPercent((int)Math.round(num*100));
				}
			}
			return list;
	}
	
	
	@Override
	public List<CrowdFundingBean> getAllFundingByDate() {
		Session session = factory.getCurrentSession();
		String hql = "From CrowdFundingBean where ";
		List<CrowdFundingBean> list= session.createQuery(hql).getResultList();
		
			for(CrowdFundingBean cfBean:list) {
				if(cfBean.getFundsGoal()!= null) {
				double num = (double)cfBean.getFundsNow()/cfBean.getFundsGoal();
				System.out.println(num);
				cfBean.setPercent((int)Math.round(num*100));
				System.out.println("-----------test--------:"+cfBean.getPercent());
				}
			}
			return list;
	}
	
	
	
	
	
	@Override
	public void addNewBacker(PurchaseBean pcBean) {
		String hql = "From CrowdFundingBean where projectId = :projectId";
		Session session = factory.getCurrentSession();
		CrowdFundingBean cfBean = (CrowdFundingBean) session.createQuery(hql).setParameter("projectId", pcBean.getProjBean().getProjectId())    
								.getSingleResult();
		cfBean.setBackerNum(cfBean.getBackerNum()+1);
	}

	@Override
	public void addDonateToFund(PurchaseBean pcBean) {
		String hql = "From CrowdFundingBean where projectId = :projectId";
		Session session = factory.getCurrentSession();
		CrowdFundingBean cfBean = (CrowdFundingBean) session.createQuery(hql).setParameter("projectId", pcBean.getProjBean().getProjectId()) 
								.getSingleResult();
		int total = cfBean.getFundsNow()+pcBean.getDpBean().getDonateMoney();
		cfBean.setFundsNow(total);
	}
}
