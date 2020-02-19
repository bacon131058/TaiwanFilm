package com.web.activity.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.web.activity.dao.ActivityDao;
import com.web.activity.model.activityBean;
import com.web.activity.model.activitySignUpBean;

@Repository
public class ActivityDaoImpl implements ActivityDao {
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	// 查詢全部活動（依照活動新舊來判斷)
	@Override
	@SuppressWarnings("unchecked")
	public List<activityBean> getAllActivities() {
		String hql = "FROM activityBean ORDER BY activityId desc";
		Session session = null;
		List<activityBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	// 查詢全部活動(由活動新到舊排序）
	@Override
	@SuppressWarnings("unchecked")
	public List<activityBean> getAllActivitiesExceptStatusEqualOne() {
		String hql = "FROM activityBean where status = 1 ORDER BY activityId desc";
		Session session = null;
		List<activityBean> activityList = new ArrayList<>();
		session = factory.getCurrentSession();
		activityList = session.createQuery(hql).getResultList();
		return activityList;
	}
		

	// 查詢全部活動（由活動點閱次數高低排序)
	@Override
	@SuppressWarnings("unchecked")
	public List<activityBean> getAllActivitiesExceptStatusEqualOneViews() {
		String hql = "FROM activityBean where status = 1 ORDER BY activityWatched desc";
		Session session = null;
		List<activityBean> activityListViews = new ArrayList<>();
		session = factory.getCurrentSession();
		activityListViews = session.createQuery(hql).getResultList();
		return activityListViews;
	}
	//查詢全部活動(由活動即將開始判斷)
	@Override
	@SuppressWarnings("unchecked")
	public List<activityBean> getAllActivitiesExceptStatusEqualOneStart() {
		String hql = "FROM activityBean where status = 1 ORDER BY startTime";
		Session session = null;
		List<activityBean> activityListStart = new ArrayList<>();
		session = factory.getCurrentSession();
		activityListStart = session.createQuery(hql).getResultList();
		return activityListStart;
	}

	 
	@Override
	@SuppressWarnings("unchecked")
	public List<activityBean> getAllActivitiesExceptStatusEqualOneEnd() {
		String hql = "FROM activityBean where status = 1 ORDER BY endTime desc";
		Session session = null;
		List<activityBean> activityListEnd = new ArrayList<>();
		session = factory.getCurrentSession();
		activityListEnd = session.createQuery(hql).getResultList();
		return activityListEnd;
	}	
	
	
	
	// insert活動
	@Override
	public void addActivity(activityBean activity) {
		Session session = factory.getCurrentSession();
		session.save(activity);

	}
	//查詢單筆活動
	@Override
	public activityBean getActivityById(int activityId) {
		Session session = factory.getCurrentSession();
		activityBean bb = session.get(activityBean.class, activityId);
		return bb;
	}

	@Override
	public void updateActivity(activityBean activity) {
		if (activity.getCoverImage() != null && activity.getStartTime() != null) {
			String hql = "UPDATE activityBean SET startTime=:newStartTime, endTime=:newEndTime, activityMainContent=:newActivityMainContent,coverImage=:newCoverImage , activityTitle=:newActivityTitle ,activityContent=:newActivityContent, category=:newCategory,status=:newStatus ,activityAuthor=:newActivityAuthor  WHERE activityId=:id";
			Session session = factory.getCurrentSession();
			session.createQuery(hql)
					.setParameter("newCoverImage", activity.getCoverImage())
					.setParameter("newActivityTitle", activity.getActivityTitle())
					.setParameter("newActivityMainContent", activity.getActivityMainContent())
					.setParameter("newActivityContent", activity.getActivityContent())
					.setParameter("newCategory", activity.getCategory())
					.setParameter("newStatus", activity.getStatus())
					.setParameter("newActivityAuthor", activity.getActivityAuthor())
					.setParameter("newStartTime", activity.getStartTime())
					.setParameter("newEndTime", activity.getEndTime())
					.setParameter("id", activity.getActivityId())
					.executeUpdate();
			
		} else if(activity.getStartTime() == null && activity.getCoverImage() != null){
			String hql = "UPDATE activityBean SET coverImage=:newCoverImage,activityMainContent=:newActivityMainContent,activityTitle=:newActivityTitle ,activityContent=:newActivityContent, category=:newCategory,status=:newStatus ,activityAuthor=:newActivityAuthor  WHERE activityId=:id";
			Session session = factory.getCurrentSession();
			session.createQuery(hql)
					.setParameter("newCoverImage", activity.getCoverImage())
					.setParameter("newActivityTitle", activity.getActivityTitle())
					.setParameter("newActivityContent", activity.getActivityContent())
					.setParameter("newActivityMainContent", activity.getActivityMainContent())
					.setParameter("newCategory", activity.getCategory())
					.setParameter("newStatus", activity.getStatus())
					.setParameter("newActivityAuthor", activity.getActivityAuthor())
					
					
					.setParameter("id", activity.getActivityId()).executeUpdate();

		}else if(activity.getStartTime() != null && activity.getCoverImage() == null) {
			String hql = "UPDATE activityBean SET startTime=:newStartTime, endTime=:newEndTime,activityMainContent=:newActivityMainContent,activityTitle=:newActivityTitle ,activityContent=:newActivityContent, category=:newCategory,status=:newStatus ,activityAuthor=:newActivityAuthor  WHERE activityId=:id";
			Session session = factory.getCurrentSession();
			session.createQuery(hql)
					.setParameter("newActivityTitle", activity.getActivityTitle())
					.setParameter("newActivityContent", activity.getActivityContent())
					.setParameter("newActivityMainContent", activity.getActivityMainContent())
					.setParameter("newCategory", activity.getCategory())
					.setParameter("newStatus", activity.getStatus())
					.setParameter("newActivityAuthor", activity.getActivityAuthor())
					.setParameter("newStartTime", activity.getStartTime())
					.setParameter("newEndTime", activity.getEndTime())
					
					.setParameter("id", activity.getActivityId()).executeUpdate();
			
		}
		else {
			String hql = "UPDATE activityBean SET activityMainContent=:newActivityMainContent,activityTitle=:newActivityTitle ,activityContent=:newActivityContent, category=:newCategory,status=:newStatus ,activityAuthor=:newActivityAuthor  WHERE activityId=:id";
			Session session = factory.getCurrentSession();
			session.createQuery(hql)
					.setParameter("newActivityTitle", activity.getActivityTitle())
					.setParameter("newActivityContent", activity.getActivityContent())
					.setParameter("newActivityMainContent", activity.getActivityMainContent())
					.setParameter("newCategory", activity.getCategory())
					.setParameter("newStatus", activity.getStatus())
					.setParameter("newActivityAuthor", activity.getActivityAuthor())
					
					.setParameter("id", activity.getActivityId()).executeUpdate();
			
		}
	}

	// 點擊率更新
//	,coverImage=:newCoverImage , ,activityTitle=:newActivityTitle ,activityContent=:newActivityContent, category=:newCategory,status=:newStatus ,activityAuthor=:newActivityAuthor 
	@Transactional
	@Override
	public void updateViews(activityBean activity,Integer getwatch) {
			String hql = "UPDATE activityBean SET activityWatched=:newActivityWatched WHERE activityId=:id";
			Session session = factory.getCurrentSession();
			session.createQuery(hql)
					.setParameter("newActivityWatched", getwatch)
					.setParameter("id", activity.getActivityId())
					
					.executeUpdate();
		} 


	

	@Override
	public List<String> getAllCategories() {
		String hql = "SELECT DISTINCT b.category FROM activityBean b";
		Session session = factory.getCurrentSession();
		List<String> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public List<activityBean> getActivityByCategory(String category) {
		String hql = "FROM activityBean bb WHERE bb.category = :category";
		List<activityBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("category", category).getResultList();
		return list;
	}



	// 報名活動
	@Override
	public void addActivitySignUp(activitySignUpBean activitySignUp) {
			Session session = factory.getCurrentSession();
		
				session.save(activitySignUp);
	
		
	}
	

}
