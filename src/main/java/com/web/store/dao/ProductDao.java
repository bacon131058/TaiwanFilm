package com.web.store.dao;

import java.util.List;

import com.web.store.model.ProductBean;
import com.web.store.model.CompanyBean;

public interface ProductDao {

	List<ProductBean> getAllProducts();
	
	//模糊查詢
	List<ProductBean> getkeyQuery(String keyWord);
	
	//選單查詢
	List<ProductBean> getselectQuery(String category);
	
	List<String> getAllCategories();
	
	List<ProductBean> getProductsByCategory(String category);
	
	public ProductBean getProductById(int productId);
	
	//insert
	void addProduct(ProductBean product);
	CompanyBean getCompanyById(int companyList);
	List<CompanyBean> getCompanyList();
	
	//update
	void updateProduct(ProductBean product);

	//back-end
	List<ProductBean> getAllProductsM();


	
}
