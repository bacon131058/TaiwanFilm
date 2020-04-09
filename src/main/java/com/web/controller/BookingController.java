package com.web.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.model.booking.SessionBean;
import com.web.model.booking.TicketBean;
import com.web.model.member.MembersBean;
import com.web.service.BookingService;

/**
 * 戲院系統
 * 
 * @author Bacon
 *
 */
@Controller
public class BookingController {

	@Autowired
	BookingService service;

	/**
	 * 兩種排序方式的所有電影： 1.按票房排序 2.按下映時間排序
	 * 
	 * @param model
	 * @return movie.jsp
	 */
	@RequestMapping("/movie")
	public String getAllMovies(Model model) {
		model.addAttribute("movies", service.getAllMovies());
		model.addAttribute("downMovies", service.getAllMoviesOrder());
		return "booking/movie";
	}

	/**
	 * 根據電影編號查詢電影資訊
	 * 
	 * @param id
	 *            movie_id
	 * @param model
	 * @return movieInfo.jsp
	 */
	@RequestMapping("/movieInfo")
	public String getMovieById(@RequestParam("movieid") Integer id, Model model) {
		model.addAttribute("movie", service.getMovieById(id));
		return "booking/movieInfo";
	}

	/**
	 * 所有戲院 + 該電影對應的所有場次
	 * 
	 * @param id
	 *            movie_id
	 * @param model
	 * @param session
	 * @param request
	 * @return cinemaChoose.jsp
	 */
	@RequestMapping("/cinema")
	public String getSessionByMovieId(@RequestParam("movieid") Integer id, Model model, HttpSession session, HttpServletRequest request) {
		MembersBean mem = (MembersBean) session.getAttribute("members");
		String requestURI = "movieDetail?movieid=" + id;
		// 如果使用者沒有登入，請使用者登入
		if (mem == null) {
			// 記住他現在的頁面，登入後返回
			session.setAttribute("requestURI", requestURI);
			return "redirect:/register";
		}
		model.addAttribute("cinemas", service.getAllCinemas());
		model.addAttribute("sessions", service.getAllSessionsByMovieId(id));
		return "booking/cinemaChoose";
	}

	// /**
	// * 要求使用者同意訂票須知
	// * @return bookRule.jsp
	// */
	// @RequestMapping("/bookRule")
	// public String bookRule() {
	// return "booking/bookRule";
	// }

	/**
	 * 單一查詢場次資訊 + 該場次對應的所有已售出位置
	 * 
	 * @param id
	 *            session_id
	 * @param model
	 * @return seatChoose.jsp
	 */
	@RequestMapping(value = "/seatChoose", method = RequestMethod.GET)
	public String getSessionById(@RequestParam("sessionid") Integer id, Model model) {
		SessionBean sb = service.getSessionById(id);
		model.addAttribute("session", sb);
		model.addAttribute("tickets", service.getAllTicketsBySessionBean(sb));
		model.addAttribute("ticketBean", new TicketBean());
		return "booking/seatChoose";
	}

	/**
	 * 訂票 + 修改電影票房資訊
	 * 
	 * @param id
	 *            session_id
	 * @param tb
	 *            ticketBean
	 * @param session
	 * @return mapping("/success")
	 */
	@RequestMapping(value = "/seatChoose", method = RequestMethod.POST)
	public String addTicket(@RequestParam(value = "sessionid", required = true) Integer id, @ModelAttribute("ticketBean") TicketBean tb, HttpSession session) {
		MembersBean mem = (MembersBean) session.getAttribute("members");
		service.addTicket(tb, mem, id);
		return "redirect:/success?ticketid=" + tb.getTicketId();
	}

	/**
	 * 訂票成功，顯示電影票資訊
	 * 
	 * @param id
	 * @param model
	 * @return bookSuccess.jsp
	 */
	@RequestMapping("/success")
	public String getTicketById(@RequestParam("ticketid") Integer id, Model model) {
		model.addAttribute("ticket", service.getTicketById(id));
		return "booking/bookSuccess";
	}

	/**
	 * 查詢訂票紀錄
	 * 
	 * @param model
	 * @param session
	 * @return myTicket.jsp
	 */
	@RequestMapping("/myTicket")
	public String getTicketByMemberId(Model model, HttpSession session) {
		MembersBean mem = (MembersBean) session.getAttribute("members");
		model.addAttribute("tickets", service.getTicketsByMemberBean(mem));
		return "booking/myTicket";
	}

	/**
	 * 取消已訂購的電影票
	 * 
	 * @param id
	 * @param model
	 * @return mapping("/myTicket")
	 */
	@RequestMapping("/deleteTicket")
	public String deleteTicket(@RequestParam("ticketid") Integer id, Model model) {
		service.deleteTicket(service.getTicketById(id));
		return "redirect:/myTicket";
	}

	/**
	 * 取得圖片
	 * 
	 * @param resp
	 * @param bean
	 *            1.movieBean 2.cinemaBean
	 * @param id
	 *            1.movie_id 2.cinema_id
	 * @return image
	 */
	@RequestMapping(value = "/getPicture/{bean}/{id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable String bean, @PathVariable Integer id) {
		byte[] media = service.getPicture(bean, id);
		MediaType mediaType = service.getTypeByFileName(bean, id);
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		headers.setContentType(mediaType);
		return new ResponseEntity<byte[]>(media, headers, HttpStatus.OK);
	}
}
