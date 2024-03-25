package com.CrudSpringMVC.Dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.CrudSpringMVC.model.Product;

@Component
public class ProductDao {
	
	@Autowired
	private HibernateTemplate template;
	@Transactional
	public void createProduct(Product product)
	{
		this.template.saveOrUpdate(product);
	}
	
	public List<Product> getProducts()
	{	
		List<Product> products=this.template.loadAll(Product.class);
		return products;
	}
	
	@Transactional
	public void deleteProduct(int pid)
	{
		Product p=this.template.load(Product.class,pid);
		this.template.delete(p);
	}
	
	/*
	 * @Transactional public void updateProduct(Product product) {
	 * this.template.update(product); }
	 */
	// Read Single Data
	public Product getProduct(int productID)
	{
		Product product=this.template.get(Product.class, productID);
		return product;
	}

}