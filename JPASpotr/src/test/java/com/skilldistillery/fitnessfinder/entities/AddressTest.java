package com.skilldistillery.fitnessfinder.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class AddressTest {


	private static EntityManagerFactory emf;
	private EntityManager em;
	private Address address;

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
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		address = null;
	}

	@Test
	@DisplayName("Testing OTO facility mapping")
	void test1() {
		address = em.find(Address.class, 2);
		assertNotNull(address);
		assertNotNull(address.getFacility());
		assertEquals("GloboGym", address.getFacility().getName());
	}
	@Test
	@DisplayName("Testing OTO customer mapping")
	void test2() {
		address = em.find(Address.class, 1);
		assertNotNull(address);
		assertNotNull(address.getCustomer());
		assertEquals("Max",address.getCustomer().getFirstName());
	}

}
