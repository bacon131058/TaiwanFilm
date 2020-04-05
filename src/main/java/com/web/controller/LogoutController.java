package com.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;


@Controller
public class LogoutController {
//	@Autowired
//	ActivityService ActiveService;
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, SessionStatus session,Model model){
	    session.setComplete();
	    request.getSession().invalidate();
	    System.out.println("會員登出");
//	    List<activityBean> activityList = ActiveService.getAllActivitiesExceptStatusEqualOne();
//		model.addAttribute("activityList", activityList);
//		
//		List<activityBean> activityListViews = ActiveService.getAllActivitiesExceptStatusEqualOneViews();
//		model.addAttribute("activitiesViews", activityListViews);
//		
//		List<activityBean> activityListStart = ActiveService.getAllActivitiesExceptStatusEqualOneStart();
//		model.addAttribute("activitiesStart", activityListStart);
//		
//		List<activityBean> activityListEnd = ActiveService.getAllActivitiesExceptStatusEqualOneStart();
//		model.addAttribute("activitiesEnd", activityListEnd);

	    return "redirect:/"; 
	}

}
