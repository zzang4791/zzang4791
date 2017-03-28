package com.jeil.domain;

import java.sql.Date;

public class ProductVO {

	private int product_no;
	private String product_category;
	private String product_title;
	private String product_writer;
	private String product_content;
	private String product_picture;
	private Date product_dt;
	
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public String getProduct_title() {
		return product_title;
	}
	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}
	public String getProduct_writer() {
		return product_writer;
	}
	public void setProduct_writer(String product_writer) {
		this.product_writer = product_writer;
	}
	public String getProduct_content() {
		return product_content;
	}
	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}
	public String getProduct_picture() {
		return product_picture;
	}
	public void setProduct_picture(String product_picture) {
		this.product_picture = product_picture;
	}
	public Date getProduct_dt() {
		return product_dt;
	}
	public void setProduct_dt(Date product_dt) {
		this.product_dt = product_dt;
	}

	
	
}
