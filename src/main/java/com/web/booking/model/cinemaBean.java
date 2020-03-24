package com.web.booking.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cinemas")
public class cinemaBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "cinema_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cinemaId;
	@Column(name = "cinema_name")
	private String cinemaName;
	@Column(name = "cinema_country")
	private String cinemaCountry;
	@Column(name = "cinema_phone")
	private String cinemaPhone;
	@Column(name = "cinema_address")
	private String cinemaAddress;
	@Column(name = "cinema_mrt")
	private String cinemaMrt;
	@Column(name = "cinema_bus")
	private String cinemaBus;
	private Blob image;
	@Column(name = "file_name")
	private String fileName;

	public cinemaBean() {

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
