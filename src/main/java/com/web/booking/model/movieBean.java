package com.web.booking.model;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "movies")
@SequenceGenerator(name = "mid", allocationSize = 1)
public class movieBean extends GenericEntity {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "movie_id")
	@GeneratedValue(generator = "mid")
	private Integer movieId;
	@Column(name = "movie_name")
	private String movieName;
	@Column(name = "english_name")
	private String englishName;
	@Column(name = "release_date")
	private String releaseDate;
	private String director;
	private String actor;
	private String type;
	@Column(name = "ticket_price")
	private String ticketPrice;
	@Column(name = "movie_length")
	private String movieLength;
	private String rate;
	private Blob image;
	@Column(name = "file_name")
	private String fileName;
	@Column(columnDefinition = "TEXT")
	private String youtube;
	@Column(name = "movie_story", columnDefinition = "TEXT")
	private String movieStory;
	@Column(name = "sold_quantity")
	private Integer soldQuantity;
	@Transient
	private MultipartFile fileImage;

	public MultipartFile getFileImage() {
		return fileImage;
	}

	public void setFileImage(MultipartFile fileImage) {
		this.fileImage = fileImage;
	}

	public movieBean(Integer movieId, String movieName, String englishName, String releaseDate, String director,
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

	public movieBean() {

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
}
