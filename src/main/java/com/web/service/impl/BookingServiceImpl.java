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

@Transactional
@Service
public class BookingServiceImpl implements BookingService {

	@Autowired
	BookingDao dao;

	@Override
	public void addMovie(MovieBean movie) {
		dao.addMovie(movie);
	}

	@Override
	public List<MovieBean> getAllMovies() {
		return dao.getAllMovies();
	}
	
	@Override
	public List<MovieBean> getAllMoviesOrder(){
		return dao.getAllMoviesOrder();
	}

	@Override
	public MovieBean getMovieById(int movieId) {
		return dao.getMovieById(movieId);
	}

	@Override
	public List<CinemaBean> getAllCinemas() {
		return dao.getAllCinemas();
	}

	@Override
	public CinemaBean getCinemaById(int cinemaId) {
		return dao.getCinemaById(cinemaId);
	}

	@Override
	public List<SessionBean> getAllSessionsByMovieId(int movieId) {
		return dao.getAllSessionsByMovieId(movieId);
	}

	@Override
	public List<TicketBean> getAllTicketsBySessionId(int sessionId) {
		return dao.getAllTicketsBySessionId(sessionId);
	}

	@Override
	public MovieBean getMovieBySessionId(int sessionId) {
		return dao.getMovieBySessionId(sessionId);
	}

	@Override
	public SessionBean getSessionById(int sessionId) {
		return dao.getSessionById(sessionId);
	}

	@Override
	public CinemaBean getCinemaBySessionId(int sessionId) {
		return dao.getCinemaBySessionId(sessionId);
	}

	@Override
	public void addTicket(TicketBean tb) {
		dao.addTicket(tb);
	}

	@Override
	public void addSoldQuantity(TicketBean tb) {
		dao.addSoldQuantity(tb);
	}

	@Override
	public TicketBean getTicketById(int ticketId) {
		return dao.getTicketById(ticketId);
	}

	@Override
	public void alterMovieDetail(MovieBean mb) {
		dao.alterMovieDetail(mb);
	}

	@Override
	public void deleteMovieDetail(MovieBean mb) {
		dao.deleteMovieDetail(mb);
	}

	@Override
	public List<TicketBean> getMyTickets(int memberId) {
		return dao.getMyTickets(memberId);
	}

	@Override
	public void deleteTicket(TicketBean tb) {
		dao.deleteTicket(tb);
	}
}
