package com.web.dao;

import java.util.List;

import com.web.model.booking.CinemaBean;
import com.web.model.booking.MovieBean;
import com.web.model.booking.SessionBean;
import com.web.model.booking.TicketBean;
import com.web.model.member.MembersBean;

public interface BookingDao {

	List<MovieBean> getAllMovies();

	List<MovieBean> getAllMoviesOrder();

	MovieBean getMovieById(int movieId);

	List<CinemaBean> getAllCinemas();

	CinemaBean getCinemaById(int cinemaId);

	List<SessionBean> getAllSessionsByMovieBean(MovieBean mb);

	SessionBean getSessionById(int sessionId);

	List<TicketBean> getAllTicketsBySessionBean(SessionBean sb);

	void addTicket(TicketBean tb);

	void addSoldQuantity(MovieBean mb);

	TicketBean getTicketById(int ticketId);

	List<TicketBean> getTicketsByMemberBean(MembersBean mem);

	void deleteTicket(TicketBean tb);

	void alterMovie(MovieBean mb);

	void deleteMovie(MovieBean mb);

	void addMovie(MovieBean movie);
}
