package com.web.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.model.booking.CinemaBean;
import com.web.model.booking.MovieBean;
import com.web.model.booking.SessionBean;
import com.web.model.booking.TicketBean;
import com.web.model.booking.ViewBean;
import com.web.model.member.MembersBean;
import com.web.service.BookingService;

// TODO 修改 1.mvc架構 2.service dao的分工(避免過水) 3.javadoc的註解
@Controller
public class BookingController {

	@Autowired
	BookingService service;

	@Autowired
	ServletContext context;

	@RequestMapping("/movie")
	public String getAllMovies(Model model) {
		List<MovieBean> list = service.getAllMovies();
		model.addAttribute("movies", list);
		List<MovieBean> downlist = service.getAllMoviesOrder();
		model.addAttribute("downmovies", downlist);
		return "booking/movie";
	}

	@RequestMapping("/movieDetail")
	public String getMovieById(@RequestParam("movieid") Integer id, Model model) {
		model.addAttribute("movie", service.getMovieById(id));
		return "booking/movieDetail";
	}

	@RequestMapping("/cinema")
	public String getSessionByMovieId(@RequestParam("movieid") Integer id, Model model, HttpSession session, HttpServletRequest request) throws IOException {
		MembersBean mem = (MembersBean) session.getAttribute("members");
		String requestURI = "movieDetail?movieid=" + id;
		if (mem == null) {
			// 請使用者登入
			session.setAttribute("requestURI", requestURI);
			return "redirect:/register";
		}
		model.addAttribute("movie", service.getMovieById(id));
		List<SessionBean> slist = service.getAllSessionsByMovieId(id);
		List<CinemaBean> clist = service.getAllCinemas();
		model.addAttribute("sessions", slist);
		model.addAttribute("cinemas", clist);
		return "booking/sessionChoose";
	}

	@RequestMapping("/bookRule")
	public String bookRule() {
		return "booking/bookRule";
	}

	@RequestMapping(value = "/seatChoose", method = RequestMethod.GET)
	public String getSessionById(@RequestParam("sessionid") Integer id, Model model) {
		List<TicketBean> tlist = service.getAllTicketsBySessionId(id);
		model.addAttribute("tickets", tlist);
		SessionBean sb = service.getSessionById(id);
		model.addAttribute("session", sb);
		// model.addAttribute("movie", sb.getMovieBean());
		// model.addAttribute("cinema", sb.getCinemaBean());
		TicketBean tb = new TicketBean();
		model.addAttribute("ticketBean", tb);
		return "booking/seatChoose";
	}

	@RequestMapping(value = "/seatChoose", method = RequestMethod.POST)
	public String addTicket(@RequestParam(value = "sessionid", required = true) Integer id, @ModelAttribute("ticketBean") TicketBean tb, HttpSession session) {
		MembersBean mem = (MembersBean) session.getAttribute("members");
		// System.out.println("--------------------");
		// System.out.println(mem.getMemberId());
		tb.setMemberId(mem.getMemberId());
		tb.setSessionBean(service.getSessionById(id));
		service.addTicket(tb);
		service.addSoldQuantity(tb);
		return "redirect:/success?ticketid=" + tb.getTicketId();
	}

	@RequestMapping("/success")
	public String getTicketById(@RequestParam("ticketid") Integer id, Model model) {
		TicketBean tb = service.getTicketById(id);
		model.addAttribute("ticket", tb);
		// model.addAttribute("member", service.getMemberById(tb.getMemberId()));
		// SessionBean sb = tb.getSessionBean();
		// model.addAttribute("session", sb);
		// model.addAttribute("movie", sb.getMovieBean());
		// model.addAttribute("cinema", sb.getCinemaBean());
		return "booking/bookSuccess";
	}

	@RequestMapping("/myTicket")
	public String getTicketByMemberId(Model model, HttpSession session) {
		MembersBean mem = (MembersBean) session.getAttribute("members");
		// int memberId = 0;
		List<ViewBean> vlist = new ArrayList<>();
		int tsize = service.getMyTickets(mem.getMemberId()).size();
		for (int i = 0; i < tsize; i++) {
			ViewBean vb = new ViewBean();
			TicketBean tb = service.getMyTickets(mem.getMemberId()).get(i);
			SessionBean sb = tb.getSessionBean();
			CinemaBean cb = sb.getCinemaBean();
			MovieBean mb = sb.getMovieBean();

			vb.setMovieName(mb.getMovieName());
			vb.setEnglishName(mb.getEnglishName());
			vb.setSessionDate(sb.getSessionDate());
			vb.setSessionTime(sb.getSessionTime());
			vb.setCinemaName(cb.getCinemaName());

			vb.setSeat(tb.getSeat());
			vb.setStatus(tb.getStatus());
			vb.setTicketId(tb.getTicketId());
			// vb.setMovieName(service.getMovieById(
			// service.getSessionById(service.getMyTickets(mem.getMemberId()).get(i).getSessionId()).getMovieId())
			// .getMovieName());
			// vb.setEnglishName(service.getMovieById(
			// service.getSessionById(service.getMyTickets(mem.getMemberId()).get(i).getSessionId()).getMovieId())
			// .getEnglishName());
			// vb.setSessionDate(service.getSessionById(service.getMyTickets(mem.getMemberId()).get(i).getSessionId())
			// .getSessionDate());
			// vb.setSessionTime(service.getSessionById(service.getMyTickets(mem.getMemberId()).get(i).getSessionId())
			// .getSessionTime());
			// vb.setCinemaName(service.getCinemaById(
			// service.getSessionById(service.getMyTickets(mem.getMemberId()).get(i).getSessionId()).getCinemaId())
			// .getCinemaName());
			// vb.setSeat(service.getMyTickets(mem.getMemberId()).get(i).getSeat());
			// vb.setStatus(service.getMyTickets(mem.getMemberId()).get(i).getStatus());
			// vb.setTicketId(service.getMyTickets(mem.getMemberId()).get(i).getTicketId());
			vlist.add(vb);
		}
		model.addAttribute("views", vlist);
		return "booking/alterTicket";
	}

	@RequestMapping("/deleteTicket")
	public String deleteTicket(@RequestParam("id") Integer id, Model model) {
		service.deleteTicket(service.getTicketById(id));
		return "redirect:/myTicket";
	}

	@RequestMapping(value = "/getPicture/{bean}/{id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable String bean, @PathVariable Integer id) {
		byte[] media = null;
		String filename = "";
		if (bean.equals("movieBean")) {
			MovieBean mb = service.getMovieById(id);
			Blob blob = mb.getImage();
			filename = mb.getFileName();
			if (blob != null) {
				try {
					int len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				try {
					File file = ResourceUtils.getFile("classpath:data/img/noimage.png");
					media = Files.readAllBytes(file.toPath());
				} catch (Exception e) {
					e.printStackTrace();
				}
				filename = "noimage.png";
			}
		}
		if (bean.equals("cinemaBean")) {
			// 讀取內容超過40-60kb的varbinary
			CinemaBean cb = service.getCinemaById(id);
			filename = cb.getFileName();
			try {
				File file = ResourceUtils.getFile("classpath:data/img/theaters/" + filename);
				media = Files.readAllBytes(file.toPath());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
}
