package com.web.service.impl;

import java.io.File;
import java.nio.file.Files;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import com.web.dao.BookingDao;
import com.web.model.booking.CinemaBean;
import com.web.model.booking.MovieBean;
import com.web.model.booking.MovieStatusEnum;
import com.web.model.booking.SessionBean;
import com.web.model.booking.TicketBean;
import com.web.model.member.MembersBean;
import com.web.service.BookingService;

@Service
@Transactional
public class BookingServiceImpl implements BookingService {

	@Autowired
	BookingDao dao;

	@Autowired
	ServletContext context;

	@Override
	public List<MovieBean> getAllMovies() {
		return dao.getAllMovies();
	}

	@Override
	public List<MovieBean> getAllMoviesOrder() {
		return dao.getAllMoviesOrder();
	}

	@Override
	public MovieBean getMovieById(int movieId) {
		return dao.getMovieById(movieId);
	}

	@Override
	public List<CinemaBean> getAllCinemas() {
		return dao.getAllCinemas();
	}

	@Override
	public CinemaBean getCinemaById(int cinemaId) {
		return dao.getCinemaById(cinemaId);
	}

	@Override
	public List<SessionBean> getAllSessionsByMovieId(int movieId) {
		MovieBean mb = dao.getMovieById(movieId);
		return dao.getAllSessionsByMovieBean(mb);
	}

	@Override
	public SessionBean getSessionById(int sessionId) {
		return dao.getSessionById(sessionId);
	}

	@Override
	public List<TicketBean> getAllTicketsBySessionBean(SessionBean sb) {
		return dao.getAllTicketsBySessionBean(sb);
	}

	@Override
	public void addTicket(TicketBean tb, MembersBean mem, int sessionId) {
		tb.setMemberBean(mem);
		tb.setSessionBean(dao.getSessionById(sessionId));
		tb.setStatus("未付款");
		dao.addTicket(tb);

		int seatCount = getSeatCount(tb.getSeat());
		MovieBean mb = tb.getSessionBean().getMovieBean();
		// 如果mb.getSoldQuantity()不為null，取出原本值+這張票的座位數
		try {
			mb.setSoldQuantity(mb.getSoldQuantity() + seatCount);
		} catch (NullPointerException e) {
			mb.setSoldQuantity(seatCount);
		}
		// TODO blob導致串流關閉，先將圖片設為null
		mb.setImage(null);
		dao.addSoldQuantity(mb);
	}

	public int getSeatCount(String seat) {
		// 計算seat中"-"的數量就會是 -> 這張ticket所購買的座位數
		int length = seat.length(); // 避免迴圈進行多次運算，提高效率
		String str = "";
		int count = 0;
		for (int i = 0; i < length; i++) {
			str = String.valueOf(seat.charAt(i));
			if (str.equals("-")) {
				count++;
			}
		}
		return count;
	}

	@Override
	public TicketBean getTicketById(int ticketId) {
		return dao.getTicketById(ticketId);
	}

	@Override
	public List<TicketBean> getTicketsByMemberBean(MembersBean mem) {
		return dao.getTicketsByMemberBean(mem);
	}

	@Override
	public void deleteTicket(TicketBean tb) {
		int seatCount = getSeatCount(tb.getSeat());
		MovieBean mb = tb.getSessionBean().getMovieBean();
		mb.setSoldQuantity(mb.getSoldQuantity() - seatCount);
		// TODO blob導致串流關閉，先將圖片設為null
		mb.setImage(null);
		dao.addSoldQuantity(mb);

		dao.deleteTicket(tb);
	}

	@Override
	public byte[] getPicture(String bean, int id) {
		byte[] media = null;
		if (bean.equals("movieBean")) {
			MovieBean mb = dao.getMovieById(id);
			Blob blob = mb.getImage();
			if (blob != null) {
				try {
					int len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} else {
				try {
					File file = ResourceUtils.getFile("classpath:data/img/noimage.png");
					media = Files.readAllBytes(file.toPath());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		if (bean.equals("cinemaBean")) {
			// 讀取內容超過40-60kb的varbinary
			CinemaBean cb = dao.getCinemaById(id);
			String fileName = cb.getFileName();
			try {
				File file = ResourceUtils.getFile("classpath:data/img/theaters/" + fileName);
				media = Files.readAllBytes(file.toPath());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return media;
	}

	@Override
	public MediaType getTypeByFileName(String bean, int id) {
		String fileName = "";
		if (bean.equals("movieBean")) {
			MovieBean mb = dao.getMovieById(id);
			Blob blob = mb.getImage();
			if (blob != null) {
				fileName = mb.getFileName();
			} else {
				fileName = "noimage.png";
			}
		}
		if (bean.equals("cinemaBean")) {
			// 讀取內容超過40-60kb的varbinary
			CinemaBean cb = dao.getCinemaById(id);
			fileName = cb.getFileName();
		}
		String mimeType = context.getMimeType(fileName);
		MediaType mediaType = MediaType.valueOf(mimeType);
		// System.out.println("mediaType =" + mediaType);
		return mediaType;
	}

	@Override
	public void alterMovie(MovieBean mb) {
		MovieBean mbInit = dao.getMovieById(mb.getMovieId());
		mbInit.setMovieName(mb.getMovieName());
		mbInit.setEnglishName(mb.getEnglishName());
		mbInit.setReleaseDate(mb.getReleaseDate());
		mbInit.setDirector(mb.getDirector());
		mbInit.setActor(mb.getActor());
		mbInit.setType(mb.getType().replaceAll(",", "、"));
		mbInit.setMovieLength(mb.getMovieLength());
		mbInit.setTicketPrice(mb.getTicketPrice());
		mbInit.setRate(mb.getRate());
		mbInit.setYoutube(mb.getYoutube());
		mbInit.setMovieStory(mb.getMovieStory());

		MultipartFile fileImage = mb.getFileImage();
		String fileName = fileImage.getOriginalFilename();
		if (fileImage != null && !fileImage.isEmpty()) {
			try {
				byte[] b = fileImage.getBytes();
				Blob blob = new SerialBlob(b);
				mbInit.setImage(blob);
				mbInit.setFileName(fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dao.alterMovie(mbInit);
	}

	@Override
	public void deleteMovie(MovieBean mb) {
		dao.deleteMovie(mb);
	}

	@Override
	public void addMovie(MovieBean mb) {
		MultipartFile fileImage = mb.getFileImage();
		String fileName = fileImage.getOriginalFilename();
		if (fileImage != null && !fileImage.isEmpty()) {
			try {
				byte[] b = fileImage.getBytes();
				Blob blob = new SerialBlob(b);
				mb.setImage(blob);
				mb.setFileName(fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				File file = ResourceUtils.getFile("classpath:data/img/noimage.png");
				byte[] b = Files.readAllBytes(file.toPath());
				Blob blob = new SerialBlob(b);
				mb.setImage(blob);
				mb.setFileName("noimage.png");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		mb.setType(mb.getType().replaceAll(",", "、"));
		mb.setStatus(MovieStatusEnum.UN);
		dao.addMovie(mb);
	}
}
