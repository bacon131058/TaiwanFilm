package com.web.service;

import java.util.List;

import org.springframework.http.MediaType;

import com.web.model.booking.CinemaBean;
import com.web.model.booking.MovieBean;
import com.web.model.booking.SessionBean;
import com.web.model.booking.TicketBean;
import com.web.model.member.MembersBean;

public interface BookingService {

	List<MovieBean> getAllMovies();

	List<MovieBean> getAllMoviesOrder();

	MovieBean getMovieById(int movieId);

	List<CinemaBean> getAllCinemas();

	CinemaBean getCinemaById(int cinemaId);

	List<SessionBean> getAllSessionsByMovieId(int movieId);

	SessionBean getSessionById(int sessionId);

	List<TicketBean> getAllTicketsBySessionBean(SessionBean sb);

	void addTicket(TicketBean tb, MembersBean mem, int sessionId);

	TicketBean getTicketById(int ticketId);

	List<TicketBean> getTicketsByMemberBean(MembersBean mem);

	void deleteTicket(TicketBean tb);

	byte[] getPicture(String bean, int id);

	MediaType getTypeByFileName(String bean, int id);

	void alterMovie(MovieBean mb);

	void deleteMovie(MovieBean mb);

	void addMovie(MovieBean movie);
}
