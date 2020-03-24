package com.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.BookingDao;
import com.web.model.booking.CinemaBean;
import com.web.model.booking.MovieBean;
import com.web.model.booking.SessionBean;
import com.web.model.booking.TicketBean;
import com.web.service.BookingService;

@Service
public class BookingServiceImpl implements BookingService {

	BookingDao dao;

	@Autowired
	public void setDao(BookingDao dao) {
		this.dao = dao;
	}

	@Transactional
	@Override
	public void addMovie(MovieBean movie) {
		dao.addMovie(movie);
	}

	@Transactional
	@Override
	public List<MovieBean> getAllMovies() {
		return dao.getAllMovies();
	}
	
	@Transactional
	@Override
	public List<MovieBean> getAllMoviesOrder(){
		return dao.getAllMoviesOrder();
	}

	@Transactional
	@Override
	public MovieBean getMovieById(int movieId) {
		return dao.getMovieById(movieId);
	}

	@Transactional
	@Override
	public List<CinemaBean> getAllCinemas() {
		return dao.getAllCinemas();
	}

	@Transactional
	@Override
	public CinemaBean getCinemaById(int cinemaId) {
		return dao.getCinemaById(cinemaId);
	}

	@Transactional
	@Override
	public List<SessionBean> getAllSessionsByMovieId(int movieId) {
		return dao.getAllSessionsByMovieId(movieId);
	}

	@Transactional
	@Override
	public List<TicketBean> getAllTicketsBySessionId(int sessionId) {
		return dao.getAllTicketsBySessionId(sessionId);
	}

	@Transactional
	@Override
	public MovieBean getMovieBySessionId(int sessionId) {
		return dao.getMovieBySessionId(sessionId);
	}

	@Transactional
	@Override
	public SessionBean getSessionById(int sessionId) {
		return dao.getSessionById(sessionId);
	}

	@Transactional
	@Override
	public CinemaBean getCinemaBySessionId(int sessionId) {
		return dao.getCinemaBySessionId(sessionId);
	}

	@Transactional
	@Override
	public void addTicket(TicketBean tb) {
		dao.addTicket(tb);
	}

	@Transactional
	@Override
	public void addSoldQuantity(TicketBean tb) {
		dao.addSoldQuantity(tb);
	}

	@Transactional
	@Override
	public TicketBean getTicketById(int ticketId) {
		return dao.getTicketById(ticketId);
	}

	@Transactional
	@Override
	public void alterMovieDetail(MovieBean mb) {
		dao.alterMovieDetail(mb);
	}

	@Transactional
	@Override
	public void deleteMovieDetail(MovieBean mb) {
		dao.deleteMovieDetail(mb);
	}

	@Transactional
	@Override
	public List<TicketBean> getMyTickets(int memberId) {
		return dao.getMyTickets(memberId);
	}
	
	@Transactional
	@Override
	public void deleteTicket(TicketBean tb) {
		dao.deleteTicket(tb);
	}
}
