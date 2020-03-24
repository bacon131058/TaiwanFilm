package com.web.dao;


import java.util.List;

import com.web.model.raisefunding.DonatePlanBean;

public interface DonatePlanDao {
	public int createNewPlan(DonatePlanBean dpBean);

	public int updatePlan(DonatePlanBean dpBean);

	public DonatePlanBean getPlan(Integer planId);
	
	public DonatePlanBean getSinglePlan(Integer projectId , Integer dpId) ;
	
	public List<DonatePlanBean>getAllPlan(Integer projectId);
	
	public void donatingOnce(Integer planId);
	
	public void delDonatePlan(DonatePlanBean dpBean);
}
