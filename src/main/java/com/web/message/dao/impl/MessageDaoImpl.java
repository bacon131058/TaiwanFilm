package com.web.message.dao.impl;

import java.util.ArrayList;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.login.Model.MembersBean;
import com.web.message.dao.MessageDao;
import com.web.message.model.MessageBean;
import com.web.message.model.ReplyBean;
import com.web.raisefunding.model.ProjectInfoBean;

@Repository
public class MessageDaoImpl implements MessageDao {
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	// 查詢所有留言
	@SuppressWarnings("unchecked")
	@Override
	public List<ReplyBean> getReplysByMessageId(Integer messageId) {
		String hql = "FROM ReplyBean bb where bb.messageId =:messageId";
		Session session = null;
		List<ReplyBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("messageId", messageId).getResultList();
		return list;
	}

	// 查詢所有留言
	@SuppressWarnings("unchecked")
	@Override
	public List<ReplyBean> getAllReplys() {
		String hql = "FROM ReplyBean";
		Session session = null;
		List<ReplyBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	// 查詢所有文章
	@SuppressWarnings("unchecked")
	@Override
	public List<MessageBean> getAllMessages() {
		String hql = "FROM MessageBean";
		Session session = null;
		List<MessageBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MessageBean> getMessagesByLike() {
		String hql = "FROM MessageBean   ORDER  BY   messageLike DESC";
		Session session = null;
		List<MessageBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MessageBean> getMessagesByDate() {
		String hql = "FROM MessageBean   ORDER  BY  createDate DESC";
		Session session = null;
		List<MessageBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	// 查詢留言by messageId
	@Override
	public ReplyBean getReplyByMessageId(int messageId) {
		Session session = factory.getCurrentSession();
		ReplyBean rb = session.get(ReplyBean.class, messageId);
		return rb;
	}

	// 查詢文章by messageId
	@Override
	public MessageBean getMessageById(int messageId) {
		Session session = factory.getCurrentSession();
		MessageBean bb = session.get(MessageBean.class, messageId);
		return bb;
	}

//模糊查詢
	@Override
	public List<MessageBean> getMessageByTitle(String keyword) {
		String hql = "from MessageBean c WHERE c.messageTitle like '%" + keyword + "%'";
		List<MessageBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setMaxResults(15).getResultList();
		return list;

	}

//查詢所有分類
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllCategories() {
		String hql = "SELECT DISTINCT b.messageCategory FROM MessageBean b";
		Session session = factory.getCurrentSession();
		List<String> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}

//分類查詢
	@SuppressWarnings("unchecked")
	@Override
	public List<MessageBean> getMessagesByCategory(String messageCategory) {
		String hql = "FROM MessageBean bb WHERE bb.messageCategory = :messageCategory";
		List<MessageBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("messageCategory", messageCategory).getResultList();
		return list;
	}

	@Override
	public ReplyBean getReplyById(int replyId) {
		Session session = factory.getCurrentSession();
		ReplyBean bb = session.get(ReplyBean.class, replyId);
		return bb;
	}

//新增文章
	@Override
	public void addMessage(MessageBean message) {
		Session session = factory.getCurrentSession();
		session.save(message);
	}

	// 編輯文章
	@Override
	public void updateMessage(MessageBean message) {
		String hql = "UPDATE  MessageBean SET   messageTitle=:newMessageTitle, messageContent=:newMessageContent,messageCategory=:newMessageCategory,createDate=:newCreateDate WHERE messageId=:messageId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("newMessageTitle", message.getMessageTitle())
				.setParameter("newMessageContent", message.getMessageContent())
				.setParameter("newMessageCategory", message.getMessageCategory())
				.setParameter("newCreateDate", message.getCreateDate())
				.setParameter("messageId", message.getMessageId()).executeUpdate();
	}

	// 按讚
	@Override
	public void updateLike(MessageBean message) {
		String hql = "UPDATE MessageBean SET messageLike=:newMessageLike WHERE messageId=:messageId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("newMessageLike", message.getMessageLike())
				.setParameter("messageId", message.getMessageId()).executeUpdate();
	}

	// 刪除留言
	@Override
	public void deleteReply(Integer replyId) {
		String hql = "UPDATE ReplyBean SET replyDelete=:newReplyDelete WHERE replyId=:replyId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("newReplyDelete", 2).setParameter("replyId", replyId).executeUpdate();
	}
	// 後台刪除留言
	@Override
	public void deleteReplyB(Integer replyId) {
		String hql = "UPDATE ReplyBean SET replyReport=:newReplyReport WHERE replyId=:replyId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("newReplyReport", 3).setParameter("replyId", replyId).executeUpdate();
	}
	// 後台復原留言
	@Override
	public void resetReplyB(Integer replyId) {
		String hql = "UPDATE ReplyBean SET replyReport=:newReplyReport WHERE replyId=:replyId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("newReplyReport", 1).setParameter("replyId", replyId).executeUpdate();
	}

	// 檢舉留言
	@Override
	public void reportReply(ReplyBean reply) {
		String hql = "UPDATE ReplyBean SET replyReport=:newReplyReport WHERE replyId=:replyId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("newReplyReport", reply.getReplyReport())
				.setParameter("replyId", reply.getReplyId()).executeUpdate();
	}

	// 刪除文章
	@Override
	public void deleteMessage(Integer messageId) {
		String hql = "UPDATE MessageBean SET  messageDelete=:newMessageDelete  WHERE messageId=:messageId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("newMessageDelete", 2).setParameter("messageId", messageId)
				.executeUpdate();
		System.out.println(messageId);
	}

	// 編輯留言
	@Override
	public void updateReply(ReplyBean reply) {
		String hql = "UPDATE  ReplyBean SET   replyContent=:newReplyContent ,replyDate=:newReplyDate WHERE replyId=:replyId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("newReplyContent", reply.getReplyContent())
				.setParameter("newReplyDate", reply.getReplyDate()).setParameter("replyId", reply.getReplyId())
				.executeUpdate();

	}

	// 撈會員名稱by id
	@Override
	public MembersBean getMemberNameById(int memberId) {
		Session session = factory.getCurrentSession();
		MembersBean mb = session.get(MembersBean.class, memberId);
		return mb;
	}

	@Override
	public List<MessageBean> getMessageInfo(Integer messageId) {
		Session session = factory.getCurrentSession();
		String hql = "from MessageBean where messagetId = :messageId";
		List<MessageBean> messageBean = session.createQuery(hql).setParameter("messageId", messageId).getResultList();
		return messageBean;
	}

}
