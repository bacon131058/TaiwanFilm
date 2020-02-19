package com.web.message.service;

import java.util.List;

import com.web.login.Model.MembersBean;
import com.web.message.model.MessageBean;
import com.web.message.model.ReplyBean;

public interface MessageService {
	List<MessageBean>  getAllMessages(); 
		
	List<String>  getAllCategories();
	
	List<ReplyBean> getAllReplys();

	List<MessageBean>  getMessagesByCategory(String messageCategory);
	
	public MessageBean getMessageById(int messageId);
	
	List<MessageBean> getMessageByTitle(String keyword);

	void addMessage(MessageBean message);

	ReplyBean getReplyById(int replyId);

	List<ReplyBean> getReplysByMessageId( Integer messageId);

	void updateMessage(MessageBean mb);

	ReplyBean getReplyByMessageId(int messageId);

	void updateReply(ReplyBean rb);

	MembersBean getMemberNameById(int memberId);

	void updateLike(MessageBean message);

	void deleteReply(Integer replyId);

	void deleteMessage(Integer messageId);

//	void reportReply(Integer replyId);

	void reportReply(ReplyBean reply);

	List<MessageBean> getMessageInfo(Integer messageId);

	List<MessageBean> getMessagesByLike();

	List<MessageBean> getMessagesByDate();

	void deleteReplyB(Integer replyId);

	void resetReplyB(Integer replyId);

}
