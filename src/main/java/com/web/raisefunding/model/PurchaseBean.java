package com.web.raisefunding.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.web.login.Model.MembersBean;
@Entity
@Table(name="Purchase")
public class PurchaseBean implements Serializable {
	private static final long serialVersionUID = 1L;
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name="actionId")
private Integer purchaseId;
private String buyerName;
private String buyerLocation;
private String postNumber;
private String adress;
private String phone;
private String email;
private String note;
private Integer payAmount;
private Boolean incognito;
private String orderDate;
@OneToOne(cascade=CascadeType.ALL)
@JoinColumn(name="planId", referencedColumnName="planId")
private DonatePlanBean dpBean;
@OneToOne(cascade=CascadeType.ALL)
@JoinColumn(name="memberId", referencedColumnName="memberId")
private MembersBean mbBean;
@OneToOne(cascade=CascadeType.ALL)
@JoinColumn(name="projectId", referencedColumnName="projectId")
private ProjectBean projBean;


public MembersBean getMbBean() {
	return mbBean;
}
public void setMbBean(MembersBean mbBean) {
	this.mbBean = mbBean;
}
public ProjectBean getProjBean() {
	return projBean;
}
public void setProjBean(ProjectBean projBean) {
	this.projBean = projBean;
}
public String getOrderDate() {
	return orderDate;
}
public void setOrderDate(String orderDate) {
	this.orderDate = orderDate;
}
public Integer getPurchaseId() {
	return purchaseId;
}
public void setPurchaseId(Integer purchaseId) {
	this.purchaseId = purchaseId;
}
public String getBuyerName() {
	return buyerName;
}
public void setBuyerName(String buyerName) {
	this.buyerName = buyerName;
}
public String getBuyerLocation() {
	return buyerLocation;
}
public void setBuyerLocation(String buyerLocation) {
	this.buyerLocation = buyerLocation;
}
public String getPostNumber() {
	return postNumber;
}
public void setPostNumber(String postNumber) {
	this.postNumber = postNumber;
}
public String getAdress() {
	return adress;
}
public void setAdress(String adress) {
	this.adress = adress;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getNote() {
	return note;
}
public void setNote(String note) {
	this.note = note;
}
	public Integer getPayAmount() {
	return payAmount;
}
public void setPayAmount(Integer payAmount) {
	this.payAmount = payAmount;
}
public Boolean getIncognito() {
	return incognito;
}
public void setIncognito(Boolean incognito) {
	this.incognito = incognito;
}
public DonatePlanBean getDpBean() {
	return dpBean;
}
public void setDpBean(DonatePlanBean dpBean) {
	this.dpBean = dpBean;
}
public static long getSerialversionuid() {
	return serialVersionUID;
}




}
