package com.web.dao.impl;

import java.io.Serializable;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.ProjectInfoDao;
import com.web.model.raisefunding.ProjectInfoBean;
@Repository 
public class ProjectInfoDaoImp implements Serializable, ProjectInfoDao {

	private static final long serialVersionUID = 1L;
	@Autowired
	SessionFactory factory;
	

	@Override
	public int createProjInfo(ProjectInfoBean infoBean) {
		int n =0;
		Session session = factory.getCurrentSession();
		session.save(infoBean);
		n++;
		return n;
	}

	@Override
	public int updateProjInfo(ProjectInfoBean infoBean) {
		int n =0;
		Session session = factory.getCurrentSession();
		String hqlget = "from ProjectInfoBean where projectId = :projId ";
		ProjectInfoBean infoOldBean = (ProjectInfoBean) session.createQuery(hqlget).setParameter("projId", infoBean.getProjBean().getProjectId())
										  .getSingleResult();
		infoOldBean.setImage01(infoBean.getImage01());infoOldBean.setImgName01(infoBean.getImgName01());
		infoOldBean.setImage02(infoBean.getImage02());infoOldBean.setImgName02(infoBean.getImgName02());
		infoOldBean.setImage03(infoBean.getImage03());infoOldBean.setImgName03(infoBean.getImgName03());
		infoOldBean.setImage04(infoBean.getImage04());infoOldBean.setImgName04(infoBean.getImgName04());
		infoOldBean.setInnerText(infoBean.getInnerText());infoOldBean.setPhotoCount(infoBean.getPhotoCount());
		infoOldBean.setProjectTittle(infoBean.getProjectTittle());
		session.update(infoOldBean);
		n++;
		return n;
	}

	@Override
	public boolean checkProjectInfo(Integer projectId) {
		boolean check = false;
		ProjectInfoBean infoBean = new ProjectInfoBean();
		Session session = factory.getCurrentSession();
		String hql = "from ProjectInfoBean where projectId = :projId";
		try {
			 infoBean = (ProjectInfoBean) session.createQuery(hql).setParameter("projId", projectId)
					   .getSingleResult();
			 check = true;
		} catch (NoResultException e) {
		e.printStackTrace(); System.out.println("these is no projectInfo");
		}catch (Exception e2) {
			System.out.println("another exception");
		}
		return check;
	}
	
	@Override
	public ProjectInfoBean getProjectInfo(Integer projectId) {
		ProjectInfoBean infoBean = new ProjectInfoBean();
		Session session = factory.getCurrentSession();
		String hql = "from ProjectInfoBean where projectId = :projId";
		try {
			 infoBean = (ProjectInfoBean) session.createQuery(hql).setParameter("projId", projectId)
					   .getSingleResult();
		}catch (Exception e) {
			System.out.println("another exception");
		}
		return infoBean;
	}

}
