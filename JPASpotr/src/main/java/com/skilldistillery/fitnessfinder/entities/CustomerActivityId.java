package com.skilldistillery.fitnessfinder.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class CustomerActivityId implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "activity_id")
	private int activityId;

	@Column(name = "customer_id")
	private int customerId;

	public CustomerActivityId() {
		super();
	}

	public int getActivityId() {
		return activityId;
	}

	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	@Override
	public String toString() {
		return "CustomerActivityId [activityId=" + activityId + ", customerId=" + customerId + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(activityId, customerId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CustomerActivityId other = (CustomerActivityId) obj;
		return activityId == other.activityId && customerId == other.customerId;
	}

}
