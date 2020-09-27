package com.eval.coronakit.controller;



import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eval.coronakit.entity.ProductMaster;
import com.eval.coronakit.service.ProductService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	ProductService productService;
	
	@GetMapping("/home")
	public String home() {
		return "admin-home";
	}
	
	@GetMapping("/product-entry")
	public String productEntry(Model model) {
		
		ProductMaster productMaster=new ProductMaster();
		model.addAttribute("productMaster", productMaster);
		return "add-new-item";
	}
	
	@PostMapping("/product-save")
	public String productSave(@Valid @ModelAttribute ProductMaster product, BindingResult result,Model model ) {
		List<ProductMaster> availableProducts=this.productService.getAllProducts();
		if(result.hasErrors())
		{
			return "add-new-item";
		}
		else
		{
		ProductMaster productAdded = this.productService.addNewProduct(product);
		if(!Objects.equals(productAdded,null))
		availableProducts.add(productAdded);
		model.addAttribute("availableProducts", availableProducts);
		return "redirect:product-list";
		}
	}
	

	@GetMapping("/product-list")
	public String productList(Model model) {
		List<ProductMaster> availableProducts=this.productService.getAllProducts();
		model.addAttribute("availableProducts", availableProducts);
		return "show-all-item-admin";
	}
	
	@GetMapping("/product-delete/{productId}")
	public String productDelete(@PathVariable("productId") int productId,Model model) {
		ProductMaster deletedProduct=this.productService.deleteProduct(productId);
		List<ProductMaster> availableProducts=this.productService.getAllProducts();
		model.addAttribute("availableProducts", availableProducts);
		return "show-all-item-admin";
	}
	
	@RequestMapping("/*")
	public String invalidUrl()
	{
		return "invalidUrl";
	}
	@InitBinder
	public void intiBinder(WebDataBinder binder)
	{
		StringTrimmerEditor trimmer=new StringTrimmerEditor(true);
		binder.registerCustomEditor(String.class,trimmer);
	}
	
}
