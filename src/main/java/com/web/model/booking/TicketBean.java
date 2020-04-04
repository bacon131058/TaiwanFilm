package com.web.model.booking;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "TICKETS")
@SequenceGenerator(name = "TID", allocationSize = 1)
public class TicketBean extends GenericEntity {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "TICKET_ID")
	@GeneratedValue(generator = "TID")
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ticketId;
	@Column(name = "SEAT")
	private String seat;
	@ManyToOne
	@JoinColumn(name = "SESSION_ID")
	private SessionBean sessionBean;
	@Column(name = "MEMBER_ID")
	private Integer memberId;
	@Column(name = "TICKET_STATUS")
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

	public SessionBean getSessionBean() {
		return sessionBean;
	}

	public void setSessionBean(SessionBean sessionBean) {
		this.sessionBean = sessionBean;
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
