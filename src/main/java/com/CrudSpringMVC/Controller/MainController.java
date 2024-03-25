package com.CrudSpringMVC.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.CrudSpringMVC.Dao.ProductDao;
import com.CrudSpringMVC.model.Product;

@Controller
public class MainController {
	
	@Autowired
	private ProductDao productdao;
	
	@RequestMapping("/")
	public String home(Model m)
	{
		List<Product> products=productdao.getProducts();
		m.addAttribute("product",products);
		return "index";
	}

	// to show add product
	@RequestMapping("add-product")
	public String addProduct()
	{
		return "add_product";
	}
	
	// handle product form
	@RequestMapping(value="handle-product",method=RequestMethod.POST)
	public RedirectView handleProduct(@ModelAttribute Product product,HttpServletRequest request)
	{
		RedirectView rv=new RedirectView();
		productdao.createProduct(product);
		rv.setUrl(request.getContextPath()+"/");
		return rv;
	}
	
	//Delete
	@RequestMapping(value="delete-product",method=RequestMethod.POST)
	public RedirectView deleteProduct(@RequestParam("productId") int pId,HttpServletRequest request)
	{
		RedirectView rv=new RedirectView();
		productdao.deleteProduct(pId);
		rv.setUrl(request.getContextPath()+"/");
		return rv;
	}
	 
	@GetMapping("update-product/{id}")
	public String editProduct(@PathVariable("id") int id,Model model)
	{
		System.out.println(id);
		Product product = productdao.getProduct(id);
        model.addAttribute("product", product);
		//m.addAttribute(product);
		return "edit_product";
	}

	/*
	 * @RequestMapping(value = "changeProduct", method = RequestMethod.POST) public
	 * RedirectView handleUpdate(@ModelAttribute Product product,HttpServletRequest
	 * request) { RedirectView rv=new RedirectView();
	 * productdao.updateProduct(product); rv.setUrl(request.getContextPath()+"/");
	 * return rv; }
	 */
}
