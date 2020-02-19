package com.web.raisefunding.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;




@Entity
@Table(name="donatePlan")
public class DonatePlanBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="planId")
	@Expose
	private Integer planId;
	@Expose
	private Integer donateMoney;
	@Expose
	@Column(length=500)
	private String donateDescription;
	@Expose
	private String pictureFileName;
	@Expose
	private Blob picture;
	@Expose
	private String shipping;
	@Expose
	private String dliverDate;
	@Expose
	private Integer limitNum;
	@Expose
	private Integer online;
	@Expose
	@OneToOne(cascade=CascadeType.ALL)
    @JoinColumn(name="projectId", referencedColumnName="projectId")
	private ProjectBean projBean;

	public ProjectBean getProjBean() {
		return projBean;
	}

	public void setProjBean(ProjectBean projBean) {
		this.projBean = projBean;
	}

	public DonatePlanBean() {}
	
	public DonatePlanBean(Integer donateMoney,String donateDescription,String shipping,String dliverDate,Integer limitNum) {
		this.donateMoney = donateMoney;
		this.donateDescription = donateDescription;
		this.shipping = shipping;
		this.dliverDate = dliverDate;
		this.limitNum = limitNum;
	}
	
	
	public Integer getPlanId() {
		return planId;
	}
	public void setPlanId(Integer planId) {
		this.planId = planId;
	}
	public Integer getDonateMoney() {
		return donateMoney;
	}
	public void setDonateMoney(Integer donateMoney) {
		this.donateMoney = donateMoney;
	}
	public String getDonateDescription() {
		return donateDescription;
	}
	public void setDonateDescription(String description) {
		this.donateDescription = description;
	}
	public Blob getPicture() {
		return picture;
	}
	public void setPicture(Blob picture) {
		this.picture = picture;
	}
	
	public Integer getOnline() {
		return online;
	}

	public void setOnline(Integer online) {
		this.online = online;
	}

	public String getShipping() {
		return shipping;
	}
	public void setShipping(String shipping) {
		this.shipping = shipping;
	}
	public String getDliverDate() {
		return dliverDate;
	}
	public void setDliverDate(String dliverDate) {
		this.dliverDate = dliverDate;
	}
	public Integer getLimitNum() {
		return limitNum;
	}
	public void setLimitNum(Integer limitNum) {
		this.limitNum = limitNum;
	}

	public String getPictureFileName() {
		return pictureFileName;
	}

	public void setPictureFileName(String pictureFileName) {
		this.pictureFileName = pictureFileName;
	}

	
	
	
}
