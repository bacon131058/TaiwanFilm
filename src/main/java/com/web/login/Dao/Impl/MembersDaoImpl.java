package com.web.login.Dao.Impl;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.login.Dao.MembersDao;
import com.web.login.Model.MembersBean;



@Repository
public class MembersDaoImpl implements MembersDao {
	
	@Autowired
	SessionFactory factory;
	
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory= factory;
	}
	@Override
	public void addMember(MembersBean mb) {		
		Session session = factory.getCurrentSession();
		session.save(mb);	
	}
	
	@Override
	public MembersBean getMemberById(int memberId) {
		MembersBean mb = null;
	    Session session = factory.getCurrentSession();
	    String hql="FROM MembersBean mb WHERE mb.memberId = :id";
	    try {

			mb = (MembersBean) session.createQuery(hql)
					.setParameter("id",memberId)
					.getSingleResult();
	    } catch (NoResultException e) {
			System.out.println("查無紀錄");// 表示查無紀錄
		}
	    return mb;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MembersBean> getMemberByName(String keyword){
		System.out.println("模糊查詢DAO");
		String hql="FROM MembersBean mb WHERE mb.memberName like '%"+keyword+"%'";
//		List<MembersBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		List<MembersBean> list = session.createQuery(hql).getResultList();
//		list = session.createQuery(hql).getResultList();	

		
		return list ;
		
	}

	@Override
	public MembersBean getMemberByBean(MembersBean mb) {
		MembersBean member = null;
	    Session session = factory.getCurrentSession();
	    String hql="FROM MembersBean mb WHERE mb.email = :email";
	    try {
			member = (MembersBean) session.createQuery(hql)
					.setParameter("email",mb.getEmail())
					.getSingleResult();
		} catch (NoResultException e) {
			System.out.println("查無紀錄");// 表示查無紀錄
		}
	    return member;
	}
	@Override
	public MembersBean login(String email, String password) {
		String hql ="from MembersBean where email = :email and password = :password";
		MembersBean  member = null;
		Session session = factory.getCurrentSession();
		try {
			System.out.println("SQL登入成功");
			member = (MembersBean) session.createQuery(hql)
					.setParameter("email", email)
					.setParameter("password", password)
					.getSingleResult();
		}catch (Exception e) {
			System.out.println("SQL登入失敗");

			member = null;
		}
		
		return member;
	}
	
	@Override
	public boolean modifyMembers(MembersBean member) {
		System.out.println("後端改會員狀態DAO");
		System.out.println("會員狀態為:" +member.getMemberMode());
		String hql = "from MembersBean where email = :email";
		Session session = factory.getCurrentSession();
		MembersBean mem = (MembersBean) session.createQuery(hql)
				.setParameter("email", member.getEmail())
				.getSingleResult();			
			mem.setMemberMode(member.getMemberMode());
		session.update(mem);
		return true;
	}
	
	@Override
	public boolean updateMembers(MembersBean member) {

		String hql = "from MembersBean where email = :email";
		Session session = factory.getCurrentSession();

		MembersBean mem = (MembersBean) session.createQuery(hql)
				.setParameter("email", member.getEmail())
				.getSingleResult();
	
			System.out.println("取出唯一值得信箱:" + member.getEmail());
			mem.setMemberName(member.getMemberName());
			mem.setEmail(member.getEmail());
			mem.setGender(member.getGender());
			mem.setBirthDay(member.getBirthDay());
			mem.setMemberImage(member.getMemberImage());
			mem.setFileName(member.getFileName());
			if(member.getPassword() !="") {
				mem.setPassword(member.getPassword());
			}
		session.update(mem);
		return true;
	}
	@Override
	public boolean emailExists(String email) {
		boolean exist = false;
		Session session = factory.getCurrentSession();
		String queryString = "from MembersBean where email = :email";
		List<?> list = session.createQuery(queryString).setParameter("email", email).list();
		if (!list.isEmpty()) {
			exist = true;
		}
		return exist;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<MembersBean> getAll() {
		String hql = "FROM MembersBean ";
//		where memberMode ='1'
		Session session = factory.getCurrentSession();
		List<MembersBean> list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MembersBean> getNotMember() {
		String hql = "FROM MembersBean  where memberMode ='1'";
		Session session = factory.getCurrentSession();
		List<MembersBean> list = session.createQuery(hql).getResultList();
		return list;
	}
	@Override
	public MembersBean get(Integer id) {
		return factory.getCurrentSession().get(MembersBean.class, id);
	}

	
}
