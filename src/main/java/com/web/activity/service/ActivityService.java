package com.web.activity.service;

import java.util.List;


import com.web.activity.model.activityBean;
import com.web.activity.model.activitySignUpBean;

public interface ActivityService {
	List<activityBean>  getAllActivities(); 	//查詢多筆活動
	
	List<activityBean>  getAllActivitiesExceptStatusEqualOne();//由活動新到舊排序
	List<activityBean>  getAllActivitiesExceptStatusEqualOneViews();//由活動觀看次數排序
	List<activityBean>  getAllActivitiesExceptStatusEqualOneStart();//由活動即將開始判斷
	List<activityBean>  getAllActivitiesExceptStatusEqualOneEnd();//由活動即將開始判斷
	
	public activityBean getActivityById(int activityId); //查詢單筆活動
	
	void addActivity(activityBean activity);	//insert活動
 
	public activityBean updateActivityById(int activityId); //update活動(先用id)
	
	
	
	List<String> getAllCategories();	//用類別查資料
	
	List<activityBean> getActivityByCategory(String category); //用類別查資料

	void updateActivity(activityBean activity);	//update活動

	
	void updateViews(activityBean activity,Integer getwatch);  ///觀看次數不斷更新
		
	//報名活動
	void addActivitySignUp(activitySignUpBean activitySignUp);
	
}
