package com.web.booking.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.booking.dao.bookingDao;
import com.web.booking.model.cinemaBean;
import com.web.booking.model.movieBean;
import com.web.booking.model.sessionBean;
import com.web.booking.model.ticketBean;

@Repository
public class bookingDaoImpl implements bookingDao {

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public void addMovie(movieBean movie) {
		Session session = factory.getCurrentSession();
		session.save(movie);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<movieBean> getAllMovies() {
		String hql = "from movieBean order by soldQuantity desc";
		Session session = null;
		List<movieBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<movieBean> getAllMoviesOrder() {
		String hql = "from movieBean order by releaseDate";
		Session session = null;
		List<movieBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public movieBean getMovieById(int movieId) {
		Session session = factory.getCurrentSession();
		movieBean mb = session.get(movieBean.class, movieId);
		return mb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<cinemaBean> getAllCinemas() {
		String hql = "from cinemaBean";
		Session session = null;
		List<cinemaBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public cinemaBean getCinemaById(int cinemaId) {
		Session session = factory.getCurrentSession();
		cinemaBean cb = session.get(cinemaBean.class, cinemaId);
		return cb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<sessionBean> getAllSessionsByMovieId(int movieId) {
		String hql = "from sessionBean where movieId = :mid";
		Session session = null;
		List<sessionBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("mid", movieId).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ticketBean> getAllTicketsBySessionId(int sessionId) {
		String hql = "from ticketBean where sessionId = :sid";
		Session session = factory.getCurrentSession();
		sessionBean sb = session.get(sessionBean.class, sessionId);
		session = null;
		List<ticketBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("sid", sb).getResultList();
		return list;
	}

	@Override
	public movieBean getMovieBySessionId(int sessionId) {
		Session session = factory.getCurrentSession();
		sessionBean sb = session.get(sessionBean.class, sessionId);
		movieBean mb = session.get(movieBean.class, sb.getMovieId());
		return mb;
	}

	@Override
	public sessionBean getSessionById(int sessionId) {
		Session session = factory.getCurrentSession();
		sessionBean sb = session.get(sessionBean.class, sessionId);
		return sb;
	}

	@Override
	public cinemaBean getCinemaBySessionId(int sessionId) {
		Session session = factory.getCurrentSession();
		sessionBean sb = session.get(sessionBean.class, sessionId);
		cinemaBean cb = session.get(cinemaBean.class, sb.getCinemaId());
		return cb;
	}

	@Override
	public void addTicket(ticketBean tb) {
		Session session = factory.getCurrentSession();
		tb.setStatus("未付款");
		System.out.println("sessionBean 2: " + tb.getSessionId());
		session.save(tb);
	}

	@Override
	public void addSoldQuantity(ticketBean tb) {
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
		sessionBean sb = tb.getSessionId();
		System.out.println(sb);
		System.out.println(sb.getSessionId());
		movieBean mb = session.get(movieBean.class, sb.getMovieId());
		try {
			mb.setSoldQuantity(mb.getSoldQuantity() + count);
		} catch (NullPointerException e) {
			mb.setSoldQuantity(count);
		}
		session.update(mb);
	}

	@Override
	public ticketBean getTicketById(int ticketId) {
		Session session = factory.getCurrentSession();
		ticketBean tb = session.get(ticketBean.class, ticketId);
		return tb;
	}

	@Override
	public void alterMovieDetail(movieBean mb) {
		Session session = factory.getCurrentSession();
		session.update(mb);
	}
	
	@Override
	public void deleteMovieDetail(movieBean mb) {
		Session session = factory.getCurrentSession();
		session.delete(mb);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ticketBean> getMyTickets(int memberId) {
		String hql = "from ticketBean where memberId = :mid";
//		String hql = "from ticketBean";
		Session session = null;
		List<ticketBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("mid", memberId).getResultList();
//		list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@Override
	public void deleteTicket(ticketBean tb) {
		Session session = factory.getCurrentSession();
		session.delete(tb);
	}
}
