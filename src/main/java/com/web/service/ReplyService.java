package com.web.service;

import java.util.List;

import com.web.model.message.MessageBean;
import com.web.model.message.ReplyBean;

public interface ReplyService {
	void addReply(ReplyBean bean);

	public MessageBean getMessageById(int messageId);
	
	List<ReplyBean> getReplysByMessageId( Integer messageId);
}
