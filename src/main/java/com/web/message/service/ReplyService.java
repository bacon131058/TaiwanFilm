package com.web.message.service;

import java.util.List;

import com.web.message.model.MessageBean;
import com.web.message.model.ReplyBean;

public interface ReplyService {
	void addReply(ReplyBean bean);

	public MessageBean getMessageById(int messageId);
	
	List<ReplyBean> getReplysByMessageId( Integer messageId);
}
