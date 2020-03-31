package com.web.dao.impl;

import java.util.ArrayList;
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

@Repository
public class BookingDaoImpl implements BookingDao {

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public void addMovie(MovieBean movie) {
		Session session = factory.getCurrentSession();
		session.save(movie);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MovieBean> getAllMovies() {
		String hql = "from MovieBean order by soldQuantity desc";
		Session session = null;
		List<MovieBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MovieBean> getAllMoviesOrder() {
		String hql = "from MovieBean order by releaseDate";
		Session session = null;
		List<MovieBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public MovieBean getMovieById(int movieId) {
		Session session = factory.getCurrentSession();
		MovieBean mb = session.get(MovieBean.class, movieId);
		return mb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CinemaBean> getAllCinemas() {
		String hql = "from CinemaBean";
		Session session = null;
		List<CinemaBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public CinemaBean getCinemaById(int cinemaId) {
		Session session = factory.getCurrentSession();
		CinemaBean cb = session.get(CinemaBean.class, cinemaId);
		return cb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SessionBean> getAllSessionsByMovieId(int movieId) {
		String hql = "from SessionBean where movieId = :mid";
		Session session = null;
		List<SessionBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("mid", movieId).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TicketBean> getAllTicketsBySessionId(int sessionId) {
		String hql = "from TicketBean where sessionId = :sid";
		Session session = factory.getCurrentSession();
		SessionBean sb = session.get(SessionBean.class, sessionId);
		session = null;
		List<TicketBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("sid", sb).getResultList();
		return list;
	}

	@Override
	public MovieBean getMovieBySessionId(int sessionId) {
		Session session = factory.getCurrentSession();
		SessionBean sb = session.get(SessionBean.class, sessionId);
		MovieBean mb = sb.getMovieBean();
		return mb;
	}

	@Override
	public SessionBean getSessionById(int sessionId) {
		Session session = factory.getCurrentSession();
		SessionBean sb = session.get(SessionBean.class, sessionId);
		return sb;
	}

	@Override
	public CinemaBean getCinemaBySessionId(int sessionId) {
		Session session = factory.getCurrentSession();
		SessionBean sb = session.get(SessionBean.class, sessionId);
		CinemaBean cb = sb.getCinemaBean();
		return cb;
	}

	@Override
	public void addTicket(TicketBean tb) {
		Session session = factory.getCurrentSession();
		tb.setStatus("未付款");
		System.out.println("sessionBean 2: " + tb.getSessionId());
		session.save(tb);
	}

	@Override
	public void addSoldQuantity(TicketBean tb) {
		Session session = factory.getCurrentSession();
		String seat = tb.getSeat();
		int count = 0;
		String str = "";
		for (int i = 0; i < seat.length(); i++) {
			str = String.valueOf(seat.charAt(i));
			if (str.equals("-")) {
				count++;
			}
		}
		SessionBean sb = tb.getSessionId();
		System.out.println(sb);
		System.out.println(sb.getSessionId());
		MovieBean mb = sb.getMovieBean();
		try {
			mb.setSoldQuantity(mb.getSoldQuantity() + count);
		} catch (NullPointerException e) {
			mb.setSoldQuantity(count);
		}
		session.update(mb);
	}

	@Override
	public TicketBean getTicketById(int ticketId) {
		Session session = factory.getCurrentSession();
		TicketBean tb = session.get(TicketBean.class, ticketId);
		return tb;
	}

	@Override
	public void alterMovieDetail(MovieBean mb) {
		Session session = factory.getCurrentSession();
		session.update(mb);
	}
	
	@Override
	public void deleteMovieDetail(MovieBean mb) {
		Session session = factory.getCurrentSession();
		session.delete(mb);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<TicketBean> getMyTickets(int memberId) {
		String hql = "from TicketBean where memberId = :mid";
//		String hql = "from ticketBean";
		Session session = null;
		List<TicketBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("mid", memberId).getResultList();
//		list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@Override
	public void deleteTicket(TicketBean tb) {
		Session session = factory.getCurrentSession();
		session.delete(tb);
	}
}
