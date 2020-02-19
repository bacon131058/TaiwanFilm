package com.web.booking.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.booking.dao.bookingDao;
import com.web.booking.model.cinemaBean;
import com.web.booking.model.movieBean;
import com.web.booking.model.sessionBean;
import com.web.booking.model.ticketBean;
import com.web.booking.service.bookingService;

@Service
public class bookingServiceImpl implements bookingService {

	bookingDao dao;

	@Autowired
	public void setDao(bookingDao dao) {
		this.dao = dao;
	}

	@Transactional
	@Override
	public void addMovie(movieBean movie) {
		dao.addMovie(movie);
	}

	@Transactional
	@Override
	public List<movieBean> getAllMovies() {
		return dao.getAllMovies();
	}
	
	@Transactional
	@Override
	public List<movieBean> getAllMoviesOrder(){
		return dao.getAllMoviesOrder();
	}

	@Transactional
	@Override
	public movieBean getMovieById(int movieId) {
		return dao.getMovieById(movieId);
	}

	@Transactional
	@Override
	public List<cinemaBean> getAllCinemas() {
		return dao.getAllCinemas();
	}

	@Transactional
	@Override
	public cinemaBean getCinemaById(int cinemaId) {
		return dao.getCinemaById(cinemaId);
	}

	@Transactional
	@Override
	public List<sessionBean> getAllSessionsByMovieId(int movieId) {
		return dao.getAllSessionsByMovieId(movieId);
	}

	@Transactional
	@Override
	public List<ticketBean> getAllTicketsBySessionId(int sessionId) {
		return dao.getAllTicketsBySessionId(sessionId);
	}

	@Transactional
	@Override
	public movieBean getMovieBySessionId(int sessionId) {
		return dao.getMovieBySessionId(sessionId);
	}

	@Transactional
	@Override
	public sessionBean getSessionById(int sessionId) {
		return dao.getSessionById(sessionId);
	}

	@Transactional
	@Override
	public cinemaBean getCinemaBySessionId(int sessionId) {
		return dao.getCinemaBySessionId(sessionId);
	}

	@Transactional
	@Override
	public void addTicket(ticketBean tb) {
		dao.addTicket(tb);
	}

	@Transactional
	@Override
	public void addSoldQuantity(ticketBean tb) {
		dao.addSoldQuantity(tb);
	}

	@Transactional
	@Override
	public ticketBean getTicketById(int ticketId) {
		return dao.getTicketById(ticketId);
	}

	@Transactional
	@Override
	public void alterMovieDetail(movieBean mb) {
		dao.alterMovieDetail(mb);
	}

	@Transactional
	@Override
	public void deleteMovieDetail(movieBean mb) {
		dao.deleteMovieDetail(mb);
	}

	@Transactional
	@Override
	public List<ticketBean> getMyTickets(int memberId) {
		return dao.getMyTickets(memberId);
	}
	
	@Transactional
	@Override
	public void deleteTicket(ticketBean tb) {
		dao.deleteTicket(tb);
	}
}
