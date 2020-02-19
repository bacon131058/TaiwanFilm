package com.web.shoppingCart.dao;

import java.sql.Connection;
import java.util.List;

import com.web.shoppingCart.model.OrderBean;



public interface OrderDao {

	void insertOrder(OrderBean ob);

	void setConnection(Connection con);

	OrderBean getOrder(int orderNo);

	List<OrderBean> getAllOrders();

	List<OrderBean> getMemberOrders(Integer memberId);
	
	//取得會員最新訂
	Integer getLatestMemOrder(Integer memberId);

}