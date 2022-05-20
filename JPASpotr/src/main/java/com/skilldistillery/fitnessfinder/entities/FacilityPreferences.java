package com.skilldistillery.fitnessfinder.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="facility_preferences")
public class FacilityPreferences {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "always_open")
	private boolean alwaysOpen;

	@Column(name = "price_max")
	private Integer priceMax;

	@Column(name = "has_trainers")
	private boolean hasTrainers;

	public FacilityPreferences() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isAlwaysOpen() {
		return alwaysOpen;
	}

	public void setAlwaysOpen(boolean alwaysOpen) {
		this.alwaysOpen = alwaysOpen;
	}

	public Integer getPriceMax() {
		return priceMax;
	}

	public void setPriceMax(Integer priceMax) {
		this.priceMax = priceMax;
	}

	public boolean isHasTrainers() {
		return hasTrainers;
	}

	public void setHasTrainers(boolean hasTrainers) {
		this.hasTrainers = hasTrainers;
	}

	@Override
	public String toString() {
		return "FacilityPreferences [id=" + id + ", alwaysOpen=" + alwaysOpen + ", priceMax=" + priceMax
				+ ", hasTrainers=" + hasTrainers + "]";
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
		FacilityPreferences other = (FacilityPreferences) obj;
		return id == other.id;
	}

}
