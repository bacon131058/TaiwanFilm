package com.web.raisefunding.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
@Entity
public class ProjectInfoBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name="projInfoId")
private Integer projInfoId;
private String projectTittle;
@Column(columnDefinition="TEXT")
private String innerText;
private Integer photoCount;
private String imgName01;
private Blob image01;
private String imgName02;
private Blob image02;
private String imgName03;
private Blob image03;
@OneToOne(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
@JoinColumn(name="projectId", referencedColumnName="projectId")
private ProjectBean projBean;



public Integer getProjInfoId() {
	return projInfoId;
}
public void setProjInfoId(Integer projInfoId) {
	this.projInfoId = projInfoId;
}
public ProjectBean getProjBean() {
	return projBean;
}
public void setProjBean(ProjectBean projBean) {
	this.projBean = projBean;
}
public String getProjectTittle() {
	return projectTittle;
}
public void setProjectTittle(String projectTittle) {
	this.projectTittle = projectTittle;
}
public String getInnerText() {
	return innerText;
}
public void setInnerText(String innerText) {
	this.innerText = innerText;
}
public String getImgName01() {
	return imgName01;
}
public void setImgName01(String imgName01) {
	this.imgName01 = imgName01;
}
public Blob getImage01() {
	return image01;
}
public void setImage01(Blob image01) {
	this.image01 = image01;
}
public String getImgName02() {
	return imgName02;
}
public void setImgName02(String imgName02) {
	this.imgName02 = imgName02;
}
public Blob getImage02() {
	return image02;
}
public void setImage02(Blob image02) {
	this.image02 = image02;
}
public String getImgName03() {
	return imgName03;
}
public void setImgName03(String imgName03) {
	this.imgName03 = imgName03;
}
public Blob getImage03() {
	return image03;
}
public void setImage03(Blob image03) {
	this.image03 = image03;
}
public String getImgName04() {
	return imgName04;
}
public void setImgName04(String imgName04) {
	this.imgName04 = imgName04;
}
public Blob getImage04() {
	return image04;
}
public void setImage04(Blob image04) {
	this.image04 = image04;
}
public Integer getPhotoCount() {
	return photoCount;
}
public void setPhotoCount(Integer photoCount) {
	this.photoCount = photoCount;
}
private String imgName04;
private Blob image04;
}
