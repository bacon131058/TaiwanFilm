package com.web.dao;

import java.util.List;

import com.web.model.member.MembersBean;
import com.web.model.message.MessageBean;
import com.web.model.message.ReplyBean;


public interface MessageDao {
	List<MessageBean>  getAllMessages(); 

	List<String>  getAllCategories();
	
	List<MessageBean>  getMessagesByCategory(String messageCategory);
	
	public MessageBean getMessageById(int messageId);

	List<MessageBean> getMessageByTitle(String keyword);

	void addMessage(MessageBean message);

	ReplyBean getReplyById(int replyId);

	List<ReplyBean> getAllReplys();

	List<ReplyBean> getReplysByMessageId( Integer messageId);

	void updateMessage(MessageBean message);

	ReplyBean getReplyByMessageId(int messageId);

	void updateReply(ReplyBean reply);

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
