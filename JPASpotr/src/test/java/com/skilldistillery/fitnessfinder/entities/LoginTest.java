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

class LoginTest {


	private static EntityManagerFactory emf;
	private EntityManager em;
	private Login user;

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
		user = null;
	}

	@Test
	@DisplayName("Testing basic mapping")
	void test1() {
		user = em.find(Login.class, 1);
		assertNotNull(user);
		assertEquals("admin", user.getUsername());
	}
	// TODO ???
	@Test
	@DisplayName("Testing customer mapping")
	void test2() {
		user = em.find(Login.class, 1);
		assertNotNull(user);
		assertNotNull(user.getCustomer());
		assertEquals("Max", user.getCustomer().getFirstName());
	}
	@Test
	@DisplayName("Testing Facility mapping")
	void test3() {
		user = em.find(Login.class, 3);
		assertNotNull(user);
		assertNotNull(user.getFacility());
		assertEquals("GloboGym", user.getFacility().getName());
	}
	@Test
	@DisplayName("Testing role mapping")
	void test4() {
		user = em.find(Login.class, 3);
		assertNotNull(user);
		assertNotNull(user.getRole());
		assertEquals("facility_owner", user.getRole().getName());
	}
}
