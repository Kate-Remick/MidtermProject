package com.skilldistillery.fitnessfinder.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Facility {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "mission_statement")
	private String missionStatement;

	@Column(name = "has_trainers")
	private boolean hasTrainers;

	private String brand;

	private String name;

	@Column(name = "owner_name")
	private String ownerName;

	@Column(name = "always_open")
	private boolean alwaysOpen;

	private Integer price;

	public Facility() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMissionStatement() {
		return missionStatement;
	}

	public void setMissionStatement(String missionStatement) {
		this.missionStatement = missionStatement;
	}

	public boolean isHasTrainers() {
		return hasTrainers;
	}

	public void setHasTrainers(boolean hasTrainers) {
		this.hasTrainers = hasTrainers;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public boolean isAlwaysOpen() {
		return alwaysOpen;
	}

	public void setAlwaysOpen(boolean alwaysOpen) {
		this.alwaysOpen = alwaysOpen;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Facility [id=" + id + ", missionStatement=" + missionStatement + ", hasTrainers=" + hasTrainers
				+ ", brand=" + brand + ", name=" + name + ", ownerName=" + ownerName + ", alwaysOpen=" + alwaysOpen
				+ ", price=" + price + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Facility other = (Facility) obj;
		return id == other.id;
	}

}
