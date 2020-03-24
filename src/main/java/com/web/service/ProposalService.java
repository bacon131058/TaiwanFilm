package com.web.service;

import java.util.List;

import com.web.model.raisefunding.CrowdFundingBean;
import com.web.model.raisefunding.DonatePlanBean;
import com.web.model.raisefunding.ProjectBean;
import com.web.model.raisefunding.ProjectInfoBean;

public interface ProposalService {
	public int createProjectAndPlan( CrowdFundingBean cfBean, ProjectBean projBean );
	public int updateProjectAndPlan( CrowdFundingBean cfBean, ProjectBean projBean);
	public int updatePlan(DonatePlanBean dpBean , CrowdFundingBean cfBean, ProjectBean projBean);
	public ProjectBean GetProjBean(Integer id);
	public List<CrowdFundingBean> getAllProjectAndFunding();
	public CrowdFundingBean getCrowdFundingBean(Integer projectId);
	DonatePlanBean GetDonatePlanBean(Integer id);
	List<DonatePlanBean> getAllDonatePlanBean(Integer projectId);
	public int createProjInfo(ProjectInfoBean infoBean);
	public int updateProjInfo(ProjectInfoBean infoBean) ;
	public int createDonatePlan(DonatePlanBean dpBean);
	public DonatePlanBean getSinglePlan(Integer projectId , Integer dpId) ;
	public boolean checkProjectInfo(Integer projectId);
	public void updateDonatePlan(DonatePlanBean dpBean);
	public ProjectInfoBean getProjectInfo(Integer projectId);
	public void delDonatePlan(Integer projectId , Integer dpId);
}
