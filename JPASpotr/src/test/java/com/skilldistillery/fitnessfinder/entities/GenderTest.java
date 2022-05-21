package com.skilldistillery.fitnessfinder.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class GenderTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Gender gender;
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
		gender = em.find(Gender.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		gender = null;
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(gender);
		assertEquals("male", gender.getName());
	}
	
	@Test
	@DisplayName("test list of customers with a gender")
	void test_Customer_list() {
		assertNotNull(gender);
		assertNotNull(gender.getCustomers());
		assertTrue(gender.getCustomers().size() > 0);
	}

}
