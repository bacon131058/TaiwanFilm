package com.web.model.message;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.web.model.member.MembersBean;


@Entity
@Table(name = "Replys")
public class ReplyBean implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	 private Integer replyId;
//	 private Integer memberId;
	 private Integer messageId;
	 private String replyContent;
	 private String replyDate;
	 private Integer replyDelete;
	 private Integer replyReport;
	

public Integer getReplyReport() {
		return replyReport;
	}
	public void setReplyReport(Integer replyReport) {
		this.replyReport = replyReport;
	}
public Integer getReplyDelete() {
		return replyDelete;
	}
	public void setReplyDelete(Integer replyDelete) {
		this.replyDelete = replyDelete;
	}
	//	@ManyToOne(cascade = CascadeType.ALL,fetch=FetchType.EAGER)
//	@JoinColumn(name="messageId", referencedColumnName="messageId")
//	private MessageBean messageBean ;
//	public MessageBean getMessageBean() {
//		return messageBean;
//	}
//	public void setMessageBean(MessageBean messageBean) {
//		this.messageBean = messageBean;
//	}
	@ManyToOne(cascade = CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="memberId" ,referencedColumnName="memberId")
	private MembersBean memberBean;
	
	public MembersBean getMembersBean() {
		return memberBean;
	}
	public void setMembersBean(MembersBean memberBean) {
		this.memberBean = memberBean;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	public ReplyBean(Integer replyId, Integer messageId, Integer memberId, 
			String replyContent ,MessageBean messageBean,String replyDate,Integer replyDelete,Integer replyReport) {
		this.messageId = messageId;
//		this.memberId=memberId;
		this.replyId=replyId;
		this.replyContent=replyContent;
		this.replyDate=replyDate;
		this.replyDelete=replyDelete;
		this.replyReport=replyReport;
	}
	public ReplyBean() {
		
	}
	
//	public Integer getMemberId() {
//		return memberId;
//	}
//	public void setMemberId(Integer memberId) {
//		this.memberId = memberId;
//	}
	public Integer getMessageId() {
		return messageId;
	}
	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}
	public Integer getReplyId() {
		return replyId;
	}
	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}


}
