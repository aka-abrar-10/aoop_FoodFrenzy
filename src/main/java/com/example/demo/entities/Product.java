package com.example.demo.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "product_table")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int pid;
	private String pname;
	private double pprice;
	private String pdescription;
	private String pimage; // Image path
	private String pcategory; // Category: biryani, chicken, paneer, chinese, north-indian
	private double prating; // Rating: 1.0 to 5.0

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public double getPprice() {
		return pprice;
	}

	public void setPprice(double pprice) {
		this.pprice = pprice;
	}

	public String getPdescription() {
		return pdescription;
	}

	public void setPdescription(String pdescription) {
		this.pdescription = pdescription;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public String getPcategory() {
		return pcategory;
	}

	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}

	public double getPrating() {
		return prating;
	}

	public void setPrating(double prating) {
		this.prating = prating;
	}

	@Override
	public String toString() {
		return "Product [pid=" + pid + ", pname=" + pname + ", pprice=" + pprice + ", pdescription=" + pdescription
				+ ", pimage=" + pimage + ", pcategory=" + pcategory + ", prating=" + prating + "]";
	}
}