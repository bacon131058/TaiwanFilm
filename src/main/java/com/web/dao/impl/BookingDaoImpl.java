package com.web.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.BookingDao;
import com.web.model.booking.CinemaBean;
import com.web.model.booking.MovieBean;
import com.web.model.booking.SessionBean;
import com.web.model.booking.TicketBean;
import com.web.model.member.MembersBean;

@Repository
@SuppressWarnings("unchecked")
public class BookingDaoImpl implements BookingDao {

	@Autowired
	SessionFactory factory;

	@Override
	public List<MovieBean> getAllMovies() {
		String hql = "from MovieBean order by soldQuantity desc";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	@Override
	public List<MovieBean> getAllMoviesOrder() {
		String hql = "from MovieBean order by releaseDate";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	@Override
	public MovieBean getMovieById(int movieId) {
		Session session = factory.getCurrentSession();
		return session.get(MovieBean.class, movieId);
	}

	@Override
	public List<CinemaBean> getAllCinemas() {
		String hql = "from CinemaBean";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	@Override
	public CinemaBean getCinemaById(int cinemaId) {
		Session session = factory.getCurrentSession();
		return session.get(CinemaBean.class, cinemaId);
	}

	@Override
	public List<SessionBean> getAllSessionsByMovieBean(MovieBean mb) {
		String hql = "from SessionBean where movieBean = :mb";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("mb", mb).getResultList();
	}

	@Override
	public SessionBean getSessionById(int sessionId) {
		Session session = factory.getCurrentSession();
		return session.get(SessionBean.class, sessionId);
	}

	@Override
	public List<TicketBean> getAllTicketsBySessionBean(SessionBean sb) {
		String hql = "from TicketBean where sessionBean = :sb";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("sb", sb).getResultList();
	}

	@Override
	public void addTicket(TicketBean tb) {
		Session session = factory.getCurrentSession();
		session.save(tb);
	}

	@Override
	public void addSoldQuantity(MovieBean mb) {
		Session session = factory.getCurrentSession();
		session.update(mb);
	}

	@Override
	public TicketBean getTicketById(int ticketId) {
		Session session = factory.getCurrentSession();
		return session.get(TicketBean.class, ticketId);
	}

	@Override
	public List<TicketBean> getTicketsByMemberBean(MembersBean mem) {
		String hql = "from TicketBean where memberBean = :mem";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("mem", mem).getResultList();
	}

	@Override
	public void deleteTicket(TicketBean tb) {
		Session session = factory.getCurrentSession();
		session.delete(tb);
	}

	@Override
	public void alterMovie(MovieBean mb) {
		Session session = factory.getCurrentSession();
		session.update(mb);
	}

	@Override
	public void deleteMovie(MovieBean mb) {
		Session session = factory.getCurrentSession();
		session.delete(mb);
	}

	@Override
	public void addMovie(MovieBean movie) {
		Session session = factory.getCurrentSession();
		session.save(movie);
	}
}
