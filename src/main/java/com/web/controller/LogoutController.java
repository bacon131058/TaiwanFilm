package com.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.web.model.activity.activityBean;
import com.web.service.ActivityService;


@Controller
public class LogoutController {
	@Autowired
	ActivityService ActiveService;
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, SessionStatus session,Model model){
	    session.setComplete();
	    request.getSession().invalidate();
	    System.out.println("會員登出");
	    List<activityBean> activityList = ActiveService.getAllActivitiesExceptStatusEqualOne();
		model.addAttribute("activityList", activityList);
		
		List<activityBean> activityListViews = ActiveService.getAllActivitiesExceptStatusEqualOneViews();
		model.addAttribute("activitiesViews", activityListViews);
		
		List<activityBean> activityListStart = ActiveService.getAllActivitiesExceptStatusEqualOneStart();
		model.addAttribute("activitiesStart", activityListStart);
		
		List<activityBean> activityListEnd = ActiveService.getAllActivitiesExceptStatusEqualOneStart();
		model.addAttribute("activitiesEnd", activityListEnd);

	    return "index"; 
	}

}
