package com.web.message.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.message.dao.ReplyDao;
import com.web.message.model.MessageBean;
import com.web.message.model.ReplyBean;
import com.web.message.service.ReplyService;
@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyDao dao;
	
	@Transactional
	@Override
	public void addReply(ReplyBean bean) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String replyDate = sdFormat.format(date);
		bean.setReplyDate(replyDate);
		 dao.addReply(bean);
	}


	@Transactional
	@Override
	public MessageBean getMessageById(int messageId) {
		return dao.getMessageById(messageId);
	}
	
	@Transactional
	@Override
	public List<ReplyBean> getReplysByMessageId( Integer messageId) {
		return dao.getReplysByMessageId(messageId);
	}
}
