package com.skilldistillery.fitnessfinder.entities;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	@Column(name = "birth_date")
	private LocalDate birthDate;

	private String bio;

	@OneToOne
	@JoinColumn(name = "address_id")
	private Address address;

	@ManyToMany
	@JoinTable(name = "customer_facility", joinColumns = @JoinColumn(name = "customer_id"), inverseJoinColumns = @JoinColumn(name = "facility_id"))
	private List<Facility> facilities;
	// TODO: Add/Remove methods

	@ManyToOne
	@JoinColumn(name = "gender_id")
	private Gender gender;

	@OneToMany(mappedBy = "customer")
	private List<Journal> logs;
	// TODO: Add/Remove/Edit methods

	@OneToMany(mappedBy = "customer")
	private List<Goal> goals;
	// TODO: Add/Remove/Edit methods

	@OneToOne
	@JoinColumn(name = "login_id")
	private Login login;

	@OneToMany(mappedBy = "customer")
	private List<CustomerActivity> customerActivities;
	// TODO: ADD/REMOVE methods

	@OneToOne
	@JoinColumn(name = "facility_preferences_id")
	private FacilityPreferences facilityPreferences;

	public Customer() {
		super();
	}
	
//	//****************
//		public void addCategory(Category category) {
//			if (categories == null) {
//				categories = new ArrayList<>();
//				
//			}
//			if (!categories.contains(category)) {
//				categories.add(category);
//				category.addActivity(this);
//			}
//		}
//		
//		public void removeCategory(Category category) {
//			if (categories != null && categories.contains(category)) {
//				categories.remove(category);
//				category.removeActivity(this);
//			}
//		}
//		
//		//****************
//		public void addCategory(Category category) {
//			if (categories == null) {
//				categories = new ArrayList<>();
//				
//			}
//			if (!categories.contains(category)) {
//				categories.add(category);
//				category.addActivity(this);
//			}
//		}
//		
//		public void removeCategory(Category category) {
//			if (categories != null && categories.contains(category)) {
//				categories.remove(category);
//				category.removeActivity(this);
//			}
//		}
//		//****************
//		//****************

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public LocalDate getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(LocalDate birthDate) {
		this.birthDate = birthDate;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<Facility> getFacilities() {
		return facilities;
	}

	public void setFacilities(List<Facility> facilities) {
		this.facilities = facilities;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public List<Journal> getLogs() {
		return logs;
	}

	public void setLogs(List<Journal> logs) {
		this.logs = logs;
	}

	public List<Goal> getGoals() {
		return goals;
	}

	public void setGoals(List<Goal> goals) {
		this.goals = goals;
	}

	public List<CustomerActivity> getCustomerActivities() {
		return customerActivities;
	}

	public void setCustomerActivities(List<CustomerActivity> customerActivities) {
		this.customerActivities = customerActivities;
	}

	public Login getLogin() {
		return login;
	}

	public void setLogin(Login login) {
		this.login = login;
	}

	public FacilityPreferences getFacilityPreferences() {
		return facilityPreferences;
	}

	public void setFacilityPreferences(FacilityPreferences facilityPreferences) {
		this.facilityPreferences = facilityPreferences;
	}

	@Override
	public String toString() {
		return "Customer [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", birthDate=" + birthDate
				+ ", bio=" + bio + "]";
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
		Customer other = (Customer) obj;
		return id == other.id;
	}

}
