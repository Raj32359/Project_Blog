package com.ayvan.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer categoryId;
	private String categoryName;
	private String categoryDescription;
	@OneToMany(mappedBy = "category", cascade=CascadeType.ALL)
	private List<Product> product = new ArrayList<>();
	
	public Category() {
		// TODO Auto-generated constructor stub
	}

	public Category(String categoryName, String categoryDescription, List<Product> product) {
		super();
		this.categoryName = categoryName;
		this.categoryDescription = categoryDescription;
		this.product = product;
	}

	public Category(String categoryName, String categoryDescription) {
		super();
		this.categoryName = categoryName;
		this.categoryDescription = categoryDescription;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryDescription() {
		return categoryDescription;
	}

	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}

	public List<Product> getProduct() {
		return product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryName=" + categoryName + ", categoryDescription="
				+ categoryDescription + ", product=" + product + "]";
	}

	
	
}
