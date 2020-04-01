package com.web.model.booking;

import java.awt.image.BufferedImage;
import java.sql.Blob;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "MOVIES")
@SequenceGenerator(name = "MID", allocationSize = 1)
public class MovieBean extends GenericEntity {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "MOVIE_ID")
	@GeneratedValue(generator = "MID")
	// @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer movieId;
	@Column(name = "MOVIE_NAME")
	private String movieName;
	@Column(name = "ENGLISH_NAME")
	private String englishName;
	@Column(name = "RELEASE_DATE")
	private String releaseDate;
	@Column(name = "MOVIE_DIRECTOR")
	private String director;
	@Column(name = "MOVIE_ACTOR")
	private String actor;
	@Column(name = "MOVIE_TYPE")
	private String type;
	@Column(name = "TICKET_PRICE")
	private String ticketPrice;
	@Column(name = "MOVIE_LENGTH")
	private String movieLength;
	@Column(name = "MOVIE_RATE")
	private String rate;
	@Column(name = "MOVIE_IMAGE")
	private Blob image;
	@Column(name = "FILE_NAME")
	private String fileName;
	@Column(name = "FILE_YOUTUBE", columnDefinition = "TEXT")
	private String youtube;
	@Column(name = "MOVIE_STORY", columnDefinition = "TEXT")
	private String movieStory;
	@Column(name = "SOLD_QUANTITY")
	private Integer soldQuantity;
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "movieBean")
	private List<SessionBean> sessionBeanList;
	@Enumerated(EnumType.STRING)
	@Column(name = "MOVIE_STATUS")
	private MovieStatusEnum status;
	@Transient
	private BufferedImage imageFile;
	@Transient
	private MultipartFile fileImage;

	public MultipartFile getFileImage() {
		return fileImage;
	}

	public void setFileImage(MultipartFile fileImage) {
		this.fileImage = fileImage;
	}

	public MovieBean(Integer movieId, String movieName, String englishName, String releaseDate, String director,
			String actor, String type, String ticketPrice, String movieLength, String rate) {
		this.movieId = movieId;
		this.movieName = movieName;
		this.englishName = englishName;
		this.releaseDate = releaseDate;
		this.director = director;
		this.actor = actor;
		this.type = type;
		this.ticketPrice = ticketPrice;
		this.movieLength = movieLength;
		this.rate = rate;
	}

	public MovieBean() {

	}

	public Integer getMovieId() {
		return movieId;
	}

	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getEnglishName() {
		return englishName;
	}

	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTicketPrice() {
		return ticketPrice;
	}

	public void setTicketPrice(String ticketPrice) {
		this.ticketPrice = ticketPrice;
	}

	public String getMovieLength() {
		return movieLength;
	}

	public void setMovieLength(String movieLength) {
		this.movieLength = movieLength;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
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

	public String getYoutube() {
		return youtube;
	}

	public void setYoutube(String youtube) {
		this.youtube = youtube;
	}

	public String getMovieStory() {
		return movieStory;
	}

	public void setMovieStory(String movieStory) {
		this.movieStory = movieStory;
	}

	public Integer getSoldQuantity() {
		return soldQuantity;
	}

	public void setSoldQuantity(Integer soldQuantity) {
		this.soldQuantity = soldQuantity;
	}

	public List<SessionBean> getSessionBeanList() {
		return sessionBeanList;
	}

	public void setSessionBeanList(List<SessionBean> sessionBeanList) {
		this.sessionBeanList = sessionBeanList;
	}

	public MovieStatusEnum getStatus() {
		return status;
	}

	public void setStatus(MovieStatusEnum status) {
		this.status = status;
	}

	public BufferedImage getImageFile() {
		return imageFile;
	}

	public void setImageFile(BufferedImage imageFile) {
		this.imageFile = imageFile;
	}


}
