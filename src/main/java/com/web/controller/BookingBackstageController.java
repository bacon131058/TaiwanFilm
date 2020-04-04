package com.web.controller;

import java.io.File;
import java.nio.file.Files;
import java.sql.Blob;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.web.model.booking.MovieBean;
import com.web.model.booking.MovieStatusEnum;
import com.web.service.BookingService;

@Controller
@RequestMapping("/backstage")
public class BookingBackstageController {

	@Autowired
	BookingService service;

	@RequestMapping("/movie")
	public String getAllMovies(Model model) {
		List<MovieBean> list = service.getAllMovies();
		model.addAttribute("movies", list);
		return "booking/alterMovie";
	}

	@RequestMapping(value = "/alterMovie", method = RequestMethod.GET)
	public String getMovieById(@RequestParam("movieid") Integer id, Model model) {
		model.addAttribute("movie", service.getMovieById(id));
		MovieBean mb = new MovieBean();
		model.addAttribute("movieBean", mb);
		return "booking/alterMovieDetail";
	}

	@RequestMapping(value = "/alterMovie", method = RequestMethod.POST)
	public String updateMovie(@RequestParam(value = "movieid", required = true) Integer id, @ModelAttribute("movieBean") MovieBean mb) {
		MovieBean mbInit = service.getMovieById(id);
		// mb.setMovieId(id);
		// mb.setSoldQuantity(mb0.getSoldQuantity());
		// mb.setType(mb.getType().replaceAll(",", "、"));
		// mb.setFileName(mb0.getFileName());
		// mb.setImage(mb0.getImage());
		mbInit.setMovieName(mb.getMovieName());
		mbInit.setEnglishName(mb.getEnglishName());
		mbInit.setReleaseDate(mb.getReleaseDate());
		mbInit.setDirector(mb.getDirector());
		mbInit.setActor(mb.getActor());
		mbInit.setType(mb.getType());
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
		service.alterMovieDetail(mbInit);
		return "redirect:/backstage/movie";
	}

	@RequestMapping("/deleteMovie")
	public String deleteMovie(@RequestParam("movieid") Integer id, Model model) {
		// TODO 電影如果是下架的話，改為更改status且不刪除
		service.deleteMovieDetail(service.getMovieById(id));
		return "redirect:/backstage/movie";
	}

	@RequestMapping(value = "/addMovie", method = RequestMethod.GET)
	public String createMovie(Model model) {
		MovieBean mb = new MovieBean();
		model.addAttribute("movieBean", mb);
		return "booking/addMovie";
	}

	@RequestMapping(value = "/addMovie", method = RequestMethod.POST)
	public String processAddNewProductForm(@ModelAttribute("movieBean") MovieBean mb) {
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
		service.addMovie(mb);
		return "redirect:/backstage/movie";
	}

	// @ModelAttribute("rateList")
	// public List<String> getRateList() {
	// List<String> rateList = new ArrayList<String>();
	// rateList.add("普遍級 0+");
	// rateList.add("保護級 6+");
	// rateList.add("輔導級 12+");
	// rateList.add("輔導級 15+");
	// rateList.add("限制級 18+");
	// return rateList;
	// }
}
