package com.web.login.Model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="members")
public class MembersBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer memberId;
	private String email;
	private String password;
	@Transient
	private String password1;
	private String memberName;
	private String gender;
	private String birthDay;
	private String fileName;	
	private Blob memberImage;

	private String memberMode;
	
	@Transient
	private MultipartFile	memImage;  	
	public MultipartFile getmemImage() {
		return memImage;
	}

	public void setmemImage(MultipartFile productImage) {
		this.memImage = productImage;
	}
	public MembersBean() {}
//	public MembersBean(String string, String string2, String string3, java.util.Date date) {}
	public MembersBean(String memberName,String email,String gender,String  birthDay) {
		this.memberName =memberName;
		this.email = email;
		this.gender = gender;
		this.birthDay = birthDay;
	}
	public MembersBean(String email,String password) {
		this.email = email ; 
		this.password = password;
	}
	


	public Integer getMemberId() {return memberId;}
	public String getMemberName() {return memberName;}
	public String getPassword() {return password;}
	public String getPassword1() {return password1;}
	public String getEmail() {return email;}
	public String getGender() {return gender;}
	public String getBirthDay() {return birthDay;}
	public String getFileName() {return fileName;}
	public String getMemberMode() {return memberMode;}
	public Blob getMemberImage() {return memberImage;}
	public void setMemberId(Integer memberId) {this.memberId = memberId;}
	public void setMemberName(String memberName) {this.memberName = memberName;}
	public void setPassword(String password) {this.password = password;}
	public void setPassword1(String password1) {this.password1 = password1;}
	public void setEmail(String email) {this.email = email;}
	public void setGender(String gender) {this.gender = gender;}
	public void setBirthDay(String birthDay) {this.birthDay = birthDay;}
	public void setFileName(String fileName) {this.fileName = fileName;}
	public void setMemberImage(Blob memberImage) {this.memberImage = memberImage;}
	public void setMemberMode(String memberMode) {this.memberMode = memberMode;}
}
