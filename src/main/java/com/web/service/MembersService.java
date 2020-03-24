package com.web.service;

import java.util.List;

import com.web.model.member.MembersBean;

public interface MembersService {
	
	void saveMembers(MembersBean mb);
	MembersBean getMemberById(int memberId);
	MembersBean getMemberByBean(MembersBean mb);
	MembersBean login(String email,String pwd);
	public boolean updateMembers(MembersBean member);
	public boolean modifyMembers(MembersBean member);
	boolean emailExists(String email);
	List<MembersBean> getAllMembers();
	List<MembersBean> getMemberByName(String keyword);
}
