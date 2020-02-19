package com.web.booking.service;

import java.util.List;

import com.web.booking.model.cinemaBean;
import com.web.booking.model.movieBean;
import com.web.booking.model.sessionBean;
import com.web.booking.model.ticketBean;

public interface bookingService {
	
	void addMovie(movieBean movie);
	
	List<movieBean> getAllMovies();
	
	List<movieBean> getAllMoviesOrder();
	
	movieBean getMovieById(int movieId);
	
	List<cinemaBean> getAllCinemas();
	
	cinemaBean getCinemaById(int cinemaId);
	
	List<sessionBean> getAllSessionsByMovieId(int movieId);
	
	List<ticketBean> getAllTicketsBySessionId(int sessionId);
	
	movieBean getMovieBySessionId(int sessionId);

	sessionBean getSessionById(int sessionId);
	
	cinemaBean getCinemaBySessionId(int sessionId);
	
	void addTicket(ticketBean tb);
	
	void addSoldQuantity(ticketBean tb);
	
	ticketBean getTicketById(int ticketId);
	
	void alterMovieDetail(movieBean mb);
	
	void deleteMovieDetail(movieBean mb);
	
	List<ticketBean> getMyTickets(int memberId);
	
	void deleteTicket(ticketBean tb);
}
