package com.web.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.web.model.member.MembersBean;
import com.web.service.ActivityService;
import com.web.service.MembersService;


@Controller
@SessionAttributes({ "members", "Login" })
public class RegisterController {
	String noImage = "/WEB-INF/views/img/NoImage_Male.png";

	@Autowired
	MembersService service;
	@Autowired
	ServletContext context;

	@GetMapping("members/add")
	public String getAddNewMemberForm(Model model) {
		MembersBean member = new MembersBean();		
		member.setMemberMode("1");
		model.addAttribute("MembersBean", member);
		return "_01_register/registerNewMember";
	}
	
	@RequestMapping("/_01_register/MemberBackstage")
	public String MemberBackstage() {
		
		return "_01_register/MemberBackstage";
		
	}
	
	@ResponseBody
	@GetMapping("/emailChecker")
	public boolean emailChecker( 
			@RequestParam("email")
			String email) {
		boolean checker = false;
		if(service.emailExists(email)) {
			checker = true;
			return checker;	
		}else {			
			return checker;
		}				
		
	}

	@PostMapping("/_01_register/registerNewMember")
	public String processAddNewMemberForm(@ModelAttribute("MembersBean") MembersBean member, Model model) {
		member.setFileName("NoImage_Male.png");
		byte[] body = null;
		
		try {						
			String path = "/WEB-INF/views/img/NoImage_Male.png";
			body = fileToByteArray(path);
			Blob blob = new SerialBlob(body);
			member.setMemberImage(blob);

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());}
		try {
			service.saveMembers(member);
		} catch (org.hibernate.exception.ConstraintViolationException e) {
			return "_01_register/registerNewMember";
		} catch (Exception ex) {
			return "_01_register/registerNewMember";
		}

		return "redirect:/ToIndex";
 
	}
	
	@Autowired
	ActivityService ActiveService;
	@PostMapping("/Checklogin")
	public String memberCheckLogin(@ModelAttribute("MembersBean") MembersBean member, Model model, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) {
		if (request.getParameter("email") == null || request.getParameter("password") == null) {
			model.addAttribute("errorMessage", "帳號或密碼欄不能為空");
			return "_01_register/register";}
		MembersBean bean = null;
					bean = service.login(request.getParameter("email"),request.getParameter("password"));
			
			if(bean ==null) {
				model.addAttribute("errorMessage", "帳號或密碼錯誤");
				System.out.println("無此帳號");
				
				return "_01_register/register";	
				
			}
		if (bean.getMemberMode().equals("2") || bean.getMemberMode().equals("1") ) {
			//這個一定要有 bean.setMemberImage(null);
			bean.setMemberImage(null);
			model.addAttribute("members", bean);

			//建立Remember Cookie的預設值
			Cookie emailCookie = new Cookie("remEmail",null);
			Cookie pasCookie = new Cookie("remPassword",null);
			//檢查Remember有沒有被打勾
			if(request.getParameter("rememberBox") != null) {
				emailCookie = new Cookie("remEmail",request.getParameter("email"));
				pasCookie = new Cookie("remPassword",request.getParameter("password"));
			}else {
				emailCookie.setMaxAge(0);
				pasCookie.setMaxAge(0);
			}
			response.addCookie(emailCookie);
	        response.addCookie(pasCookie);
			// 記住原本的頁面, 登入後系統自動轉回原本的頁面。
			String requestURI = (String) session.getAttribute("requestURI");
			System.out.println("請求URI requestURI:"+requestURI);
			if (requestURI != null) {
				return "redirect:" + requestURI;
			}	        
			return "redirect:/";
		}else if(bean.getMemberMode().equals("0")) {
			model.addAttribute("errorMessage", "此帳號非會員狀態，請通知服務人員。");
			System.out.println("此帳號非會員");
			
			return "_01_register/register";	
		}else {
			model.addAttribute("errorMessage", "帳號不存在，請重新輸入或註冊帳號。");
			System.out.println("無此帳號");
			return "_01_register/register";
			
		}
	}

	@RequestMapping(value = "/UpdateMember")
	public String UpdateMember(Model model, @ModelAttribute("MembersBean") MembersBean member, 
			HttpSession session) {
		member = service.getMemberByBean(member);
		MembersBean member1 = (MembersBean) session.getAttribute("members");		
		model.addAttribute("members", member1);
		return "_01_register/registerUpdateMember";
	}

	@RequestMapping(value = "/_01_register/DoNotMember",method = RequestMethod.POST)
	public String DoNotMember(
			HttpServletRequest request,
			Model model, 
			HttpSession session) {
			System.out.println("修改會員狀態controller!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			MembersBean member = new MembersBean();
			member.setEmail(request.getParameter("email"));		
			member.setMemberMode(request.getParameter("memberMode"));
			System.out.println("controller取得的會員狀態為:"+request.getParameter("memberMode"));
			System.out.println("service.modifyMembers(member) :" + service.modifyMembers(member));
			if(service.modifyMembers(member)) {
				System.out.println("會員狀態修改成功");
				model.addAttribute("memberlist", service.getAllMembers());
				return "redirect:/ShowAllMembers";
			} else {
				System.out.println("會員狀態修改失敗");
				return "_01_register/DomodifyMember";
			}		
	
	}
	@RequestMapping(value = "/_01_register/DomodifyMember", method = RequestMethod.POST)
	public String DomodifyMember(
			@RequestParam("memImage")
	MultipartFile picture,
	HttpServletRequest request,
	Model model, 
	HttpSession session) {
		MembersBean member1 =(MembersBean) session.getAttribute("members");
		MembersBean member = new MembersBean(
			request.getParameter("memberName"),request.getParameter("email"),
			request.getParameter("gender"),request.getParameter("birthDay"));
		member.setPassword(member1.getPassword());
		if(member.getGender() == null) {
			member.setGender(member1.getGender());		
		}		
		String originalFilename = picture.getOriginalFilename();
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			member.setFileName(originalFilename);}

		if (!picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);		
				member.setMemberImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());}
		}else {
			member.setFileName(member1.getFileName());
			member.setMemberImage(member1.getMemberImage());
		}
			model.addAttribute("members", member);

		if(service.updateMembers(member)) {
			model.addAttribute("memberlist", service.getAllMembers());
			return "redirect:/ShowAllMembers";
		} else {
			System.out.println("更新失敗");
			return "redirect:/ShowAllMembers";
			
//			return "_01_register/DomodifyMember";
		}
		
	}

	@RequestMapping(value = "/_01_register/DoUpdateMember", method = RequestMethod.POST)
	public String DoUpdateMember(
//	@ModelAttribute("MembersBean") 
//	MembersBean member,
	@RequestParam("memImage")
	MultipartFile picture,
	HttpServletRequest request,
	Model model, 
	HttpSession session) throws ParseException {
		System.out.println("CON改資料");
		System.out.println("信箱" + request.getParameter("email"));
		System.out.println("姓名" + request.getParameter("memberName"));
		MembersBean member1 =(MembersBean) session.getAttribute("members");
		MembersBean member = new MembersBean(
				request.getParameter("memberName"),request.getParameter("email"),
				request.getParameter("gender"),request.getParameter("birthDay"));		
		member.setPassword(member1.getPassword());
		member.setMemberId(member1.getMemberId());
		String originalFilename = picture.getOriginalFilename();
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			member.setFileName(originalFilename);}
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				member.setMemberImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());}
			
//			member = service.getMemberByBean(member);
			model.addAttribute("members", member);

		if(service.updateMembers(member)) {
			System.out.println("會員資料修改成功");
			return "redirect:/";
		} else {
			return "redirect:/ToIndex";
		}
	}

	@GetMapping("/crm/picture/{id}")
	public ResponseEntity<byte[]> getPicture(@PathVariable("id") Integer id) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());

		MembersBean member = service.getMemberById(id);
		if (member == null) {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}
		String filename = member.getFileName();
		if (filename != null) {
			if (filename.toLowerCase().endsWith("jfif")) {
				mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
			} else {
				mediaType = MediaType.valueOf(context.getMimeType(filename));
				headers.setContentType(mediaType);
			}
		}
		Blob blob = member.getMemberImage();
		if (blob != null) {
			body = blobToByteArray(blob);
		} else {
			String path = null;
			if (member.getGender() == null || member.getGender().length() == 0) {
//				path = noImageMale;
			} else if (member.getGender().equals("M")) {
//				path = noImageMale;
			} else {
//				path = noImageFemale;
				;
			}
			body = fileToByteArray(path);
		}
		re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);

		return re;
	}
	public byte[] blobToByteArray(Blob blob) {
		byte[] result = null;
		try (InputStream is = blob.getBinaryStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}
	private byte[] fileToByteArray(String path) {
		byte[] result = null;
		try (InputStream is = context.getResourceAsStream(path);
				ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
@GetMapping("/ShowAllMembers")
public String list(Model model) {
		model.addAttribute("memberlist", service.getAllMembers());
	 return "_01_register/allMembers";
 }
 
 @GetMapping("/_01_register/modify/{id}")
 public String modifyMembers(Model model,
		 @PathVariable
		 Integer id) {
	 MembersBean mem = service.getMemberById(id);
	 model.addAttribute("members",mem);
	 return "_01_register/modifyMemberDetail";
 	}
 
	@GetMapping("/ToIndex")
	public String returnToIndex() {	
		return "index";
	}
	
	@RequestMapping("/register")
	public String register() {
		return "_01_register/register";
	}



	@GetMapping("/FuzzyQuery")
	public String FuzzyQuery(String keyword,Model model)  {

		List<MembersBean> list = service.getMemberByName(keyword); 
		model.addAttribute("memberlist", list);
		System.out.println("keyword 是:" + keyword);
		return "_01_register/allMembers";
	}

 
}
