package com.web.message.dao;

import java.util.List;

import com.web.message.model.MessageBean;
import com.web.message.model.ReplyBean;

public interface ReplyDao {

	void addReply(ReplyBean bean);

	public MessageBean getMessageById(int messageId);
	
	List<ReplyBean> getReplysByMessageId( Integer messageId);	
}
