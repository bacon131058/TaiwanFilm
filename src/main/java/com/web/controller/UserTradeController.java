package com.web.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.model.member.MembersBean;
import com.web.model.raisefunding.DonatePlanBean;
import com.web.model.raisefunding.PurchaseBean;
import com.web.service.DonatePlanService;
import com.web.service.MembersService;

@Controller
public class UserTradeController {
	@Autowired
	DonatePlanService dpService;
	@Autowired
	ServletContext context;
	@Autowired
	MembersService membService;
	
	//進入個別贊助方案的寄送表單
	@GetMapping("/donatePlan{id}")
	public String donatePlanToPurchase(@PathVariable("id") Integer planId,DonatePlanBean dpBean,
			PurchaseBean pcBean , Model model ,HttpSession session) {
		MembersBean mem = (MembersBean) session.getAttribute("members");
		String requestURI = "/donatePlan" + planId;
		if (mem == null) {
			// 請使用者登入
			session.setAttribute("requestURI", requestURI);
			return "redirect:/register";
		}
		model.addAttribute("PurchaseBean",pcBean);
		dpBean = dpService.getDonateBean(planId);
		model.addAttribute("dpBean",dpBean);
		return "raiseFunding/purchase";
	}
	//送出購買單次贊助方案的表單
	@PostMapping("/newPurchase")
	public String createNewPurchase(@ModelAttribute("PurchaseBean") PurchaseBean pcBean ,
			@RequestParam("planId") Integer planId ,@RequestParam("localeDate") String localedate,
			@RequestParam("localeDate") String orderDate,@RequestParam("payAmount") Integer payAmount,
			HttpSession session , Model model){
		MembersBean mbBean = (MembersBean) session.getAttribute("members");
		DonatePlanBean dpBean =  dpService.getDonateBean(planId);
		pcBean.setPayAmount(payAmount);
		pcBean.setOrderDate(orderDate);
		pcBean.setMbBean(membService.getMemberById(mbBean.getMemberId()));
		pcBean.setProjBean(dpBean.getProjBean());
		pcBean.setDpBean(dpBean);
		dpService.createPurchaseData(pcBean);
		//假設已經完成結帳， 下面進行資料庫的更新，理論上應該是執行付費確認之後的controller運算
		dpService.DonatingTransaction(pcBean);
		model.addAttribute("pcBean",pcBean);
		return "raiseFunding/thankSupport";
	}
	//取得個人已贊助的網頁
	@GetMapping("/member/purchase")
	public String getPersonalPurchase(
			HttpSession session,
			Model model
			){
		MembersBean mbBean = (MembersBean) session.getAttribute("members");
		String requestURI = "/member/purchase";
		if (mbBean == null) {
			// 請使用者登入
			session.setAttribute("requestURI", requestURI);
			return "redirect:/register";
		}
		List<PurchaseBean> pcBeans = dpService.getPersonalPurchases(mbBean.getMemberId());
		model.addAttribute("mbBean",mbBean);
		model.addAttribute("pcBeans",pcBeans);
		return "raiseFunding/personalPage";
	}
}
