package com.web.model.booking;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "sessions")
@SequenceGenerator(name = "sid", allocationSize = 1)
public class SessionBean extends GenericEntity {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "session_id")
	@GeneratedValue(generator = "sid")
	private Integer sessionId;
	@Column(name = "cinema_id")
	private Integer cinemaId;
	@Column(name = "session_date")
	private String sessionDate;
	@Column(name = "session_day")
	private String sessionDay;
	@Column(name = "session_time")
	private String sessionTime;
	@Column(name = "movie_id")
	private Integer movieId;

	public Integer getSessionId() {
		return sessionId;
	}

	public void setSessionId(Integer sessionId) {
		this.sessionId = sessionId;
	}

	public Integer getCinemaId() {
		return cinemaId;
	}

	public void setCinemaId(Integer cinemaId) {
		this.cinemaId = cinemaId;
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

	public Integer getMovieId() {
		return movieId;
	}

	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
	}
}
