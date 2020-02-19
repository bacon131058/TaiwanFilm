package com.web.raisefunding.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import com.google.gson.annotations.Expose;


@Entity
public class ProjectBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name="projectId")
@Expose
private Integer projectId;
private String projectName;
@Column(length=500)
private String projDescript;
@Column(columnDefinition="TEXT")
private String projStory;
private String photoFileName;
private Blob photo;
private String photoFileName2;
private Blob photo2;
private String videoLink;
@OneToOne(cascade=CascadeType.ALL,mappedBy="projBean")
private CrowdFundingBean cfBean;



public ProjectBean() {}
public ProjectBean(String projectName,String projDescript,String projStory,String videoLink) {
	this.projectName = projectName;
	this.projDescript = projDescript;
	this.videoLink = videoLink;
	this.projStory = projStory;
	
}



public CrowdFundingBean getCfBean() {
	return cfBean;
}
public void setCfBean(CrowdFundingBean cfBean) {
	this.cfBean = cfBean;
}
public Integer getProjectId() {
	return projectId;
}
public void setProjectId(Integer projectId) {
	this.projectId = projectId;
}
public String getProjectName() {
	return projectName;
}
public void setProjectName(String projectName) {
	this.projectName = projectName;
}
public String getProjDescript() {
	return projDescript;
}
public void setProjDescript(String projDescript) {
	this.projDescript = projDescript;
}
public Blob getPhoto() {
	return photo;
}
public void setPhoto(Blob photo) {
	this.photo = photo;
}
public String getVideoLink() {
	return videoLink;
}
public void setVideoLink(String videoLink) {
	this.videoLink = videoLink;
}
public String getPhotoFileName() {
	return photoFileName;
}
public void setPhotoFileName(String photoFileName) {
	this.photoFileName = photoFileName;
}

public String getProjStory() {
	return projStory;
}
public void setProjStory(String projStory) {
	this.projStory = projStory;
}
public String getPhotoFileName2() {
	return photoFileName2;
}
public void setPhotoFileName2(String photoFileName2) {
	this.photoFileName2 = photoFileName2;
}
public Blob getPhoto2() {
	return photo2;
}
public void setPhoto2(Blob photo2) {
	this.photo2 = photo2;
}

}
