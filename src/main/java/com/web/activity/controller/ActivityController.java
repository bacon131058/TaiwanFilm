package com.web.activity.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;

import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.activity.model.activityBean;
import com.web.activity.model.activitySignUpBean;
import com.web.activity.service.ActivityService;

@Controller
public class ActivityController {
	@Autowired
	ActivityService service;

	
	// 讓我一進來就是未登入狀態下的活動頁面
//	@RequestMapping("/")
	public String Activityhome() {
		return "redirect:/activities";
		
	}
	@RequestMapping("/backstage")
	public String ActivityLogINNot1() {
		return "backstage";
	}
	
	
	@Autowired
	ServletContext context;

	/* 查多筆 未登入 */
	@RequestMapping("/activities")
	public String ActivityLogINNot(Model model) {
		List<activityBean> activityList = service.getAllActivitiesExceptStatusEqualOne();
		model.addAttribute("activityList", activityList);
		
		List<activityBean> activityListViews = service.getAllActivitiesExceptStatusEqualOneViews();
		model.addAttribute("activitiesViews", activityListViews);
		
		List<activityBean> activityListStart = service.getAllActivitiesExceptStatusEqualOneStart();
		model.addAttribute("activitiesStart", activityListStart);
		
		List<activityBean> activityListEnd = service.getAllActivitiesExceptStatusEqualOneStart();
		model.addAttribute("activitiesEnd", activityListEnd);
		
		return "activity/activities";
	}

	/* 查多筆 後台登入*/
	@RequestMapping("/activitiesM")
	public String ActivityLogINO(Model model) {
		List<activityBean> activityList = service.getAllActivitiesExceptStatusEqualOne();
		model.addAttribute("activityList", activityList);
		
		List<activityBean> activityListViews = service.getAllActivitiesExceptStatusEqualOneViews();
		model.addAttribute("activitiesViews", activityListViews);
		
		List<activityBean> activityListStart = service.getAllActivitiesExceptStatusEqualOneStart();
		model.addAttribute("activitiesStart", activityListStart);
		
		List<activityBean> activityListEnd = service.getAllActivitiesExceptStatusEqualOneStart();
		model.addAttribute("activitiesEnd", activityListEnd);
		
		return "activity/activitiesM";
	}	
	
	/* 查多筆 一般登入*/
	@RequestMapping("/activitiesN")
	public String ActivityLogINNormal(Model model) {
		List<activityBean> activityList = service.getAllActivitiesExceptStatusEqualOne();
		model.addAttribute("activityList", activityList);
		
		List<activityBean> activityListViews = service.getAllActivitiesExceptStatusEqualOneViews();
		model.addAttribute("activitiesViews", activityListViews);
		
		List<activityBean> activityListStart = service.getAllActivitiesExceptStatusEqualOneStart();
		model.addAttribute("activitiesStart", activityListStart);
		
		List<activityBean> activityListEnd = service.getAllActivitiesExceptStatusEqualOneStart();
		model.addAttribute("activitiesEnd", activityListEnd);
		
		return "activity/activitiesN";
	}	

	/* 查單筆M */
	@RequestMapping("/activityM/{activityId}")
	public String getActivityByIdM(@PathVariable("activityId") Integer activityId, Model model) {
		activityBean ab = service.getActivityById(activityId);
		model.addAttribute("activity", ab);
		return "activity/activityM";

	}	
 
	
	
	

	/* insert資料 */
	@RequestMapping(value = "/addActivities", method = RequestMethod.GET)
	public String getAddNewActivityForm(Model model) {
		activityBean ab = new activityBean();
		model.addAttribute("activityBean", ab);
		return "activity/addActivity";
	}



	@RequestMapping(value = "/addActivities", method = RequestMethod.POST)
	public String processAddNewActivityForm(@ModelAttribute("activityBean") activityBean ab, BindingResult result) {
		
		String[] suppressedFields = result.getSuppressedFields();
		
		
		if (suppressedFields.length > 0) {
			
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
			
		}
		
		
		MultipartFile productImage = ab.getProductImage();
		
		String originalFilename = productImage.getOriginalFilename();
		ab.setFileName(originalFilename);
		//  建立Blob物件，交由 Hibernate 寫入資料庫
		if (productImage != null && !productImage.isEmpty() ) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				ab.setCoverImage(blob);
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		service.addActivity(ab);
		return "redirect:/activitiesM";
	}
	

	@RequestMapping("/allActivity")
	public String ActivitesStatusEqualOne(Model model) {
		List<activityBean> list = service.getAllActivitiesExceptStatusEqualOne();
		model.addAttribute("activities", list);
		return "activity/allActivity";
	}

	@RequestMapping("/allActivityM")
	public String ActivitesStatusEqualOneAndZero(Model model) {
		List<activityBean> list = service.getAllActivities();
		model.addAttribute("activities", list);
		return "activity/allActivityM";
	}	


	@RequestMapping(value = "/update/activities/{activityId}", method = RequestMethod.GET)
	public String proccessUpdateActivities(@PathVariable("activityId") Integer activityId, Model model) {
		activityBean pb = service.getActivityById(activityId);
		model.addAttribute("activityBean", pb);
		return "activity/updateActivity";
	}

	@RequestMapping(value = "/update/activities/{activityId}", method = RequestMethod.POST)
	public String proccessUpdateActivities(@PathVariable("activityId") Integer activityId,
			@ModelAttribute("activityBean") activityBean ab, Model model) {
		ab.setActivityId(activityId);
		MultipartFile productImage = ab.getProductImage();	
		String originalFilename = productImage.getOriginalFilename();
		ab.setFileName(originalFilename);
		//  建立Blob物件，交由 Hibernate 寫入資料庫
		if (productImage != null && !productImage.isEmpty() ) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				ab.setCoverImage(blob);
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		
		service.updateActivity(ab);
		model.addAttribute("activity", service.getActivityById(activityId));
		return "activity/updateactivityM";
	}	
	

	
	

	//點閱率+查單筆
	@RequestMapping(value = "/queryMyActivity/{activityId}", method = RequestMethod.GET)
	public String updateActivityViews(@PathVariable("activityId") Integer activityId, Model model) {
		activityBean ab = service.getActivityById(activityId);
		int getwatch =  ab.getActivityWatched();
		getwatch = getwatch + 1;
	
		service.updateViews(ab,getwatch);
			
		model.addAttribute("activityBean", ab);
		model.addAttribute("activity", ab);
		return "activity/viewsUpdate";
	} 
	
//	/* 查單筆 */
//	@RequestMapping("/activity")
//	public String getActivityById(@RequestParam("id") Integer activityId, Model model) {
//		activityBean ab = service.getActivityById(activityId);
//		
//		model.addAttribute("activity", ab);
//	
//		return "activity/activity";
//	}


	/* 報名活動 */

	

	
	
	
	/*當我需要insert進資料庫時,需要透過他來過濾使用端輸入的東西限制,以防亂輸入,甚至藉由語法亂改你資料*/
	@InitBinder
	public void ActivityWhiteListing(WebDataBinder binder) {
		binder.setAllowedFields(
				"activityId"
				, "activityTitle"
				, "category"
				, "activityContent"
				, "activityAuthor"
				, "productImage"
				,"activityMainContent"
				,"status"
				,"activityWatched"
				,"createTime"
				,"coverImage"
				,"startTime" 
				,"endTime"
				,"activityNumber"
				);
	}
	
	
	
	
	@RequestMapping(value = "/getPicture/{activityId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getActivityPicture(HttpServletResponse resp, @PathVariable Integer activityId) {
		String filePath = "/resources/images/NoImage.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		activityBean bean = service.getActivityById(activityId);
		if (bean != null) {
			Blob blob = bean.getCoverImage();
			filename = bean.getFileName();
			if (blob != null) {      
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) { 
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = ActivitytoByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = ActivitytoByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

	private byte[] ActivitytoByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	


}






