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

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

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
	@Cascade(CascadeType.PERSIST)
	private Address address;

	@ManyToMany
	@JoinTable(name = "customer_facility", joinColumns = @JoinColumn(name = "customer_id"), inverseJoinColumns = @JoinColumn(name = "facility_id"))
	private List<Facility> facilities;

	@ManyToOne
	@JoinColumn(name = "gender_id")
	@Cascade(CascadeType.PERSIST)
	private Gender gender;

	@OneToMany(mappedBy = "customer")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Journal> logs;

	@OneToMany(mappedBy = "customer")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Goal> goals;

	@OneToOne
	@JoinColumn(name = "login_id")
	private Login login;

	@OneToMany(mappedBy = "customer")
	@Cascade(CascadeType.PERSIST)
	private List<CustomerActivity> customerActivities;

	@OneToOne
	@JoinColumn(name = "facility_preferences_id")
	@Cascade(CascadeType.PERSIST)
	private FacilityPreferences facilityPreferences;

	public Customer() {
		super();
	}
	
	//****************
		public void addFacility(Facility facility) {
			if (facilities == null) {
				facilities = new ArrayList<>();
				
			}
			if (!facilities.contains(facility)) {
				facilities.add(facility);
				facility.addCustomer(this);
			}
		}
		
		public void removeFacility(Facility facility) {
			if (facilities != null && facilities.contains(facility)) {
				facilities.remove(facility);
				facility.removeCustomer(this);
			}
		}
		
		
		public void addJournal(Journal journal) {
			if (logs == null) {
				logs = new ArrayList<>();
				
			}
			if (!logs.contains(journal)) {
				logs.add(journal);
				journal.setCustomer(this);
			}
			
		}
		
		public void removeJournal(Journal journal) {
			if (logs != null && logs.contains(journal)) {
				logs.remove(journal);
				
			}
		}
		
		public void addGoal(Goal goal) {
			if (goals == null) {
				goals = new ArrayList<>();
				
			}
			if (!goals.contains(goal)) {
				goals.add(goal);
				goal.setCustomer(this);
			}
		}
		
		public void removeGoal(Goal goal) {
			if (goals != null && facilities.contains(goal)) {
				goals.remove(goal);
			}
		}
		
		public void addCustomerActivity(CustomerActivity customerActivity) {
			if (customerActivities == null) {
				customerActivities = new ArrayList<>();
				
			}
			if (!customerActivities.contains(customerActivity)) {
				customerActivities.add(customerActivity);
				customerActivity.setCustomer(this);
			}
		}
		
		public void removeCustomerActivity(CustomerActivity customerActivity) {
			if (customerActivities != null && customerActivities.contains(customerActivity)) {
				customerActivities.remove(customerActivity);
				customerActivity.setCustomer(null);
			}
		}
		
		//****************

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
