package com.login;

public class Product {
private int hsn_code;
private String name;
private Double stock_left;
private Double stock_sold;
private Double price;



public int getHsn_code() {
	return hsn_code;
}
public void setHsn_code(int hsn_code) {
	this.hsn_code = hsn_code;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public Double getStock_left() {
	return stock_left;
}
public void setStock_left(Double stock_left) {
	this.stock_left = stock_left;
}
public Double getStock_sold() {
	return stock_sold;
}
public void setStock_sold(Double stock_sold) {
	this.stock_sold = stock_sold;
}
public Double getPrice() {
	return price;
}
public void setPrice(Double price) {
	this.price = price;
}



}
