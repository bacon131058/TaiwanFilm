package com.web.model.activity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="activitySignUp")
public class activitySignUpBean implements Serializable{

	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer activityMemberId;
	private Integer activityId;
	private String activityMemberNumber;
	private String activityMemberName;
	private String activityMemberAddress;
	private String activityMemberSignUpTime;
	
	
	
	
	public activitySignUpBean(Integer activityMemberId,Integer activityId,
			String activityMemberNumber,String activityMemberName,String activityMemberAddress
			,String activityMemberSignUpTime) {
		this.activityMemberId = activityMemberId;
		this.activityId = activityId;
		this.activityMemberNumber = activityMemberNumber;
		this.activityMemberName = activityMemberName;
		this.activityMemberAddress = activityMemberAddress;
		this.activityMemberSignUpTime = activityMemberSignUpTime;
	}

	public activitySignUpBean() {		
	}

	
	
	
	
	public String getActivityMemberSignUpTime() {
		return activityMemberSignUpTime;
	}

	public void setActivityMemberSignUpTime(String activityMemberSignUpTime) {
		this.activityMemberSignUpTime = activityMemberSignUpTime;
	}

	public String getActivityMemberAddress() {
		return activityMemberAddress;
	}

	public void setActivityMemberAddress(String activityMemberAddress) {
		this.activityMemberAddress = activityMemberAddress;
	}

	public Integer getActivityMemberId() {
		return activityMemberId;
	}




	public void setActivityMemberId(Integer activityMemberId) {
		this.activityMemberId = activityMemberId;
	}




	public Integer getActivityId() {
		return activityId;
	}




	public void setActivityId(Integer activityId) {
		this.activityId = activityId;
	}




	public String getActivityMemberNumber() {
		return activityMemberNumber;
	}




	public void setActivityMemberNumber(String activityMemberNumber) {
		this.activityMemberNumber = activityMemberNumber;
	}




	public String getActivityMemberName() {
		return activityMemberName;
	}




	public void setActivityMemberName(String activityMemberName) {
		this.activityMemberName = activityMemberName;
	}


	
	
	
	
	
	
	
	
	
	
}
