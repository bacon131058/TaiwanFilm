package com.web.controller;

import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.web.config.ControllerUtil;
import com.web.model.member.MembersBean;
import com.web.model.message.MessageBean;
import com.web.model.message.ReplyBean;
import com.web.service.MembersService;
import com.web.service.MessageService;

@Controller
@SessionAttributes({ "members", "Login" })
public class MessageController {
	MessageService service;

	@Autowired
	public void setService(MessageService service) {
		this.service = service;
	}
	@Autowired
	MembersService  mservice;
	@Autowired
	ControllerUtil util;

	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

//模糊查詢 文章
	@GetMapping("/queryMessages")
	public String getMessageByTitle(String keyword, Model model) {

		List<MessageBean> list = service.getMessageByTitle(keyword);
		model.addAttribute("messages", list);
		System.out.println("keyword" + keyword);
		return "message/messages";
	}

//查詢所有資料
	@RequestMapping("/messages")
	public String list(Integer id, Model model) {
		List<MessageBean> list = service.getAllMessages();
		model.addAttribute("messages", list);
		return "message/messages";
	}

	// 後台查詢所有資料
	@RequestMapping("/replysB")
	public String listB(Integer id, Model model) {
		List<ReplyBean> list = service.getAllReplys();
		model.addAttribute("replys", list);
		return "message/replyB";
	}

	// 所有like排序
	@RequestMapping("/messageLike")
	public String like(Integer id, Model model) {
		List<MessageBean> list = service.getMessagesByLike();
		model.addAttribute("messages", list);
		return "message/messages";

	}

	// 所有date排序
	@RequestMapping("/createDate")
	public String Date(Integer id, Model model) {
		List<MessageBean> list = service.getMessagesByDate();
		model.addAttribute("messages", list);
		return "message/messages";

	}

//查詢分類
	@RequestMapping("/queryByCategory")
	public String getCategoryList(Model model) {
		List<String> list = service.getAllCategories();
		model.addAttribute("categoryList", list);
		return "message/category";
	}

// 查詢分類
	@RequestMapping("/messages/{messageCategory}")
	public String getMessagesByCategory(@PathVariable("messageCategory") String messageCategory, Model model) {
		List<MessageBean> messages = service.getMessagesByCategory(messageCategory);
		model.addAttribute("messages", messages);
		return "message/messages";
	}

//查詢單筆資料
	@RequestMapping("/message")
	public String getMessageById(@RequestParam("id") Integer id, Model model, HttpSession session) {
		MembersBean mem = (MembersBean) session.getAttribute("members");
		MessageBean bb = service.getMessageById(id);
		model.addAttribute("message", service.getMessageById(id));

//		MembersBean mb = service.getMemberNameById(bb.getMemberBean());
//		model.addAttribute("member", mb);
		bb.setMemberBean(mem);
		List<ReplyBean> list = service.getReplysByMessageId(id);
		model.addAttribute("replys", list);
		return "message/message";
	}
//	//查詢單筆修改資料
//		@RequestMapping("/updateMessage")
//		public String getUpdateMessageById(@RequestParam("id") Integer id, Model model, HttpSession session) {
//			MembersBean mem = (MembersBean) session.getAttribute("members");
//			MessageBean bb = service.getMessageById(id);
//			model.addAttribute("message", service.getMessageById(id));
//
//			MembersBean mb = service.getMemberNameById(bb.getMemberBean());
//			model.addAttribute("member", mb);
//
//			List<ReplyBean> list = service.getReplysByMessageId(id);
//			model.addAttribute("replys", list);
//			
//			return "message/Updatemessage";
//		}

//編輯文章
	@RequestMapping(value = "/update/message/{messageId}", method = RequestMethod.GET)
	public String UpdateMessage(@PathVariable("messageId") Integer messageId, Model model) {
		MessageBean mb = service.getMessageById(messageId);
		model.addAttribute("messageBean", mb);
		return "message/updateMessage";
	}

	@RequestMapping(value = "/update/message/{messageId}", method = RequestMethod.POST)
	public String UpdateMessage(@PathVariable("messageId") Integer messageId,
			@ModelAttribute("messageBean") MessageBean mb, Model model) {
		mb.setMessageId(messageId);
		service.updateMessage(mb);
		model.addAttribute("message", service.getMessageById(messageId));
		return "redirect:/message?id=" + messageId;
	}

	// 編輯留言
	@ResponseBody
	@PostMapping("/updateReply")
	public String UpdateReply(Integer replyId, String replyContent) {
		ReplyBean bean = new ReplyBean();
		bean.setReplyId(replyId);
		bean.setReplyContent(replyContent);

		service.updateReply(bean);
		System.out.println(bean.getReplyDate());
		return bean.getReplyDate();
	}

	// 刪除留言
	@RequestMapping(value = "/deleteReply/{messageId}", method = RequestMethod.GET)
	public String DeleteReply(@PathVariable("messageId") Integer messageId, Model model,
			@RequestParam("replyId") Integer replyId) {
		MessageBean mb = service.getMessageById(messageId);
		service.deleteReply(replyId);
		model.addAttribute("messageBean", mb);
		return "redirect:/message?id=" + messageId;
	}

	// 後台刪除留言
	@RequestMapping(value = "/deleteReplyB", method = RequestMethod.GET)
	public String DeleteReplyB(Model model,
			@RequestParam("replyId") Integer replyId) {
		service.deleteReplyB(replyId);
		return "redirect:/replysB";
	}
	// 後台復原留言
	@RequestMapping(value = "/resetReplyB", method = RequestMethod.GET)
	public String ResetReplyB(Model model,
			@RequestParam("replyId") Integer replyId) {
		service.resetReplyB(replyId);
		return "redirect:/replysB";
	}

	// 檢舉留言
	@RequestMapping(value = "/reportReply", method = RequestMethod.POST)
	public String ReportReply(Integer replyId, Integer replyReport) {
		ReplyBean bean = new ReplyBean();
		bean.setReplyId(replyId);
		bean.setReplyReport(replyReport);
		System.out.println(replyReport);
		service.reportReply(bean);
		System.out.println(replyId);
		return "success";
	}

//刪除文章
	@RequestMapping(value = "/deleteMessage/{messageId}", method = RequestMethod.GET)
	public String DeleteMessage(@PathVariable("messageId") Integer messageId, Model model) {
		MessageBean mb = service.getMessageById(messageId);
		service.deleteMessage(messageId);
		model.addAttribute("messageBean", mb);
		System.out.println(messageId);
		return "redirect:/createDate";
	}

	// @RequestMapping("/reply")
//	public String getReplyById(@RequestParam("id") Integer id, Model model) {
//		ReplyBean bb = service.getReplyById(id);
//		System.out.println(bb);
//		model.addAttribute("reply", service.getReplyById(id));
//		return "message";
//	}

//新增文章
	@RequestMapping(value = "/messages/add", method = RequestMethod.GET)
	public String getAddNewMessage(Model model, HttpSession session) {
		MessageBean bb = new MessageBean();
		model.addAttribute("messageBean", bb);

		MembersBean mem1 = (MembersBean) session.getAttribute("members");
		String requestURI = "messages";
		if (mem1 == null) {
			// 請使用者登入
			session.setAttribute("requestURI", requestURI);
			return "redirect:/register";
		}
		return "message/addMessage";
	}

	@RequestMapping(value = "/messages/add", method = RequestMethod.POST)
	public String processAddNewMessage(@ModelAttribute("messageBean") MessageBean bb,
//			@RequestParam("messageTitle") String messageTitle, 
//			@RequestParam("innerText") String innerText, @RequestParam("photoCount") Integer photoCount,
//			@RequestParam(value = "image0", required = false) MultipartFile file0,
//			@RequestParam(value = "image1", required = false) MultipartFile file1,
//			@RequestParam(value = "image2", required = false) MultipartFile file2,
//			@RequestParam(value = "image3", required = false) MultipartFile file3
			BindingResult result, HttpSession session) {
		MembersBean mem1 = (MembersBean) session.getAttribute("members");
//		bb.setInnerText(innerText);
//		bb.setMessageTitle(messageTitle);
//		bb.setPhotoCount(photoCount);
//		
//		bb.setImage01(image01);
//		bb.setImg01(util.getFileName(file0));
//bb.setImage02(util.fileTransformBlob(byte[] file1));
//		bb.setImg02(util.getFileName(file1));
//	bb.setImage03(util.fileTransformBlob(file2));
//		bb.setImg03(util.getFileName(file2));
//		bb.setImage04(util.fileTransformBlob(file3));
//		bb.setImg04(util.getFileName(file3));

		bb.setMemberBean(mservice.getMemberById(mem1.getMemberId()));
		service.addMessage(bb);
		return "redirect:/createDate";
	}

	// 按讚
	@ResponseBody
	@PostMapping("/like")
	public String addLike(Integer messageId, Integer messageLike) {
		MessageBean bean = new MessageBean();
		bean.setMessageId(messageId);
		bean.setMessageLike(messageLike);
		service.updateLike(bean);
		System.out.println(messageLike);
		return "success";
	}

	@ModelAttribute("categoryList")
	public List<String> getCategoryList() {
		return service.getAllCategories();
	}

	@InitBinder
	public void messageWhiteListing(WebDataBinder binder) {
		binder.setAllowedFields("messageContent", "messageCategory", "messageTitle", "messageId", "messageDelete","messageLike"
				);
	}

}
