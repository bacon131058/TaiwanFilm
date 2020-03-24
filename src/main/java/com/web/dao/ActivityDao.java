package com.web.dao;

import java.util.List;

import com.web.model.activity.activityBean;
import com.web.model.activity.activitySignUpBean;

public interface ActivityDao {
	

	List<activityBean>  getAllActivities(); //查詢全部活動
	
	List<activityBean>  getAllActivitiesExceptStatusEqualOne();	//狀態0不顯示
	List<activityBean>  getAllActivitiesExceptStatusEqualOneViews(); //觀看次數排序
	List<activityBean>  getAllActivitiesExceptStatusEqualOneStart(); //由活動即將開始排序
	List<activityBean>  getAllActivitiesExceptStatusEqualOneEnd();//由活動即將開始判斷
	
	
	
	public activityBean getActivityById(int activityId); //查詢單筆活動
	
	void addActivity(activityBean activity);	//新增活動

	
	
	List<String> getAllCategories();  //用類別查資料
	
	List<activityBean> getActivityByCategory(String category);  //用類別查資料
	
	
	void updateActivity(activityBean activity); ///更新活動
	
	void updateViews(activityBean activity,Integer getwatch);	//觀看次數不斷更新
	
	//報名活動
	void addActivitySignUp(activitySignUpBean activitySignUp);
}
