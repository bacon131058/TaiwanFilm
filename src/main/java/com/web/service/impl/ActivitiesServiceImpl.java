package com.web.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.ActivityDao;
import com.web.model.activity.activityBean;
import com.web.model.activity.activitySignUpBean;
import com.web.service.ActivityService;


 
@Service
public class ActivitiesServiceImpl implements ActivityService {
	ActivityDao dao;
    
	@Autowired
	public void setDao(ActivityDao dao) {
		this.dao = dao;
	}
    //查詢所有商品
    @Transactional
	@Override
	public List<activityBean>  getAllActivities(){
		return dao.getAllActivities();
	}
	
	//新增活動
	@Transactional
    @Override   
	public void addActivity(activityBean activity) {
		dao.addActivity(activity);
		
	}

	//查單筆
	@Transactional
	@Override
	public activityBean getActivityById(int activityId) {
		return dao.getActivityById(activityId);
	}
    
	//update活動
	@Transactional
    @Override
	public activityBean updateActivityById(int activityId) {
		return dao.getActivityById(activityId);
	}
	
	
	
	
	
	//修改
		@Transactional
		@Override
		public List<String> getAllCategories() {
			return dao.getAllCategories();
		}
		@Transactional
		@Override
		public List<activityBean> getActivityByCategory(String category) {
			return dao.getActivityByCategory(category);
		}
		
		@Transactional
		@Override
		public void updateActivity(activityBean activity) {
			dao.updateActivity(activity);
		}
		@Transactional
		@Override
		public List<activityBean> getAllActivitiesExceptStatusEqualOne() {
			
			return dao.getAllActivitiesExceptStatusEqualOne();
		}
		
		
		@Transactional
		@Override
		public List<activityBean> getAllActivitiesExceptStatusEqualOneViews() {
			return dao.getAllActivitiesExceptStatusEqualOneViews();
		}
		//觀看次數
		@Transactional
		@Override
		public void updateViews(activityBean activity,Integer getwatch) {
			dao.updateViews(activity,getwatch);
			
		}
		//活動最新開始
		@Transactional
		@Override
		public List<activityBean> getAllActivitiesExceptStatusEqualOneStart() {
			return dao.getAllActivitiesExceptStatusEqualOneStart();
		}
		//活動即將結束的
		@Transactional
		@Override
		public List<activityBean> getAllActivitiesExceptStatusEqualOneEnd() {
			return dao.getAllActivitiesExceptStatusEqualOneEnd();
		}
		
		//報名活動
		@Transactional
		@Override
		public void addActivitySignUp(activitySignUpBean activitySignUp) {
			 dao.addActivitySignUp(activitySignUp);
			
		}
	
		
		
		
		
		
		

		
	
	
	


	
	


}