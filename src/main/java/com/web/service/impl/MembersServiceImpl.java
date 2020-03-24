package com.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.MembersDao;
import com.web.model.member.MembersBean;
import com.web.service.MembersService;


@Service
public class MembersServiceImpl implements MembersService {
	
	@Autowired
	MembersDao dao;
	
	
	
	@Transactional
	@Override
	public void saveMembers(MembersBean mb) {	
		 dao.addMember(mb);
	}

	@Transactional
	@Override
	public MembersBean getMemberById(int memberId) {
		return dao.getMemberById(memberId);
	}
	@Transactional
	@Override
	public MembersBean getMemberByBean(MembersBean mb) {
		return dao.getMemberByBean(mb);
	}
	
	@Transactional
	@Override
	public MembersBean login(String email, String pwd) {
		try {
			return dao.login(email,pwd);			
		} catch (Exception e) {		
//			System.out.println("錯誤!!!!!!!!!!!!!!!!!!!!! service catch");
			return null;
		}
	}
	@Transactional
	@Override
	public boolean updateMembers(MembersBean member) {
		return dao.updateMembers(member);		
	}
	@Transactional
	@Override
	public boolean modifyMembers(MembersBean member) {
		return dao.modifyMembers(member);		
	}	
	@Transactional	
	@Override
	public boolean emailExists(String email) {
		return dao.emailExists(email);
	}
	@Transactional	
	@Override
	public List<MembersBean> getAllMembers() {
		return dao.getAll();
	}
	@Transactional	
	@Override
	public List<MembersBean> getMemberByName(String keyword) {
		return dao.getMemberByName(keyword);
	}
	

}
