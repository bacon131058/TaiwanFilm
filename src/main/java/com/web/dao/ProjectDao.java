package com.web.dao;

import java.util.List;

import com.web.model.raisefunding.ProjectBean;


public interface ProjectDao {
public int createProject(ProjectBean projBean);
public int updateProject(ProjectBean projBean) ;
public ProjectBean getProject(Integer projectId);
}
