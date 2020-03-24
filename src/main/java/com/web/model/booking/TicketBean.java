package com.web.model.booking;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tickets")
public class TicketBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ticket_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ticketId;
	private String seat;
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "session_id")
	private SessionBean sessionId;
	@Column(name = "member_id")
	private Integer memberId;
	private String status;

	public Integer getTicketId() {
		return ticketId;
	}

	public void setTicketId(Integer ticketId) {
		this.ticketId = ticketId;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public SessionBean getSessionId() {
		return sessionId;
	}

	public void setSessionId(SessionBean sessionId) {
		this.sessionId = sessionId;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
