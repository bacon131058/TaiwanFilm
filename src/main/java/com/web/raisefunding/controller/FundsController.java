package com.web.raisefunding.controller;

import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.web.config.ControllerUtil;
import com.web.raisefunding.model.CrowdFundingBean;
import com.web.raisefunding.model.DonatePlanBean;
import com.web.raisefunding.model.ProjectBean;
import com.web.raisefunding.model.ProjectInfoBean;
import com.web.raisefunding.model.PurchaseBean;
import com.web.raisefunding.service.DonatePlanService;
import com.web.raisefunding.service.ProposalService;

@Controller
@SessionAttributes("ProjectBean")
public class FundsController {
	String noImage = "/WEB-INF/views/image/noImage.jpg";

	@Autowired
	ProposalService propService;
	@Autowired
	DonatePlanService donateService;
	@Autowired
	ServletContext context;
	@Autowired
	ControllerUtil util;

	// 開啟目前有開募資的列表頁
	@GetMapping("/getAllProject")
	public String getProject(Model model) {
		List<CrowdFundingBean> list = propService.getAllProjectAndFunding();
		model.addAttribute("Fundings", list);
		return "raiseFunding/fundsCategory";
	}

	// 後臺取得所有募資列表
	@GetMapping("/manage/getAllProject")
	public String getManageProject(Model model) {
		List<CrowdFundingBean> list = propService.getAllProjectAndFunding();
		model.addAttribute("cfBeans", list);
		return "raiseFunding/projectManage";
	}

	// 開啟建立募資的專案頁
	@GetMapping("/createProjectFirst")
	public String proposalPage(Model model) {
		return "raiseFunding/createProjectFirst";
	}

	// 建立專案回傳資料
	@PostMapping("/submitProject")
	public String createProposal(Model model, CrowdFundingBean cfBean, HttpServletRequest request,
			@RequestParam("photoStr") MultipartFile photoStr, @RequestParam("photoStr2") MultipartFile photoStr2,
			@RequestParam("dateBegin") String dateBegin, @RequestParam("dateEnd") String dateEnd,
			@RequestParam("fundsGoal") Integer fundsGoal) {
		cfBean.setDateBegin(dateBegin);
		cfBean.setDateEnd(dateEnd);
		cfBean.setFundsGoal(fundsGoal);
		ProjectBean projBean = new ProjectBean(request.getParameter("projectName"),
				request.getParameter("projDescript"), request.getParameter("projStory"),
				util.vedioLinkCut(request.getParameter("vedio")));
		if (!photoStr.isEmpty()) {
			projBean.setPhoto(util.fileTransformBlob(photoStr));
			projBean.setPhotoFileName(util.getFileName(photoStr));
		} else {
			projBean.setPhoto(util.fileToBlob(noImage));
			projBean.setPhotoFileName("noImage.jpg");
		}
		if (!photoStr2.isEmpty()) {
			projBean.setPhoto2(util.fileTransformBlob(photoStr2));
			projBean.setPhotoFileName2(util.getFileName(photoStr2));
		} else {
			projBean.setPhoto2(util.fileToBlob(noImage));
			projBean.setPhotoFileName2("noImage.jpg");
		}
		propService.createProjectAndPlan(cfBean, projBean);
		model.addAttribute("ProjectBean", projBean);
//		model.addAttribute("CrowdFundingBean", cfBean);
		return "raiseFunding/createProject";
	}

	// 重新整理的時候倒導回建立頁面
	@GetMapping("/createProject")
	public String updateProject(HttpSession session, Model model) {
		ProjectBean projBean = (ProjectBean) session.getAttribute("ProjectBean");
		model.addAttribute("ProjectBean", projBean);
		return "raiseFunding/createProject";
	}
	
	@PostMapping("/updateSubmit")
	public String updateProjectAndCrowd(Model model, HttpServletRequest request,
			@RequestParam("photoStr") MultipartFile photoStr, @RequestParam("photoStr2") MultipartFile photoStr2,
			@RequestParam("dateBegin") String dateBegin, @RequestParam("dateEnd") String dateEnd,
			@RequestParam("fundsGoal") Integer fundsGoal,@ModelAttribute("ProjectBean")ProjectBean projBean ) {
		CrowdFundingBean cfBean = projBean.getCfBean();
		cfBean.setDateBegin(dateBegin);
		cfBean.setDateEnd(dateEnd);
		cfBean.setFundsGoal(fundsGoal);
		projBean.setProjectName(request.getParameter("projectName"));
		projBean.setProjDescript(request.getParameter("projDescript"));
		projBean.setProjStory(request.getParameter("projStory"));	
		projBean.setVideoLink(util.vedioLinkCut(request.getParameter("vedio")));
		if (!photoStr.isEmpty()) {
			projBean.setPhoto(util.fileTransformBlob(photoStr));
			projBean.setPhotoFileName(util.getFileName(photoStr));
		} 
		if (!photoStr2.isEmpty()) {
			projBean.setPhoto2(util.fileTransformBlob(photoStr2));
			projBean.setPhotoFileName2(util.getFileName(photoStr2));
		} 
		propService.updateProjectAndPlan(cfBean, projBean);
		model.addAttribute("ProjectBean", projBean);
		return "redirect:/updateProject/"+projBean.getProjectId();
	}


	// 修改專案
	@GetMapping("/updateProject/{id}")
	public String updateProjectById(@PathVariable("id") Integer projectId, Model model) {
		ProjectInfoBean infoBean = new ProjectInfoBean();
		ProjectBean projBean = propService.GetProjBean(projectId);
		List<DonatePlanBean> dpBeans = propService.getAllDonatePlanBean(projectId);
			infoBean = propService.getProjectInfo(projectId);
		if(infoBean.getPhotoCount() == null) {
		infoBean.setPhotoCount(0);
		}
		infoBean.setProjBean(projBean);
		model.addAttribute("ProjectBean", projBean);
		model.addAttribute("dpBeans", dpBeans);
		model.addAttribute("infoBean", infoBean);
		
		return "/raiseFunding/updateProject";
	}

	// 建立一個專案專屬的贊助方案
	@PostMapping(value = "/createDonatePlan", produces = { "text/html;charset=utf-8" })
	public @ResponseBody String createDonatePlan(DonatePlanBean dpBean, Model model,
			@RequestParam("donateMoney") Integer donateMoney, @RequestParam("donateDescription") String description,
			@RequestParam("donatePhoto") MultipartFile donatePhoto, @RequestParam("shipping") String shipping,
			@RequestParam("dliverDate") String dliverDate, @RequestParam("limit") Integer limitNum,
			@RequestParam("projectId") Integer projectId, @RequestParam("updateId") Integer planId) {
		dpBean.setDliverDate(dliverDate);
		dpBean.setDonateDescription(description);
		dpBean.setDonateMoney(donateMoney);
		dpBean.setLimitNum(limitNum);
		dpBean.setShipping(shipping);
		dpBean.setProjBean(propService.GetProjBean(projectId));
		// 判斷如果有ID就執行更新 沒ID就新增
		System.out.println("chage condition");
		if (planId > 0) {
			if (!donatePhoto.isEmpty()) {
				dpBean.setPicture(util.fileTransformBlob(donatePhoto));
				dpBean.setPictureFileName(util.getFileName(donatePhoto));
			}
			dpBean.setPlanId(planId);
			propService.updateDonatePlan(dpBean);
		} else {
			if (!donatePhoto.isEmpty()) {
				dpBean.setPicture(util.fileTransformBlob(donatePhoto));
				dpBean.setPictureFileName(util.getFileName(donatePhoto));
			} else {
				dpBean.setPicture(util.fileToBlob(noImage));
				dpBean.setPictureFileName("noImage.jpg");
			}
			propService.createDonatePlan(dpBean);
		}
//		dpBean.setPlanId(Integer.parseInt(request.getParameter("updateId")));}
		List<DonatePlanBean> dpBeans = propService.getAllDonatePlanBean(projectId);
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String jsonDpBean = gson.toJson(dpBeans);
		return jsonDpBean;
	}
	
	@GetMapping("/getDonatePlan/projId{prjId}/actionId{dpId}")
	public @ResponseBody String getSingleDpBean(@PathVariable("prjId") Integer projectId,
			@PathVariable("dpId") Integer planId) {
		DonatePlanBean dpBean = propService.getSinglePlan(projectId, planId);
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String jsonDpBean = gson.toJson(dpBean);
		return jsonDpBean;
	}
	
	@GetMapping(value="/delDonatePlan/projId{prjId}/actionId{dpId}", produces = { "text/html;charset=utf-8" })
	public @ResponseBody String delSingleDpBean(@PathVariable("prjId") Integer projectId,
			@PathVariable("dpId") Integer planId) {
		propService.delDonatePlan(projectId, planId);
		List<DonatePlanBean> dpBeans = propService.getAllDonatePlanBean(projectId);
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String jsonDpBean = gson.toJson(dpBeans);
		return jsonDpBean;
	}

	// 點擊募資方塊進入個別募資
	@GetMapping("/project{id}")
	public String getProjectPage(@PathVariable("id") Integer id, Model model) {
		CrowdFundingBean cfBean = propService.getCrowdFundingBean(id);
		List<DonatePlanBean> dpBeans = propService.getAllDonatePlanBean(id);
		ProjectInfoBean infoBean = propService.getProjectInfo(id);// 無法使用新增跟更新同時進行所以寫使用List 待改
		List<PurchaseBean> pcBeans = donateService.getProjMemberByPurchase(id);
		if(infoBean.getPhotoCount() == null) {
			infoBean.setPhotoCount(0);
			infoBean.setProjBean(cfBean.getProjBean());
		}
		model.addAttribute("dpBeans", dpBeans);
		model.addAttribute("cfBean", cfBean);
		model.addAttribute("pcBeans", pcBeans);
		model.addAttribute("infoBean", infoBean);
		return "raiseFunding/crowdFunds";
	}

	// 募資的圖片SRC
	@GetMapping("/getProject/photo/{id}")
	public ResponseEntity<byte[]> getPicture(@PathVariable("id") Integer id) {
		byte[] body = null;
//		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());

		ProjectBean projBean = propService.GetProjBean(id);
		if (projBean == null)
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		String fileName = projBean.getPhotoFileName();
		if (fileName.toLowerCase().endsWith("jfif")) {
			mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
		} else {
			mediaType = MediaType.valueOf(context.getMimeType(fileName));
			headers.setContentType(mediaType);
		}
		Blob blob = projBean.getPhoto();
		if (blob != null) {
			body = util.blobToByteArray(blob);
		}
		return new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
	}

	// 回饋方案的圖片SRC
	@GetMapping("/getDonatePlan/photo/{id}")
	public ResponseEntity<byte[]> getDonatePicture(@PathVariable("id") Integer id) {
		byte[] body = null;
//		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());

		DonatePlanBean dpBean = propService.GetDonatePlanBean(id);
		if (dpBean == null)
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		String fileName = dpBean.getPictureFileName();
		if (fileName.toLowerCase().endsWith("jfif")) {
			mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
		} else {
			mediaType = MediaType.valueOf(context.getMimeType(fileName));
			headers.setContentType(mediaType);
		}
		Blob blob = dpBean.getPicture();
		if (blob != null) {
			body = util.blobToByteArray(blob);
		}
		return new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
	}

	// 專案大綱寫死的圖片請求
	@GetMapping("/infoPhoto/{projId}/{num}")
	public ResponseEntity<byte[]> getDonatePicture(@PathVariable("projId") Integer projId,
			@PathVariable("num") Integer num) {
		byte[] body = null;
//		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		Blob blob = null;
		String fileName = null;
		ProjectInfoBean infoBean = propService.getProjectInfo(projId);
		
		if (infoBean == null)
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		switch (num) {
		case 0:
			fileName = infoBean.getImgName01();
			blob = infoBean.getImage01();
			break;
		case 1:
			fileName = infoBean.getImgName02();
			blob = infoBean.getImage02();
			break;
		case 2:
			fileName = infoBean.getImgName03();
			blob = infoBean.getImage03();
			break;
		case 3:
			fileName = infoBean.getImgName04();
			blob = infoBean.getImage04();
			break;
		}
		if (fileName.toLowerCase().endsWith("jfif")) {
			mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
		} else {
			mediaType = MediaType.valueOf(context.getMimeType(fileName));
			headers.setContentType(mediaType);
		}

		if (blob != null) {
			body = util.blobToByteArray(blob);
		}
		return new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
	}

	// 儲存專案大綱的表格圖片可動態一到四張 沒圖片則NULL
	@PostMapping("/createPjInfo")
	public String createProjectInfo(@RequestParam("textTittle") String textTittle,
			@RequestParam("projectId") Integer projectId, @RequestParam("innerText") String innerText,
			@RequestParam("photoCount") Integer photoCount,
			@RequestParam(value = "image0", required = false) MultipartFile file0,
			@RequestParam(value = "image1", required = false) MultipartFile file1,
			@RequestParam(value = "image2", required = false) MultipartFile file2,
			@RequestParam(value = "image3", required = false) MultipartFile file3, ProjectInfoBean infoBean,
			Model model) {
		infoBean.setInnerText(innerText);
		infoBean.setProjectTittle(textTittle);
		infoBean.setPhotoCount(photoCount);
		infoBean.setImage01(util.fileTransformBlob(file0));
		System.out.println(file0);
		infoBean.setImgName01(util.getFileName(file0));
		infoBean.setImage02(util.fileTransformBlob(file1));
		infoBean.setImgName02(util.getFileName(file1));
		infoBean.setImage03(util.fileTransformBlob(file2));
		infoBean.setImgName03(util.getFileName(file2));
		infoBean.setImage04(util.fileTransformBlob(file3));
		infoBean.setImgName04(util.getFileName(file3));
		ProjectBean projBean = propService.GetProjBean(projectId);
		infoBean.setProjBean(projBean);
		if(propService.checkProjectInfo(projectId)) {
			propService.updateProjInfo(infoBean);
		}else {  //這裡有一個專案介紹表單重複建立的問題 待解決
		propService.createProjInfo(infoBean);
//		 這裡想要判斷有專案就修改 沒專案就新增 待改
		}
		model.addAttribute("ProjectBean", projBean);
		return "raiseFunding/createProject";
	}

}
