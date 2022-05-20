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

class ActivityTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Activity activity;

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
		activity = em.find(Activity.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		activity = null;
	}

	@Test
	@DisplayName("Testing Activity mappings")
	void test1() {
		assertNotNull(activity);
		assertEquals("Powerlifting", activity.getName());
	}
	@Test
	@DisplayName("Testing MTM category")
	void test2() {
		assertNotNull(activity);
		assertNotNull(activity.getCategories());
		assertTrue(activity.getCategories().size() > 0);
	}
	@Test
	@DisplayName("Testing MTM facilities")
	void test3() {
		assertNotNull(activity);
		assertNotNull(activity.getFacilities());
		assertTrue(activity.getFacilities().size() > 0);
	}
}
