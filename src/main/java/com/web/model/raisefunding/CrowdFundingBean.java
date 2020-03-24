package com.web.model.raisefunding;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="crowdfunding")
public class CrowdFundingBean implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="actionId")
	private Integer actionId;
	private String dateBegin;
	private String 	dateEnd;
	private Integer fundsNow;
	private Integer fundsGoal;
	@Transient
	private int percent;
	
	private Integer backerNum;
	@OneToOne(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
    @JoinColumn(name="projectId", referencedColumnName="projectId")
	private ProjectBean projBean;

	public ProjectBean getProjBean() {
		return projBean;
	}

	public void setProjBean(ProjectBean projBean) {
		this.projBean = projBean;
	}
	
	public Integer getActionId() {
		return actionId;
	}
	public void setActionId(Integer actionId) {
		this.actionId = actionId;
	}
	public String getDateBegin() {
		return dateBegin;
	}
	public void setDateBegin(String dateBegin) {
		this.dateBegin = dateBegin;
	}
	public String getDateEnd() {
		return dateEnd;
	}
	public void setDateEnd(String dateEnd) {
		this.dateEnd = dateEnd;
	}
	public Integer getFundsNow() {
		return fundsNow;
	}
	public void setFundsNow(Integer fundsNow) {
		this.fundsNow = fundsNow;
	}
	public Integer getFundsGoal() {
		return fundsGoal;
	}
	public void setFundsGoal(Integer fundsGoal) {
		this.fundsGoal = fundsGoal;
	}
	public Integer getBackerNum() {
		return backerNum;
	}
	public void setBackerNum(Integer backerNum) {
		this.backerNum = backerNum;
	}
	public int getPercent() {
		return percent;
	}

	public void setPercent(int percent) {
		this.percent = percent;
	}
	
}
