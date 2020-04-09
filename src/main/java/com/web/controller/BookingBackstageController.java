package com.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.model.booking.MovieBean;
import com.web.service.BookingService;

/**
 * 後端電影管理
 * 
 * @author Bacon
 *
 */
@Controller
@RequestMapping("/backstage")
public class BookingBackstageController {

	@Autowired
	BookingService service;

	/**
	 * 按票房排序的所有電影
	 * 
	 * @param model
	 * @return movieBS.jsp
	 */
	@RequestMapping("/movie")
	public String getAllMovies(Model model) {
		model.addAttribute("movies", service.getAllMovies());
		return "booking/movieBS";
	}

	/**
	 * 修改電影資訊，根據電影編號查詢電影資訊放入input
	 * 
	 * @param id
	 * @param model
	 * @return alterMovieBS.jsp
	 */
	@RequestMapping(value = "/alterMovie", method = RequestMethod.GET)
	public String getMovieById(@RequestParam("movieid") Integer id, Model model) {
		model.addAttribute("movie", service.getMovieById(id));
		model.addAttribute("movieBean", new MovieBean());
		return "booking/alterMovieBS";
	}

	/**
	 * 修改電影資訊
	 * 
	 * @param mb
	 * @return mapping("/backstage/movie")
	 */
	@RequestMapping(value = "/alterMovie", method = RequestMethod.POST)
	public String updateMovie(@ModelAttribute("movieBean") MovieBean mb) {
		service.alterMovie(mb);
		return "redirect:/backstage/movie";
	}

	/**
	 * 刪除電影
	 * 
	 * @param id
	 * @return mapping("/backstage/movie")
	 */
	@RequestMapping("/deleteMovie")
	public String deleteMovie(@RequestParam("movieid") Integer id) {
		// TODO 電影如果是下架的話，改為更改status且不刪除
		service.deleteMovie(service.getMovieById(id));
		return "redirect:/backstage/movie";
	}

	/**
	 * 新增電影，addMovieBS前端因Demo方便帶入預設值
	 * 
	 * @param model
	 * @return addMovieBS.jsp
	 */
	@RequestMapping(value = "/addMovie", method = RequestMethod.GET)
	public String movieAddForm(Model model) {
		model.addAttribute("movieBean", new MovieBean());
		return "booking/addMovieBS";
	}

	/**
	 * 新增電影
	 * 
	 * @param mb
	 * @return mapping("/backstage/movie")
	 */
	@RequestMapping(value = "/addMovie", method = RequestMethod.POST)
	public String addMovie(@ModelAttribute("movieBean") MovieBean mb) {
		service.addMovie(mb);
		return "redirect:/backstage/movie";
	}

	// /**
	// * 利用ajax取得下拉選單值
	// *
	// * @return rateList
	// */
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
