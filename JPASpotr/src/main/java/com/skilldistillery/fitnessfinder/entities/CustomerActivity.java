package com.skilldistillery.fitnessfinder.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "customer_activity")
public class CustomerActivity {

	@EmbeddedId
	private CustomerActivityId id;

	@Column(name = "skill_level")
	private Integer skillLevel;

	public CustomerActivity() {
		super();
	}

	public CustomerActivityId getId() {
		return id;
	}

	public void setId(CustomerActivityId id) {
		this.id = id;
	}

	public Integer getSkillLevel() {
		return skillLevel;
	}

	public void setSkillLevel(Integer skillLevel) {
		this.skillLevel = skillLevel;
	}

	@Override
	public String toString() {
		return "CustomerActivity [id=" + id + ", skillLevel=" + skillLevel + "]";
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
		CustomerActivity other = (CustomerActivity) obj;
		return id == other.id;
	}

}
