package com.web.model.booking;

import java.sql.Blob;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "CINEMAS")
@SequenceGenerator(name = "CID", allocationSize = 1)
public class CinemaBean extends GenericEntity {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "CINEMA_ID")
	@GeneratedValue(generator = "CID")
	// @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cinemaId;
	@Column(name = "CINEMA_NAME")
	private String cinemaName;
	@Column(name = "CINEMA_COUNTRY")
	private String cinemaCountry;
	@Column(name = "CINEMA_PHONE")
	private String cinemaPhone;
	@Column(name = "CINEMA_ADDRESS")
	private String cinemaAddress;
	@Column(name = "CINEMA_MRT")
	private String cinemaMrt;
	@Column(name = "CINEMA_BUS")
	private String cinemaBus;
	@Column(name = "CINEMA_IMAGE")
	private Blob image;
	@Column(name = "FILE_NAME")
	private String fileName;
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "cinemaBean")
	private List<SessionBean> sessionBeanList;

	public CinemaBean() {

	}

	public Integer getCinemaId() {
		return cinemaId;
	}

	public void setCinemaId(Integer cinemaId) {
		this.cinemaId = cinemaId;
	}

	public String getCinemaName() {
		return cinemaName;
	}

	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}

	public String getCinemaCountry() {
		return cinemaCountry;
	}

	public void setCinemaCountry(String cinemaCountry) {
		this.cinemaCountry = cinemaCountry;
	}

	public String getCinemaPhone() {
		return cinemaPhone;
	}

	public void setCinemaPhone(String cinemaPhone) {
		this.cinemaPhone = cinemaPhone;
	}

	public String getCinemaAddress() {
		return cinemaAddress;
	}

	public void setCinemaAddress(String cinemaAddress) {
		this.cinemaAddress = cinemaAddress;
	}

	public String getCinemaMrt() {
		return cinemaMrt;
	}

	public void setCinemaMrt(String cinemaMrt) {
		this.cinemaMrt = cinemaMrt;
	}

	public String getCinemaBus() {
		return cinemaBus;
	}

	public void setCinemaBus(String cinemaBus) {
		this.cinemaBus = cinemaBus;
	}

	public Blob getImage() {
		return image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}
