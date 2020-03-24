package com.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.OrderDao;
import com.web.dao.OrderItemDao;
import com.web.model.shopping.OrderBean;
import com.web.service.OrderService;


@Service
public class OrderServiceImpl implements OrderService {
//	private SessionFactory factory;
	private OrderItemDao oidao;
	@Autowired
	public void setOidao(OrderItemDao oidao) {
		this.oidao = oidao;
	}

	private OrderDao odao;
	@Autowired
	public void setOdao(OrderDao odao) {
		this.odao = odao;
	}


	public OrderServiceImpl() {
	}

	@Transactional
	@Override
	public void persistOrder(OrderBean ob) {

//			// 檢查並更新會員的未付款餘額
//			mdao.updateUnpaidOrderAmount(ob);
//			// 檢查每筆訂單明細所訂購之商品的庫存數量是否足夠
//			checkStock(ob);
			// 儲存該筆訂單
			odao.insertOrder(ob);


	}



	@Transactional
	@Override
// 本方法將由控制 Lazy Loading 的過濾器之doFilter()方法間接呼叫，所以不可以在此方法內執行與交易
// 有關的方法
	public OrderBean getOrder(int orderNo) {
		OrderBean bean = null;
		bean = odao.getOrder(orderNo);

		return bean;
	}

	@Transactional
	@Override
	public List<OrderBean> getAllOrders() {
		List<OrderBean> list = null;

			list = odao.getAllOrders();

		return list;
	}

	@Transactional
	@Override
	public List<OrderBean> getMemberOrders(Integer memberId) {
		return	odao.getMemberOrders(memberId);

		
	}


	@Transactional
	@Override
	public Integer getLatestMemOrder(Integer memberId) {
		
		return	odao.getLatestMemOrder(memberId);
	}
}
