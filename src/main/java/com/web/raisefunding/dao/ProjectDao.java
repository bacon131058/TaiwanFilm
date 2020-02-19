package com.web.raisefunding.dao;

import java.util.List;

import com.web.raisefunding.model.ProjectBean;


public interface ProjectDao {
public int createProject(ProjectBean projBean);
public int updateProject(ProjectBean projBean) ;
public ProjectBean getProject(Integer projectId);
}
