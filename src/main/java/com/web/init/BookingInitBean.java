package com.web.init;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.web.service.EDMTableService;

@Component
public class BookingInitBean implements InitializingBean {

	@Autowired
	EDMTableService eDMTableService;

	@Override
	public void afterPropertiesSet() {
		eDMTableService.tableResetHibernate();
		eDMTableService.sessionResetHibernate();
	}
}
