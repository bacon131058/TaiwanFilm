package com.web.booking.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.web.booking.model.cinemaBean;
import com.web.booking.model.movieBean;
import com.web.booking.model.sessionBean;
import com.web.booking.model.ticketBean;
import com.web.booking.model.viewBean;
import com.web.booking.service.bookingService;
import com.web.login.Model.MembersBean;

@Controller
public class bookingController {

	bookingService service;

	@Autowired
	public void setService(bookingService service) {
		this.service = service;
	}

	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	@RequestMapping("/alterMovie")
	public String alterMovie(Model model) {
		List<movieBean> list = service.getAllMovies();
		model.addAttribute("movies", list);
		return "booking/alterMovie";
	}

	@RequestMapping(value = "/alterMovieDetail", method = RequestMethod.GET)
	public String getAlterMovieDetail(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("movie", service.getMovieById(id));
		movieBean mb = new movieBean();
		model.addAttribute("movieBean", mb);
		return "booking/alterMovieDetail";
	}

	@RequestMapping(value = "/alterMovieDetail", method = RequestMethod.POST)
	public String alterMovieDetail(@RequestParam(value = "id", required = true) Integer id,
			@ModelAttribute("movieBean") movieBean mb, BindingResult result) {
		movieBean mb0 = service.getMovieById(id);
		mb.setMovieId(id);
		mb.setSoldQuantity(mb0.getSoldQuantity());
		mb.setType(mb.getType().replaceAll(",", "、"));
		mb.setFileName(mb0.getFileName());
		mb.setImage(mb0.getImage());

		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}

		MultipartFile fileImage = mb.getFileImage();
		String originalFilename = fileImage.getOriginalFilename();

		if (fileImage != null && !fileImage.isEmpty()) {
			try {
				byte[] b = fileImage.getBytes();
				Blob blob = new SerialBlob(b);
				mb.setFileName(originalFilename);
				mb.setImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		service.alterMovieDetail(mb);
		return "redirect:/alterMovie";
	}

	@RequestMapping("/deleteMovieDetail")
	public String deleteMovieDetail(@RequestParam("id") Integer id, Model model) {
		service.deleteMovieDetail(service.getMovieById(id));
		return "redirect:/alterMovie";
	}

	@RequestMapping(value = "/addMovie", method = RequestMethod.GET)
	public String getAddNewProductForm(Model model) {
		movieBean mb = new movieBean();
		model.addAttribute("movieBean", mb);
		return "booking/addMovie";
	}

	@RequestMapping(value = "/addMovie", method = RequestMethod.POST)
	public String processAddNewProductForm(@ModelAttribute("movieBean") movieBean mb, BindingResult result) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}

		MultipartFile fileImage = mb.getFileImage();
		String originalFilename = fileImage.getOriginalFilename();
		mb.setFileName(originalFilename);
		if (fileImage != null && !fileImage.isEmpty()) {
			try {
				byte[] b = fileImage.getBytes();
				Blob blob = new SerialBlob(b);
				mb.setImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		mb.setType(mb.getType().replaceAll(",", "、"));
		service.addMovie(mb);

		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = context.getRealPath("/");
		try {
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists())
				imageFolder.mkdirs();
			File file = new File(imageFolder, mb.getMovieId() + ext);
			fileImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}

		return "redirect:/alterMovie";
	}

//	@ModelAttribute("rateList")
//	public List<String> getRateList() {
//		List<String> rateList = new ArrayList<String>();
//		rateList.add("普遍級 0+");
//		rateList.add("保護級 6+");
//		rateList.add("輔導級 12+");
//		rateList.add("輔導級 15+");
//		rateList.add("限制級 18+");
//		return rateList;
//	}

	@RequestMapping("/movieIntro")
	public String list(Model model) {
		List<movieBean> list = service.getAllMovies();
		model.addAttribute("movies", list);
		List<movieBean> downlist = service.getAllMoviesOrder();
		model.addAttribute("downmovies", downlist);
		return "booking/movieIntro";
	}

	@RequestMapping("/movieDetail")
	public String getProductsById(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("movie", service.getMovieById(id));
		return "booking/movieDetail";
	}

	@RequestMapping("/booking")
	public String booking(@RequestParam("id") Integer id, Model model, HttpSession session, HttpServletRequest request)
			throws IOException {
		MembersBean mem = (MembersBean) session.getAttribute("members");
		String requestURI = "movieDetail?id=" + id;
		if (mem == null) {
			// 請使用者登入
			session.setAttribute("requestURI", requestURI);
			return "redirect:/register";
		}
		model.addAttribute("movie", service.getMovieById(id));
		List<sessionBean> slist = service.getAllSessionsByMovieId(id);
		List<cinemaBean> clist = service.getAllCinemas();
		model.addAttribute("sessions", slist);
		model.addAttribute("cinemas", clist);
		return "booking/booking";
	}

	@RequestMapping("/bookRule")
	public String bookRule() {
		return "booking/bookRule";
	}

	@RequestMapping(value = "/seatChoose", method = RequestMethod.GET)
	public String seatChoose(@RequestParam("id") Integer id, Model model) {
		List<ticketBean> tlist = service.getAllTicketsBySessionId(id);
		model.addAttribute("tickets", tlist);
		model.addAttribute("session", service.getSessionById(id));
		model.addAttribute("movie", service.getMovieBySessionId(id));
		model.addAttribute("cinema", service.getCinemaBySessionId(id));
		ticketBean tb = new ticketBean();
		model.addAttribute("ticketBean", tb);
		return "booking/seatChoose";
	}

	@RequestMapping(value = "/seatChoose", method = RequestMethod.POST)
	public String addTicketForm(@ModelAttribute("ticketBean") ticketBean tb, HttpSession session) {
		MembersBean mem = (MembersBean) session.getAttribute("members");
//		System.out.println("--------------------");
//		System.out.println(mem.getMemberId());
		tb.setMemberId(mem.getMemberId());
		service.addTicket(tb);
		service.addSoldQuantity(tb);
		return "redirect:/bookSuccess?id=" + tb.getTicketId();
	}

	@RequestMapping("/bookSuccess")
	public String bookSuccess(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("ticket", service.getTicketById(id));
		ticketBean tb = service.getTicketById(id);
//		model.addAttribute("member", service.getMemberById(tb.getMemberId()));
		sessionBean sb = tb.getSessionId();
		model.addAttribute("session", sb);
		model.addAttribute("movie", service.getMovieById(sb.getMovieId()));
		model.addAttribute("cinema", service.getCinemaById(sb.getCinemaId()));
		return "booking/bookSuccess";
	}

	@RequestMapping("/alterTicket")
	public String alterTicket(Model model, HttpSession session) {
		MembersBean mem = (MembersBean) session.getAttribute("members");
//		int memberId = 0;
		List<viewBean> vlist = new ArrayList<>();
		int tsize = service.getMyTickets(mem.getMemberId()).size();
		for (int i = 0; i < tsize; i++) {
			viewBean vb = new viewBean();
			ticketBean tb = service.getMyTickets(mem.getMemberId()).get(i);
			sessionBean sb = tb.getSessionId();
			cinemaBean cb = service.getCinemaById(sb.getCinemaId());
			movieBean mb = service.getMovieById(sb.getMovieId());

			vb.setMovieName(mb.getMovieName());
			vb.setEnglishName(mb.getEnglishName());
			vb.setSessionDate(sb.getSessionDate());
			vb.setSessionTime(sb.getSessionTime());
			vb.setCinemaName(cb.getCinemaName());

			vb.setSeat(tb.getSeat());
			vb.setStatus(tb.getStatus());
			vb.setTicketId(tb.getTicketId());
//			vb.setMovieName(service.getMovieById(
//					service.getSessionById(service.getMyTickets(mem.getMemberId()).get(i).getSessionId()).getMovieId())
//					.getMovieName());
//			vb.setEnglishName(service.getMovieById(
//					service.getSessionById(service.getMyTickets(mem.getMemberId()).get(i).getSessionId()).getMovieId())
//					.getEnglishName());
//			vb.setSessionDate(service.getSessionById(service.getMyTickets(mem.getMemberId()).get(i).getSessionId())
//					.getSessionDate());
//			vb.setSessionTime(service.getSessionById(service.getMyTickets(mem.getMemberId()).get(i).getSessionId())
//					.getSessionTime());
//			vb.setCinemaName(service.getCinemaById(
//					service.getSessionById(service.getMyTickets(mem.getMemberId()).get(i).getSessionId()).getCinemaId())
//					.getCinemaName());
//			vb.setSeat(service.getMyTickets(mem.getMemberId()).get(i).getSeat());
//			vb.setStatus(service.getMyTickets(mem.getMemberId()).get(i).getStatus());
//			vb.setTicketId(service.getMyTickets(mem.getMemberId()).get(i).getTicketId());
			vlist.add(vb);
		}
		model.addAttribute("views", vlist);
		return "booking/alterTicket";
	}

	@RequestMapping("/deleteTicket")
	public String deleteTicket(@RequestParam("id") Integer id, Model model) {
		service.deleteTicket(service.getTicketById(id));
		return "redirect:/alterTicket";
	}

	@RequestMapping(value = "/getPicture/{bean}/{id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable String bean,
			@PathVariable Integer id) {
		String filePath = "/resources/images/NoImage.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		movieBean mb = service.getMovieById(id);
		cinemaBean cb = service.getCinemaById(id);

		if (bean != null) {
			Blob blob;
			if (bean.equals("movieBean")) {
				blob = mb.getImage();
				filename = mb.getFileName();
			} else {
				blob = cb.getImage();
				filename = cb.getFileName();
			}
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
}
