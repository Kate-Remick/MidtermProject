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
import org.junit.jupiter.api.Test;

class FacilityPreferencesTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private FacilityPreferences facilityPreferences;

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
		facilityPreferences = em.find(FacilityPreferences.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		facilityPreferences = null;
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(facilityPreferences);
		assertTrue(facilityPreferences.isAlwaysOpen());
		assertEquals(100, facilityPreferences.getPriceMax());
	}

}
