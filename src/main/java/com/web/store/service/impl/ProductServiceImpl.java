package com.web.store.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.store.dao.ProductDao;
import com.web.store.model.ProductBean;
import com.web.store.model.CompanyBean;
import com.web.store.service.ProductService;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

	ProductDao dao;

	@Autowired
	public void setDao(ProductDao dao) {
		this.dao = dao;
	}

	@Override
	public List<ProductBean> getAllProducts() {
		return dao.getAllProducts();
	}

	@Override
	public ProductBean getProductById(int productId) {
		return dao.getProductById(productId);
	}
	


	@Override
	public void addProduct(ProductBean product) {
		dao.addProduct(product);

	}

	@Override
	public CompanyBean getCompanyById(int companyId) {

		return dao.getCompanyById(companyId);
	}

	@Override
	public List<CompanyBean> getCompanyList() {

		return dao.getCompanyList();
	}

	@Override
	public List<String> getAllCategories() {
		return dao.getAllCategories();
	}

	@Override
	public List<ProductBean> getProductsByCategory(String category) {
		return dao.getProductsByCategory(category);
	}

	@Override
	public void updateProduct(ProductBean product) {
		dao.updateProduct(product);
	}

	@Override
	public List<ProductBean> getAllProductsM() {
		return dao.getAllProductsM();
	}

	@Override
	public List<ProductBean> getkeyQuery(String keyWord) {
		
		return dao.getkeyQuery(keyWord);
	}

	@Override
	public List<ProductBean> getselectQuery(String category) {
		
		return dao.getselectQuery(category);
				
	}
	
	
	

	


}
