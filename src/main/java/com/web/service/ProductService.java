package com.web.service;

import java.util.List;

import com.web.model.shopping.CompanyBean;
import com.web.model.shopping.ProductBean;

public interface ProductService {
	List<ProductBean> getAllProducts();
	
	//模糊查詢
	List<ProductBean> getkeyQuery(String keyWord);
	
	//選單查詢
	List<ProductBean> getselectQuery(String category);

	List<ProductBean> getAllProductsM();

	List<String> getAllCategories();

	List<ProductBean> getProductsByCategory(String category);

	public ProductBean getProductById(int productId);

	// insert
	void addProduct(ProductBean product);

	CompanyBean getCompanyById(int companyId);

	List<CompanyBean> getCompanyList();

	// update
	void updateProduct(ProductBean product);

	


	

}
