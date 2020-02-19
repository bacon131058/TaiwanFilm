package com.web.raisefunding.dao;

import java.util.List;

import com.web.raisefunding.model.ProjectInfoBean;

public interface ProjectInfoDao  {
	public int createProjInfo(ProjectInfoBean infoBean);
	public int updateProjInfo(ProjectInfoBean infoBean) ;
	public boolean checkProjectInfo(Integer projectId);
	public ProjectInfoBean getProjectInfo(Integer projectId);

}
