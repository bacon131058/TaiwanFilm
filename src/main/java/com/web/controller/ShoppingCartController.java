package com.web.controller;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.model.booking.TicketBean;
import com.web.model.member.MembersBean;
import com.web.model.shopping.OrderBean;
import com.web.model.shopping.OrderItemBean;
import com.web.model.shopping.ShoppingCart;
import com.web.service.OrderService;

@Controller
public class ShoppingCartController {
	OrderService service;

	@Autowired
	public void setService(OrderService service) {
		this.service = service;

	}

	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

//	@RequestMapping("/CartNum")
//	public @ResponseBody Integer CartNum(HttpServletRequest request,HttpSession session){
//		
//		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
//		int num = cart.getItemNumber();
//		System.out.println("num="+num);
//		
//		return num;	
//	}

	@RequestMapping("/ShowCartContent")
	public String shoppingCart(Model model, HttpServletRequest request, HttpSession session) {

		MembersBean mem = (MembersBean) session.getAttribute("members");

		if (mem == null) {
			// 請使用者登入

			return "redirect:/register";
		}

		return "store/ShowCartContent";

	}

	// 修改刪除購物車
	@PostMapping("/UpdateItem")
	public String UpdateItem(HttpServletRequest request, HttpSession session) {

		if (session == null) { // 使用逾時

			return "index";
		}
		// 取出session物件內的ShoppingCart物件
		ShoppingCart sc = (ShoppingCart) session.getAttribute("ShoppingCart");
		if (sc == null) {
			// 如果找不到購物車(通常是Session逾時)，沒有必要往下執行
			// 導向首頁
			return "index";

		}
		// cmd可能是DEL或是MOD
		String cmd = request.getParameter("cmd");
		String bookIdStr = request.getParameter("bookId");
		int bookId = Integer.parseInt(bookIdStr.trim());
		if (cmd.equalsIgnoreCase("DEL")) {
			sc.deleteBook(bookId); // 刪除購物車內的某項商品

		} else if (cmd.equalsIgnoreCase("MOD")) {
			String newQtyStr = request.getParameter("newQty");
			int newQty = Integer.parseInt(newQtyStr.trim());
			sc.modifyQty(bookId, newQty); // 修改某項商品的數項

		}
		return "store/ShowCartContent";
	}

	@PostMapping("/clearCart")
	public String clearCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("11111");
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		if (cart != null) {
			// 由session物件中移除ShoppingCart物件
			session.removeAttribute("ShoppingCart");
		}
		System.out.println("2222");
		return "redirect://ShowCartContent";

	}

	@PostMapping("/checkout")
	public String checkout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		if (session == null) { // 使用逾時
			return "index";
		}

		ShoppingCart sc = (ShoppingCart) session.getAttribute("ShoppingCart");
		if (sc == null) {
			// 如果找不到購物車(通常是Session逾時)，沒有必要往下執行
			// 導向首頁
			return "index";
		}
		// 結帳
		return "store/OrderConfirm";
	}

	@PostMapping("/ProcessOrder")
	public String ProcessOrder(HttpServletRequest request) {
		String finalDecision = request.getParameter("finalDecision");
		HttpSession session = request.getSession(false);
		if (session == null) { // 使用逾時

			return "index";
		}
		MembersBean mb = (MembersBean) session.getAttribute("members");
		if (mb == null) {

			return "index";
		}
		ShoppingCart sc = (ShoppingCart) session.getAttribute("ShoppingCart");
		if (sc == null) {
			// 處理訂單時如果找不到購物車(通常是Session逾時)，沒有必要往下執行
			// 導向首頁

			return "index";
		}
		// 如果使用者取消訂單
		if (finalDecision.equals("CANCEL")) {
			session.removeAttribute("ShoppingCart");

			return "index";
		}
		Integer memberId = mb.getMemberId(); // 取出會員代號
		double totalAmount = Math.round(sc.getSubtotal()); // 計算訂單總金額
		String shippingAddress = request.getParameter("ShippingAddress"); // 出貨地址
		String bNO = request.getParameter("BNO"); // 發票的統一編號
		String invoiceTitle = request.getParameter("InvoiceTitle"); // 發票的抬頭
		Date today = new Date(); // 新增訂單的時間
		// 新建訂單物件。OrderBean:封裝一筆訂單資料的容器，包含訂單主檔與訂單明細檔的資料。目前只存放訂單主檔的資料。
		OrderBean ob = new OrderBean(null, memberId, totalAmount, shippingAddress, bNO, invoiceTitle, today, null,
				null);
		System.out.println(ReflectionToStringBuilder.toString(ob));
		// 取出存放在購物車內的商品，放入Map型態的變數cart，準備將其內的商品一個一個轉換為OrderItemBean，

		Map<Integer, OrderItemBean> content = sc.getContent();

		Set<OrderItemBean> items = new LinkedHashSet<>();
		Set<Integer> set = content.keySet();
		for (Integer i : set) {
			OrderItemBean oib = content.get(i);
			oib.setOrderBean(ob);
			items.add(oib);
		}

		// 執行到此，購物車內所有購買的商品已經全部轉換為為OrderItemBean物件，並放在Items內
		ob.setItems(items);
		try {

//			OrderService os = new OrderServiceImpl();
//
//			ServletContext sc2 = getServletContext();
//			WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(sc2);
//			OrderService orderService = ctx.getBean(OrderService.class);
			service.persistOrder(ob);
			System.out.println(ReflectionToStringBuilder.toString(ob));

			session.removeAttribute("ShoppingCart");

			return "redirect://showOrder";

		} catch (RuntimeException ex) {
			String message = ex.getMessage();
			String shortMsg = "";
			shortMsg = message.substring(message.indexOf(":") + 1);
			System.out.println(shortMsg);
			session.setAttribute("OrderErrorMessage", "處理訂單時發生異常: " + shortMsg + "，請調正訂單內容");

			return "store/ShowCartContent";
		}
	}
	
	@GetMapping("/showOrder")
	public String orderListdo(HttpSession session ,HttpServletRequest request) {
		
		
		
		MembersBean mb = (MembersBean) session.getAttribute("members");
		Integer memberId = mb.getMemberId();
		
		System.out.println("memberId"+memberId);
		
		
//		String orderNo = "22";
//		int no = Integer.parseInt(orderNo.trim());
		
		Integer no = service.getLatestMemOrder(memberId);
//		int no = Integer.parseInt(nostr.toString());
		
		OrderBean ob = service.getOrder(no);
		request.setAttribute("OrderBean", ob); // 將OrderBean物件暫存到請求物件內
		List<OrderBean> memberOrders = service.getMemberOrders(mb.getMemberId());
		System.out.println(ob);		
		
		return "store/orderSuccess";
	}
	//
	@GetMapping("/orderList.do")
	public String orderListdo(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
//		System.out.println("進入orderList");

		MembersBean mem = (MembersBean) session.getAttribute("members");
		
		if (mem == null) {
			// 請使用者登入

			return "redirect:/register";
		}
//		if (session == null) { // 使用逾時
//			return "index";
//		}
		MembersBean mb = (MembersBean) session.getAttribute("members");
//		OrderService os = new OrderServiceImpl();
//		ServletContext sc = getServletContext();
//		WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(sc);
//		OrderService os = ctx.getBean(OrderService.class);

		List<OrderBean> memberOrders = service.getMemberOrders(mb.getMemberId());
		request.setAttribute("memberOrders", memberOrders);

		return "store/OrderList";
	}

	@GetMapping("/orderDetail.do")
	public String orderDetail(HttpServletRequest request) {
		HttpSession session = request.getSession(false);

		MembersBean mb = (MembersBean) session.getAttribute("members");

		String orderNo = request.getParameter("orderNo");
		int no = Integer.parseInt(orderNo.trim());

//		OrderService orderService = new OrderServiceImpl();
//		ServletContext sc = getServletContext();
//		WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(sc);
//		OrderService orderService = ctx.getBean(OrderService.class);
		OrderBean ob = service.getOrder(no);
		request.setAttribute("OrderBean", ob); // 將OrderBean物件暫存到請求物件內
		List<OrderBean> memberOrders = service.getMemberOrders(mb.getMemberId());
		System.out.println(ob);

		return "store/ShowOrderDetail";
	}

	public void displayOrderBean(OrderBean ob) {
		System.out.println("ob.getOrderNo()=" + ob.getOrderNo());
		System.out.println("ob.getMemberId()=" + ob.getMemberId());
		System.out.println("ob.getOrderDate=" + ob.getOrderDate());
		System.out.println("ob.getTotalAmount=" + ob.getTotalAmount());
		System.out.println("ob.getInvoiceTitle=" + ob.getInvoiceTitle());
		System.out.println("ob.getBNO=" + ob.getBno());
		System.out.println("ob.getShippingAddress=" + ob.getShippingAddress());
		System.out.println("ob.getCancelTag=" + ob.getCancelTag());
		System.out.println("==============訂單明細=================");

		Set<OrderItemBean> items = ob.getItems();

		for (OrderItemBean oib : items) {
			System.out.println("---------------一筆明細---------------");
			System.out.println("   oib.getSeqno()=" + oib.getSeqno());
			System.out.println("   oib.getOrderNo()=" + oib.getOrderNo());
			System.out.println("   oib.getBookId()=" + oib.getBookId());
			System.out.println("   oib.getDescription()=" + oib.getDescription());
			System.out.println("   oib.getQuantity()=" + oib.getQuantity());
			System.out.println("   oib.getUnitPrice()=" + oib.getUnitPrice());
			System.out.println("   oib.getDiscount()=" + oib.getDiscount());
		}

	}
	
	
}
