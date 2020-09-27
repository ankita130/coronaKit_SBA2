package com.eval.coronakit.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eval.coronakit.dao.ProductMasterRepository;
import com.eval.coronakit.entity.ProductMaster;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMasterRepository repository;
	
	@Override
	public ProductMaster addNewProduct(ProductMaster product) {
		return this.repository.save(product);
	}

	@Override
	public List<ProductMaster> getAllProducts() {
		return this.repository.findAll();
	}

	@Override
	public ProductMaster deleteProduct(int productId) {
		
		ProductMaster productMaster=this.getProductById(productId);
		if(productMaster!=null)
		{
			this.repository.delete(productMaster);
		}
		return productMaster;
	}

	@Override
	public ProductMaster getProductById(int productId) {
		ProductMaster productMaster=this.repository.findById(productId).orElse(null);
		return productMaster;
	}

}
