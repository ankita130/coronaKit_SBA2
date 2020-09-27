package com.eval.coronakit.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class KitDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int coronaKitId;
	private int productId;
	private int quantity;
	private int amount;
	private String productName;
	private String productDescription;
	
	public KitDetail() {
		// TODO Auto-generated constructor stub
	}
	
	public KitDetail(int id, int coronaKitId, int productId, int quantity, int amount,String productName,String productDescription) {
		this.id = id;
		this.coronaKitId = coronaKitId;
		this.productId = productId;
		this.quantity = quantity;
		this.amount = amount;
		this.setProductName(productName);
		this.setProductDescription(productDescription);
	}
	
	public KitDetail(int productId, int quantity, int amount,String productName,String productDescription) {
		this.productId = productId;
		this.quantity = quantity;
		this.amount = amount;
		this.setProductName(productName);
		this.setProductDescription(productDescription);
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCoronaKitId() {
		return coronaKitId;
	}
	public void setCoronaKitId(int coronaKitId) {
		this.coronaKitId = coronaKitId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	
	
}
