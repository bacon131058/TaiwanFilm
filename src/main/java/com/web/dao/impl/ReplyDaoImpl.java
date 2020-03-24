package com.web.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.ReplyDao;
import com.web.model.message.MessageBean;
import com.web.model.message.ReplyBean;
@Repository
public class ReplyDaoImpl implements ReplyDao{

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}


	@Override
	public void addReply(ReplyBean reply) {
		
		Session session = factory.getCurrentSession();
		
		session.save(reply);
	}

	@Override
	public MessageBean getMessageById(int messageId) {
		Session session = factory.getCurrentSession();
		MessageBean bb = session.get(MessageBean.class, messageId);
		return bb;
	}
	
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
}
