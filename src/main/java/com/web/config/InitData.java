package com.web.config;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.web.init.BookingInitDataService;
import com.web.init.MemberInitDataService;

@Component
public class InitData implements InitializingBean {

	@Autowired
	BookingInitDataService bookingInitDataService;
	
	@Autowired
	MemberInitDataService memberInitDataService;

	@Override
	public void afterPropertiesSet() {
		// bookingInitDataService.insertInitData();
		// memberInitDataService.insertInitData();
	}
}
