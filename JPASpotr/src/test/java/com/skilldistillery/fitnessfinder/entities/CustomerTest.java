package com.skilldistillery.fitnessfinder.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class CustomerTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Customer customer;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPASpotr");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		customer = em.find(Customer.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		customer = null;
	}

	@Test
	@DisplayName("Testing basic mapping")
	void test1() {
		assertNotNull(customer);
		assertEquals("Max", customer.getFirstName());
		assertEquals("hello", customer.getBio());
	}
	@Test
	@DisplayName("Testing address mapping")
	void test2() {
		assertNotNull(customer);
		assertNotNull(customer.getAddress());
		assertEquals("500 Oak St", customer.getAddress().getStreetAddress1());
	}
	@Test
	@DisplayName("Testing facility mapping")
	void test3() {
		assertNotNull(customer);
		assertNotNull(customer.getFacilities());
		assertTrue(customer.getFacilities().size() > 0);
	}
	@Test
	@DisplayName("Testing gender mapping")
	void test4() {
		assertNotNull(customer);
		assertNotNull(customer.getGender());
		assertEquals("male", customer.getGender().getName());
	}
	@Test
	@DisplayName("Testing journal mapping")
	void test5() {
		assertNotNull(customer);
		assertNotNull(customer.getLogs());
		assertEquals("workout 1", customer.getLogs().get(0).getEntry());
	}
	@Test
	@DisplayName("Testing goal mapping")
	void test6() {
		assertNotNull(customer);
		assertNotNull(customer.getGoals());
		assertEquals("Pump Iron", customer.getGoals().get(0).getName());
	}
	@Test
	@DisplayName("Testing login mapping")
	void test7() {
		assertNotNull(customer);
		assertNotNull(customer.getLogin());
		assertEquals("admin", customer.getLogin().getUsername());
	}
	@Test
	@DisplayName("Testing activity mapping")
	void test8() {
		assertNotNull(customer);
		assertNotNull(customer.getCustomerActivities());
		assertEquals("Powerlifting", customer.getCustomerActivities().get(0).getActivity().getName());
	}
	@Test
	@DisplayName("Testing facility preference mapping")
	void test9() {
		assertNotNull(customer);
		assertNotNull(customer.getFacilityPreferences());
		assertTrue(customer.getFacilityPreferences().isAlwaysOpen());
		assertEquals(100,customer.getFacilityPreferences().getPriceMax());
	}

}
