package com.web.model.shopping;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Proxy;

//本類別封裝單筆訂單資料
@Entity
@Table(name="OrderItems")
public class OrderItemBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer seqno;
	Integer orderNo;
	Integer bookId;
	String description;
	Double unitPrice;
	Integer quantity;
	Double discount;
	
	private String title;
	private String author;
	private String companyName;
	private Integer stock;
	@ManyToOne
	@JoinColumn(name = "FK_OrderBean_orderNo")
	OrderBean orderBean;
	
	public OrderBean getOrderBean() {
		return orderBean;
	}

	public void setOrderBean(OrderBean orderBean) {
		this.orderBean = orderBean;
	}
	public OrderItemBean(Integer seqno, Integer orderNo, Integer bookId,
			String description, Integer quantity, Double unitPrice, Double discount,
			String title, String author, String companyName,Integer stock) {
		this.seqno = seqno;
		this.orderNo = orderNo;
		this.bookId = bookId;
		this.description = description;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.discount = discount;
		this.title = title;
		this.author = author;
		this.companyName = companyName;
		this.stock = stock;
	}
	public OrderItemBean(Integer orderNo, Integer bookId,
			String description, Integer quantity, Double unitPrice, Double discount,Integer stock) {
		this.orderNo = orderNo;
		this.bookId = bookId;
		this.description = description;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.discount = discount;
		this.stock = stock;
	}
	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public OrderItemBean() {
		
	}
	public Integer getSeqno() {
		return seqno;
	}

	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}

	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	public Integer getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
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
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

}