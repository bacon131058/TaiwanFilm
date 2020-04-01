package com.web.init;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.web.service.InitDataService;

@Component
public class BookingInitBean implements InitializingBean {

	@Autowired
	InitDataService initDataService;

	@Override
	public void afterPropertiesSet() {
		initDataService.insertInitData();
	}
}
