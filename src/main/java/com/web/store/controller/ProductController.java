package com.web.store.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.web.shoppingCart.model.OrderItemBean;
import com.web.shoppingCart.model.ShoppingCart;
import com.web.store.model.ProductBean;
import com.web.store.model.CompanyBean;
import com.web.store.service.ProductService;

@Controller
public class ProductController {
	ProductService service;

	@Autowired
	public void setService(ProductService service) {
		this.service = service;

	}

	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	// 產品清單頁面 (模糊查詢)
	@RequestMapping("/keyQuery")
	public String keyQuery(String keyWord,Model model) {
		List<ProductBean> list = service.getkeyQuery(keyWord);
		model.addAttribute("products", list);
		return "store/products";
	}
	
	// 產品清單頁面 (選單查詢)
	@RequestMapping("/selectQuery")
	public String seleteQuery(String category,Model model) {
		
		List<ProductBean> list = service.getselectQuery(category);
		model.addAttribute("products", list);
		System.out.println("list="+list);
		return "store/products";
	}
	
	// 產品清單頁面
		@RequestMapping("/products")
		public String queryProducts(Model model) {
			List<ProductBean> list = service.getAllProducts();
			model.addAttribute("products", list);
			return "store/products";
		}

	// 產品頁面
	@RequestMapping("/product")
	public String getProductsById(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("product", service.getProductById(id));
		return "store/product";
	}

	// 產品清單頁面(後台)
	@RequestMapping("/productsM")
	public String queryProductsM(Model model) {
		List<ProductBean> list = service.getAllProductsM();
		model.addAttribute("products", list);
		return "store/productsM";
	}

	// 產品頁面(後台)
	@RequestMapping("/productM")
	public String getProductsByIdM(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("product", service.getProductById(id));
		return "store/productM";
	}
//
//	@RequestMapping("/queryByCategory")
//	public String getCategoryList(Model model) {
//		List<String> list = service.getAllCategories();
//		model.addAttribute("categoryList", list);
//		return "products";
//	}


	
	@RequestMapping("/products/{category}")
	public String getProductsbyCategory(@PathVariable("category") String category, Model model) {
		List<ProductBean> products = service.getProductsByCategory(category);
		model.addAttribute("products", products);
		return "store/products";
	}

	@RequestMapping(value = "/products/add", method = RequestMethod.GET)
	public String getAddNewProductForm(Model model) {
		ProductBean bb = new ProductBean();
		model.addAttribute("productbean", bb);
		return "store/addProduct";
	}

	@RequestMapping(value = "/products/add", method = RequestMethod.POST)
	public String processAddNewProductForm(@RequestParam("productImage2") MultipartFile productImage2,@RequestParam("productImage3") MultipartFile productImage3,@ModelAttribute("productbean") ProductBean bb) {
		System.out.println("123");
		
		
		MultipartFile productImage = bb.getProductImage();
		String originalFilename = productImage.getOriginalFilename();
		bb.setFileName(originalFilename);
		// 建立Blob物件，交由Hibernate寫入資料庫
		if (productImage != null && !productImage.isEmpty()) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				bb.setCoverImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
			}
		}
			
		//新增圖2
		String originalFilename2 = productImage2.getOriginalFilename();
		bb.setFileName2(originalFilename2);
		// 建立Blob物件，交由Hibernate寫入資料庫
		if (productImage2 != null && !productImage2.isEmpty()) {
			try {
				byte[] b = productImage2.getBytes();
				Blob blob = new SerialBlob(b);
				bb.setCoverImage2(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
			}
		}
		
		//新增圖2
				String originalFilename3 = productImage3.getOriginalFilename();
				bb.setFileName3(originalFilename3);
				// 建立Blob物件，交由Hibernate寫入資料庫
				if (productImage3 != null && !productImage3.isEmpty()) {
					try {
						byte[] b = productImage3.getBytes();
						Blob blob = new SerialBlob(b);
						bb.setCoverImage3(blob);
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
					}
				}
		

		service.addProduct(bb);

		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = context.getRealPath("/");
		try {
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists())
				imageFolder.mkdir();
			File file = new File(imageFolder, bb.getProductId() + ext);
			productImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
		}

		return "redirect://products";

	}



//	@InitBinder
//	public void whiteListing(WebDataBinder binder) {
//		binder.setAllowedFields("title", "author", "category", "price", "stock", "productNo", "companyId", "productImage",
//				"fileName", "status");
//
//	}

	@ModelAttribute("companyList")
	public Map<Integer, String> getCompanyList() {
		Map<Integer, String> companyMap = new HashMap<>();
		List<CompanyBean> list = service.getCompanyList();
		for (CompanyBean cb : list) {
			companyMap.put(cb.getId(), cb.getName());
		}
		return companyMap;
	}

	@ModelAttribute("categoryList")
	public List<String> getCategoryList() {
		return service.getAllCategories();
	}

	/* update資料 */
	@RequestMapping(value = "/update/products", method = RequestMethod.GET)
	public String getupdateProducts(Model model) {
		List<ProductBean> list = service.getAllProducts();
		model.addAttribute("product", list);
		return "store/product";

	}

	@RequestMapping(value = "/update/products/{productId}", method = RequestMethod.GET)
	public String proccessupdateProducts(@PathVariable("productId") Integer productId, Model model) {
		ProductBean pb = service.getProductById(productId);
		model.addAttribute("ProductBean", pb);
		return "store/updateProduct";
	}

	@RequestMapping(value = "/update/products/{productId}", method = RequestMethod.POST)
	public String proccessupdateProducts2(@PathVariable("productId") Integer productId,
			@ModelAttribute("ProductBean") ProductBean bb, Model model) {
		bb.setProductId(productId); // 抓路徑ID塞進bb

		MultipartFile productImage = bb.getProductImage();
		String originalFilename = productImage.getOriginalFilename();
		bb.setFileName(originalFilename);
		// 建立Blob物件，交由Hibernate寫入資料庫
		if (productImage != null && !productImage.isEmpty()) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				bb.setCoverImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
			}
		}
		
		
		//圖片2
		MultipartFile productImage2 = bb.getProductImage2();
		String originalFilename2 = productImage2.getOriginalFilename();
		bb.setFileName2(originalFilename2);
		// 建立Blob物件，交由Hibernate寫入資料庫
		if (productImage2 != null && !productImage2.isEmpty()) {
			try {
				byte[] b = productImage2.getBytes();
				Blob blob = new SerialBlob(b);
				bb.setCoverImage2(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
			}
		}
		
		
		//圖片3
		MultipartFile productImage3 = bb.getProductImage3();
		String originalFilename3 = productImage3.getOriginalFilename();
		bb.setFileName3(originalFilename3);
		// 建立Blob物件，交由Hibernate寫入資料庫
		if (productImage3 != null && !productImage3.isEmpty()) {
			try {
				byte[] b = productImage3.getBytes();
				Blob blob = new SerialBlob(b);
				bb.setCoverImage3(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
			}
		}
		

		service.updateProduct(bb);

//		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//		String rootDirectory = context.getRealPath("/");
//		try {
//			File imageFolder = new File(rootDirectory, "images");
//			if (!imageFolder.exists())
//				imageFolder.mkdir();
//			File file = new File(imageFolder, bb.getBookId() + ext);
//			productImage.transferTo(file);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
//		}

		model.addAttribute("product", service.getProductById(productId));
		return "redirect://productsM";
	}
	
	//取照片1
	@RequestMapping(value = "/getPicture/store/{productId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer productId) {

		String filePath = "/images/noImage.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();

		String filename = "";
		int len = 0;
		ProductBean bean = service.getProductById(productId);

		if (bean != null) {
			Blob blob = bean.getCoverImage();
			filename = bean.getFileName();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPiture()發生SQLException:" + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}

		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);

		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType = " + mediaType);

		headers.setContentType(mediaType);

		ResponseEntity<byte[]> responseEntity = new ResponseEntity<byte[]>(media, headers, HttpStatus.OK);

		return responseEntity;

	}
	
	//取照片2
	@RequestMapping(value = "/getPicture2/store/{productId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture2(HttpServletResponse resp, @PathVariable Integer productId) {

		String filePath = "/images/noImage.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();

		String filename = "";
		int len = 0;
		ProductBean bean = service.getProductById(productId);

		if (bean != null) {
			Blob blob = bean.getCoverImage2();
			filename = bean.getFileName2();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPiture()發生SQLException:" + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}

		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);

		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType = " + mediaType);

		headers.setContentType(mediaType);

		ResponseEntity<byte[]> responseEntity = new ResponseEntity<byte[]>(media, headers, HttpStatus.OK);

		return responseEntity;

	}
	
	//取照片3
	@RequestMapping(value = "/getPicture3/store/{productId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture3(HttpServletResponse resp, @PathVariable Integer productId) {

		String filePath = "/images/noImage.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();

		String filename = "";
		int len = 0;
		ProductBean bean = service.getProductById(productId);

		if (bean != null) {
			Blob blob = bean.getCoverImage3();
			filename = bean.getFileName3();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPiture()發生SQLException:" + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}

		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);

		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType = " + mediaType);

		headers.setContentType(mediaType);

		ResponseEntity<byte[]> responseEntity = new ResponseEntity<byte[]>(media, headers, HttpStatus.OK);

		return responseEntity;

	}

	private byte[] toByteArray(String filepath) {
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

	// 加入購物車
	@PostMapping("/addToCart")
	public String addCart(Model model, HttpServletRequest request, HttpSession session) throws ServletException {
		
		
		if (session == null) {
			// 請使用者登入
			
			return "_01_register/register.jsp";
		}
	
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		if (cart == null) {
			// 就新建ShoppingCart物件
			cart = new ShoppingCart();
			// 並將此新建ShoppingCart的物件放到session物件內，成為它的屬性物件
			session.setAttribute("ShoppingCart", cart);
		
		
		}

		System.out.println("=======");
		System.out.println(cart);
		System.out.println("=======");

		String productIdStr = request.getParameter("productId");
		int productId = Integer.parseInt(productIdStr.trim());
		System.out.println("productId"+productId);
		
		String qtyStr = request.getParameter("qty");
		Integer qty = 0;
		

		ProductBean bean = service.getProductById(productId);
		
		

		try {
			// 進行資料型態的轉換
			qty = Integer.parseInt(qtyStr.trim());
			System.out.println("qty"+qty);
		} catch (NumberFormatException e) {
			throw new ServletException(e);
		}
		
		

		System.out.println(productId);
		 //將訂單資料(價格，數量，折扣與BookBean)封裝到OrderItemBean物件內
		OrderItemBean oib = new OrderItemBean(null, null, productId, null, qty, bean.getPrice(), null,
				bean.getTitle(), bean.getAuthor(),bean.getCompanyBean().getName(),bean.getStock());
//		oib.setBookId(productId);
//		oib.setQuantity(qty);
//		oib.setUnitPrice(bean.getPrice());
//		oib.setTitle(bean.getTitle());
//		oib.setAuthor(bean.getAuthor());
//		oib.setCompanyName(bean.getCompanyBean().getName());
//		oib.setStock(bean.getStock());
		
		// 將OrderItem物件內加入ShoppingCart的物件內
		cart.addToCart(productId, oib);
		System.out.println(ReflectionToStringBuilder.toString(oib));
		return "redirect://product?id=" + productId;

	}
	// 商城頁面加入購物車
		@PostMapping("/pgaddToCart")
		public String pgAddCart(Model model, HttpServletRequest request, HttpSession session) throws ServletException {
			
			
			if (session == null) {
				// 請使用者登入
				
				return "_01_register/register.jsp";
			}
		
			ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
			if (cart == null) {
				// 就新建ShoppingCart物件
				cart = new ShoppingCart();
				// 並將此新建ShoppingCart的物件放到session物件內，成為它的屬性物件
				session.setAttribute("ShoppingCart", cart);
			
			
			}

			System.out.println("=======");
			System.out.println(cart);
			System.out.println("=======");

			String pgIdStr = request.getParameter("pgId");
			
			int pgId = Integer.parseInt(pgIdStr.trim());
			
			

			
			String qtyStr = request.getParameter("qty");
			Integer qty = 0;
			

			ProductBean bean = service.getProductById(pgId);
			
			System.out.println("pgId"+pgId);

			try {
				// 進行資料型態的轉換
				qty = Integer.parseInt(qtyStr.trim());
			} catch (NumberFormatException e) {
				throw new ServletException(e);
			}
			
			

			System.out.println("productsId="+pgId);
			
			
			// 將訂單資料(價格，數量，折扣與BookBean)封裝到OrderItemBean物件內
			OrderItemBean oib = new OrderItemBean(null, null, pgId, null, qty, bean.getPrice(), null,
					bean.getTitle(), bean.getAuthor(),bean.getCompanyBean().getName(),bean.getStock());
			
			// 將OrderItem物件內加入ShoppingCart的物件內
			cart.addToCart(pgId, oib);
			System.out.println(ReflectionToStringBuilder.toString(oib));
			return "redirect://products";

		}
	
	@RequestMapping("/CartNum")
	public @ResponseBody Integer CartNum(HttpServletRequest request,HttpSession session){
		
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		int num = cart.getItemNumber();
		System.out.println("num="+num);
		
		return num;	
	}
	

}
