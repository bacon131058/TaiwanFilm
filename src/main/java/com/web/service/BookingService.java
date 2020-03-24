package com.web.service;

import java.util.List;

import com.web.model.booking.CinemaBean;
import com.web.model.booking.MovieBean;
import com.web.model.booking.SessionBean;
import com.web.model.booking.TicketBean;

public interface BookingService {
	
	void addMovie(MovieBean movie);
	
	List<MovieBean> getAllMovies();
	
	List<MovieBean> getAllMoviesOrder();
	
	MovieBean getMovieById(int movieId);
	
	List<CinemaBean> getAllCinemas();
	
	CinemaBean getCinemaById(int cinemaId);
	
	List<SessionBean> getAllSessionsByMovieId(int movieId);
	
	List<TicketBean> getAllTicketsBySessionId(int sessionId);
	
	MovieBean getMovieBySessionId(int sessionId);

	SessionBean getSessionById(int sessionId);
	
	CinemaBean getCinemaBySessionId(int sessionId);
	
	void addTicket(TicketBean tb);
	
	void addSoldQuantity(TicketBean tb);
	
	TicketBean getTicketById(int ticketId);
	
	void alterMovieDetail(MovieBean mb);
	
	void deleteMovieDetail(MovieBean mb);
	
	List<TicketBean> getMyTickets(int memberId);
	
	void deleteTicket(TicketBean tb);
}
