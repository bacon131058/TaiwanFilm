package com.web.dao;

import java.sql.Connection;

import com.web.model.shopping.OrderItemBean;

public interface OrderItemDao {
	
	// 由 OrderItemBean取得商品價格(eBook#Price)。
		
	double findItemAmount(OrderItemBean oib);

//	int updateProductStock(OrderItemBean ob);
	
	void setConnection(Connection conn);
}
