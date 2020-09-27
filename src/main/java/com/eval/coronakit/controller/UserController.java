package com.eval.coronakit.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionAttributeStore;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eval.coronakit.entity.CoronaKit;
import com.eval.coronakit.entity.KitDetail;
import com.eval.coronakit.entity.ProductMaster;
import com.eval.coronakit.service.CoronaKitService;
import com.eval.coronakit.service.KitDetailService;
import com.eval.coronakit.service.ProductService;

@Controller
@RequestMapping("/user")
@SessionAttributes({"kitDetails","totalAmount"})
public class UserController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CoronaKitService coronaKitService;
	
	@Autowired
	KitDetailService kitDetailService;
	
	@RequestMapping("/home")
	public String home() {
		return "user-home";
	}
	
	@RequestMapping("/show-kit")
	public String showKit(Model model) {
		
		return "show-cart";
	}

	@RequestMapping("/show-list")
	public String showList(Model model) {
		List<ProductMaster> availableProducts=this.productService.getAllProducts();
		model.addAttribute("availableProducts", availableProducts);
		return "show-all-item-user";
	}
	
	@GetMapping("/add-to-cart/{productId}")
	public String showKit(@PathVariable("productId") int productId,Model model) {
		List<KitDetail> kitDetails=(List<KitDetail>) model.getAttribute("kitDetails");
		List<ProductMaster> availableProducts=this.productService.getAllProducts();
		boolean isProductThereInCart=false;
		ProductMaster productAddedToCart = this.productService.getProductById(productId);
		if(Objects.equals(kitDetails,null))
		{
			kitDetails=new ArrayList<KitDetail>();			
			
		}
		else
		{
			for(KitDetail kitDetail:kitDetails)
			{
				if(kitDetail.getProductId()==productId)
				{
					kitDetail.setQuantity(kitDetail.getQuantity()+1);
					kitDetail.setAmount(kitDetail.getAmount()+productAddedToCart.getCost());
					isProductThereInCart=true;
				}
				
			}
		}
		
		if(!isProductThereInCart)
		{
			KitDetail order=new KitDetail(productId,1,productAddedToCart.getCost(),productAddedToCart.getProductName(),productAddedToCart.getProductDescription());
			kitDetails.add(order);

		}
		
		model.addAttribute("kitDetails", kitDetails);
		return "show-cart";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/checkout")
	public String checkout(Model model) {
		CoronaKit coronaKit=new CoronaKit();
		int totalAmount=0;
		List<KitDetail> kitDetails= (List<KitDetail>) model.getAttribute("kitDetails");
		
		if(!Objects.equals(kitDetails,null))
		{
			for(KitDetail kit:kitDetails)
			{
				totalAmount=totalAmount+kit.getAmount();
			}
		}
		model.addAttribute("coronaKit", coronaKit);
		model.addAttribute("totalAmount", totalAmount);
		return "checkout-address";
	}
	
	@PostMapping("/finalize")
	public String finalizeOrder(@Valid @ModelAttribute CoronaKit coronaKit, BindingResult result,Model model,WebRequest request,SessionStatus status) {
		if(result.hasErrors())
		{
			return "checkout-address";
		}
		else
		{		
		
		CoronaKit newlyOrderedCoronaKit=new CoronaKit();
		@SuppressWarnings("unchecked")
		List<KitDetail> kitDetails= (List<KitDetail>) model.getAttribute("kitDetails");
		Integer totalAmount=(Integer) model.getAttribute("totalAmount");
		
		if(!Objects.equals(coronaKit,null))
		{
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
			Date date = new Date();
			coronaKit.setOrderDate(dateFormat.format(date));
			coronaKit.setTotalAmount(totalAmount);
			newlyOrderedCoronaKit=coronaKitService.saveKit(coronaKit);
			System.out.println(newlyOrderedCoronaKit.getTotalAmount());
			
		}
		
	
		if(!Objects.equals(kitDetails,null))
		{
			for(KitDetail kit:kitDetails)
			{
				kit.setCoronaKitId(newlyOrderedCoronaKit.getId());
				kitDetailService.addKitItem(kit);	
			}
		}
		model.addAttribute("finalKitDetails", kitDetails);
		model.addAttribute("coronaKit", coronaKit);
		status.setComplete();
		request.removeAttribute("kitDetails", WebRequest.SCOPE_SESSION);
		request.removeAttribute("totalAmount", WebRequest.SCOPE_SESSION);
		
		return "show-summary";
		}
	}
	
	@RequestMapping("/delete/{itemId}")
	public String deleteItem(@PathVariable("itemId") int itemId,Model model) {
		@SuppressWarnings("unchecked")
		List<KitDetail> kitDetails=(List<KitDetail>) model.getAttribute("kitDetails");
		for(KitDetail kitDetail:kitDetails)
		{
			if(kitDetail.getProductId()==itemId)
			{
				int costPerItem=kitDetail.getAmount()/kitDetail.getQuantity();
				kitDetail.setQuantity(kitDetail.getQuantity()-1);				
				kitDetail.setAmount(kitDetail.getAmount()-costPerItem);
				if(kitDetail.getQuantity()==0)
				{
					kitDetails.remove(kitDetail);
					
				}
				break;
			}
			
		}
		model.addAttribute("kitDetails", kitDetails);
		return "show-cart";
	}
	
	@RequestMapping("/*")
	public String invalidUrl()
	{
		return "invalidUrl";
	}
}
