package com.skilldistillery.fitnessfinder.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String title;

	@ManyToMany(mappedBy = "categories")
	private List<Activity> activities;

	public Category() {
		super();
	}

	// ***************
	public void addActivity(Activity activity) {
		if (activities == null) {
			activities = new ArrayList<>();

		}
		if (!activities.contains(activity)) {
			activities.add(activity);
			activity.addCategory(this);
		}
	}

	public void removeActivity(Activity activity) {
		if (activities != null && activities.contains(activity)) {
			activities.remove(activity);
			activity.removeCategory(this);
		}
	}
	// ******************

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<Activity> getActivities() {
		return activities;
	}

	public void setActivities(List<Activity> activities) {
		this.activities = activities;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", title=" + title + "]";
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
		Category other = (Category) obj;
		return id == other.id;
	}

}
