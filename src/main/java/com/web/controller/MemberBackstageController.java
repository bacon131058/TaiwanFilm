package com.web.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.service.MembersService;

@Controller
public class MemberBackstageController {

	@Autowired
	MembersService service;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping(value="/MemberBackstage", method = RequestMethod.GET)
	public String MemberBackstage() {
		
		return "_01_register/";
		
	}
	
}
