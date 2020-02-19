package com.web.store.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

//import com.fasterxml.jackson.annotation.JsonIgnore;
// 本類別封裝單筆書籍資料
@Entity
@Table(name = "Product")
public class ProductBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productId;
	private String title;
	//商品描述欄位
	private String productDescription;
	private String author;
	private Double price;
	@Transient
	private String priceStr = null;
	private Double discount;

//	@JsonIgnore
	private Blob coverImage;
	private String fileName;

	// 圖片2
	private Blob coverImage2;
	private String fileName2;

	// 圖片3
	private Blob coverImage3;
	private String fileName3;

	private String productNo;
	@Transient
	private String discountStr;
	private String category;
	private Integer stock;
	private String status;
	@Transient
	private Integer companyId;

//	@JsonIgnore
	@Transient
	private MultipartFile productImage;

	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	@Transient
	private MultipartFile productImage2;

	public MultipartFile getProductImage2() {
		return productImage2;
	}

	public void setProductImage2(MultipartFile productImage2) {
		this.productImage2 = productImage2;
	}

	@Transient
	private MultipartFile productImage3;

	public MultipartFile getProductImage3() {
		return productImage3;
	}

	public void setProductImage3(MultipartFile productImage3) {
		this.productImage3 = productImage3;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_CompanyBean_Id")
	private CompanyBean companyBean;

	public ProductBean(Integer productId, String title,String productDescription,String author, double price, double discount, String fileName,
			String fileName2,String fileName3, String productNo, Blob coverImage, Blob coverImage2,Blob coverImage3, int companyId, String category,
			String status) {
		this.productId = productId;
		this.title = title;
		this.productDescription = productDescription;
		this.author = author;
		this.price = price;
		this.discount = discount;
		this.fileName = fileName;
		this.fileName2 = fileName2;
		this.fileName2 = fileName3;
		this.productNo = productNo;
		this.coverImage = coverImage;
		this.coverImage2 = coverImage2;
		this.coverImage2 = coverImage3;
		this.companyId = companyId;
		this.category = category;
		this.stock = 0;
		this.status = status;
	}

	public ProductBean(Integer productId, String title,String productDescription,String author, Double price, Double discount, String fileName,
			String fileName2,String fileName3, String productNo, Blob coverImage, Blob coverImage2,Blob coverImage3, Integer stock, String category,
			CompanyBean companyBean, String status) {
		this.productId = productId;
		this.title = title;
		this.productDescription = productDescription;
		this.author = author;
		this.price = price;
		this.discount = discount;
		this.fileName = fileName;
		this.fileName2 = fileName2;
		this.fileName2 = fileName3;
		this.productNo = productNo;
		this.coverImage = coverImage;
		this.coverImage2 = coverImage2;
		this.coverImage2 = coverImage3;
		this.companyBean = companyBean;
		this.category = category;
		this.stock = stock;
		this.status = status;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public Blob getCoverImage2() {
		return coverImage2;
	}

	public void setCoverImage2(Blob coverImage2) {
		this.coverImage2 = coverImage2;
	}

	public String getFileName2() {
		return fileName2;
	}

	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}
	public Blob getCoverImage3() {
		return coverImage3;
	}

	public void setCoverImage3(Blob coverImage3) {
		this.coverImage3 = coverImage3;
	}

	public String getFileName3() {
		return fileName3;
	}

	public void setFileName3(String fileName3) {
		this.fileName3 = fileName3;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public ProductBean() {
	}

	public Integer getProductId() { // bookId
		return productId;
	}

	public void setProductId(Integer productID) {
		this.productId = productID;
	}

	public CompanyBean getCompanyBean() {
		return companyBean;
	}

	public void setCompanyBean(CompanyBean companyBean) {
		this.companyBean = companyBean;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPriceStr() {
		return priceStr;
	}

	public void setPriceStr(String priceStr) {
		this.priceStr = priceStr;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
		if (priceStr == null) {
			priceStr = String.valueOf(price);
		}
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) { // 0.8, 0.75
		if (discount == null) {
			this.discount = 1.0;
			discountStr = "";
			return;
		}
		this.discount = discount;

		if (discount == 1) {
			discountStr = "";
		} else {
			int dnt = (int) (discount * 100);
			if (dnt % 10 == 0) {
				discountStr = (dnt / 10) + "折";
			} else {
				discountStr = " " + dnt + "折";
			}

		}
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public String getDiscountStr() {
		return discountStr;
	}

	public Blob getCoverImage() {
		return coverImage;
	}

	public void setCoverImage(Blob coverImage) {
		this.coverImage = coverImage;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setPrice(Double price) {
		this.price = price;
	}
}
