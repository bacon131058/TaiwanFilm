package com.web.dao;

import java.util.List;

import com.web.model.message.MessageBean;
import com.web.model.message.ReplyBean;

public interface ReplyDao {

	void addReply(ReplyBean bean);

	public MessageBean getMessageById(int messageId);
	
	List<ReplyBean> getReplysByMessageId( Integer messageId);	
}
