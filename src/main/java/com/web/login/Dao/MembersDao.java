package com.web.login.Dao;

import java.util.List;

import com.web.login.Model.MembersBean;

public interface MembersDao {
	//新增會員
	void addMember(MembersBean mb);
	//抓取單一會員
	MembersBean getMemberById(int memberId);
	//取Bean
	MembersBean getMemberByBean(MembersBean mb);
	//會員登入
	public MembersBean login(String email, String pwd);
	//更改會員資料
	boolean updateMembers(MembersBean member);
	//信箱存在
	boolean emailExists(String email);
	//取所有會員
	List<MembersBean> getAll();
	MembersBean get(Integer id);
	//取所有非會員
	List<MembersBean> getNotMember();
	//後台編輯會員狀態
	boolean modifyMembers(MembersBean member);
	List<MembersBean> getMemberByName(String keyword);
	

}
