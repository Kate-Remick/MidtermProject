package com.skilldistillery.fitnessfinder.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Activity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	@ManyToMany
	@JoinTable(name = "activity_category", joinColumns = @JoinColumn(name = "activity_id"), inverseJoinColumns = @JoinColumn(name = "category_id"))
	private List<Category> categories;
	

	@ManyToMany
	@JoinTable(name = "facility_activity", joinColumns = @JoinColumn(name = "activity_id"), inverseJoinColumns = @JoinColumn(name = "facility_id"))
	private List<Facility> facilities;

	public Activity() {
		super();
	}
	
	//****************
	public void addCategory(Category category) {
		if (categories == null) {
			categories = new ArrayList<>();
			
		}
		if (!categories.contains(category)) {
			categories.add(category);
			category.addActivity(this);
		}
	}
	
	public void removeCategory(Category category) {
		if (categories != null && categories.contains(category)) {
			categories.remove(category);
			category.removeActivity(this);
		}
	}
	//****************
	
	public void addFacility(Facility facility) {
		if (facilities == null) {
			facilities = new ArrayList<>();
			
		}
		if (!facilities.contains(facility)) {
			facilities.add(facility);
			facility.addActivity(this);
		}
	}
	
	public void removeFacility(Facility facility) {
		if (facilities != null && facilities.contains(facility)) {
			facilities.remove(facility);
			facility.removeActivity(this);
		}
	}
	//**************
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public List<Facility> getFacilities() {
		return facilities;
	}

	public void setFacilities(List<Facility> facilities) {
		this.facilities = facilities;
	}

	@Override
	public String toString() {
		return "Activity [id=" + id + ", name=" + name + "]";
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
		Activity other = (Activity) obj;
		return id == other.id;
	}

}
