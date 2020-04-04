package com.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.model.booking.MovieBean;
import com.web.model.member.MembersBean;
import com.web.service.BookingService;

@Controller
public class HomeController {

	// @Autowired
	// ActivityService ActiveService;

	@Autowired
	BookingService bookingService;

	// @Autowired
	// ProposalService PropService;

	@RequestMapping("/") // 看到斜線 就走去index
	public String home(Model model, HttpSession session) {
		// List<activityBean> activityList = ActiveService.getAllActivitiesExceptStatusEqualOne();
		// model.addAttribute("activityList", activityList);
		//
		// List<activityBean> activityListViews = ActiveService.getAllActivitiesExceptStatusEqualOneViews();
		// model.addAttribute("activitiesViews", activityListViews);
		//
		// List<activityBean> activityListStart = ActiveService.getAllActivitiesExceptStatusEqualOneStart();
		// model.addAttribute("activitiesStart", activityListStart);
		//
		// List<activityBean> activityListEnd = ActiveService.getAllActivitiesExceptStatusEqualOneStart();
		// model.addAttribute("activitiesEnd", activityListEnd);

		List<MovieBean> list = bookingService.getAllMovies();
		model.addAttribute("movies", list);

		// ProjectBean projBean = PropService.GetProjBean(1);
		// model.addAttribute("projectBean", projBean);
		//
		String testNum = "0";
		MembersBean mbBean = (MembersBean) session.getAttribute("members");
		if (mbBean != null) {
			testNum = mbBean.getMemberMode();
		}
		model.addAttribute("members", mbBean);
		model.addAttribute("testNum", testNum);
		return "index";
	}

}
