package com.web.model.booking;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "SESSIONS")
@SequenceGenerator(name = "SID", allocationSize = 1)
public class SessionBean extends GenericEntity {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "SESSION_ID")
	@GeneratedValue(generator = "SID")
	// @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer sessionId;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "CINEMA_ID")
	private CinemaBean cinemaBean;
	@Column(name = "SESSION_DATE")
	private String sessionDate;
	@Column(name = "SESSION_DAY")
	private String sessionDay;
	@Column(name = "SESSION_TIME")
	private String sessionTime;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "MOVIE_ID")
	private MovieBean movieBean;

	public Integer getSessionId() {
		return sessionId;
	}

	public void setSessionId(Integer sessionId) {
		this.sessionId = sessionId;
	}

	public CinemaBean getCinemaBean() {
		return cinemaBean;
	}

	public void setCinemaBean(CinemaBean cinemaBean) {
		this.cinemaBean = cinemaBean;
	}

	public String getSessionDate() {
		return sessionDate;
	}

	public void setSessionDate(String sessionDate) {
		this.sessionDate = sessionDate;
	}

	public String getSessionDay() {
		return sessionDay;
	}

	public void setSessionDay(String sessionDay) {
		this.sessionDay = sessionDay;
	}

	public String getSessionTime() {
		return sessionTime;
	}

	public void setSessionTime(String sessionTime) {
		this.sessionTime = sessionTime;
	}

	public MovieBean getMovieBean() {
		return movieBean;
	}

	public void setMovieBean(MovieBean movieBean) {
		this.movieBean = movieBean;
	}
}
