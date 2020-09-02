package com.ayvan.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productId;
	
	@Column(unique =  true)
	private String productName;
	private String productDescription;
	private String productPics;
	private Integer productPrice;
	private Integer productOffer;
	private Integer productQuantity;
	@ManyToOne
	private Category category;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(Integer productId, String productName, String productDescription, String productPics,
			Integer productPrice, Integer productOffer, Integer productQuantity, Category category) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPics = productPics;
		this.productPrice = productPrice;
		this.productOffer = productOffer;
		this.productQuantity = productQuantity;
		this.category = category;
	}

	public Product(String productName, String productDescription, String productPics, Integer productPrice,
			Integer productOffer, Integer productQuantity, Category category) {
		super();
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPics = productPics;
		this.productPrice = productPrice;
		this.productOffer = productOffer;
		this.productQuantity = productQuantity;
		this.category = category;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
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

	public String getProductPics() {
		return productPics;
	}

	public void setProductPics(String productPics) {
		this.productPics = productPics;
	}

	public Integer getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}

	public Integer getProductOffer() {
		return productOffer;
	}

	public void setProductOffer(Integer productOffer) {
		this.productOffer = productOffer;
	}

	public Integer getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(Integer productQuantity) {
		this.productQuantity = productQuantity;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productDescription="
				+ productDescription + ", productPics=" + productPics + ", productPrice=" + productPrice
				+ ", productOffer=" + productOffer + ", productQuantity=" + productQuantity + ", category=" + category
				+ "]";
	}
	
	
	
}
