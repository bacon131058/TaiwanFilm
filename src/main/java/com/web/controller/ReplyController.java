package com.web.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.model.member.MembersBean;
import com.web.model.message.MessageBean;
import com.web.model.message.ReplyBean;
import com.web.service.ReplyService;

@Controller
public class ReplyController  {
	ReplyService service;

	@Autowired
	public void setService(ReplyService service) {
		this.service = service;
	}

	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	@RequestMapping(value = "/replys/add", method = RequestMethod.GET)
	public String getAddReply(Model model) {
		ReplyBean rr = new ReplyBean();
		model.addAttribute("ReplyBean", rr);
		System.out.println("----------test1---------" + rr.getReplyContent());
		return "redirect:/replys/add";
	}
	
	@PostMapping("/replys/add")
	public String AddReplys(@ModelAttribute ReplyBean rr , BindingResult result ,
			@RequestParam("messageId") Integer messageId,
			Model model,HttpSession session) {	
		MembersBean mem1 = (MembersBean) session.getAttribute("members");
		
		String requestURI = "message?id=" +messageId;
		if (mem1 == null) {
			// 請使用者登入
			session.setAttribute("requestURI", requestURI);
			return "redirect:/register";
		}
		rr.setMembersBean(mem1);
		service.addReply(rr);
		return "redirect:/message?id="+messageId;
	}
}
