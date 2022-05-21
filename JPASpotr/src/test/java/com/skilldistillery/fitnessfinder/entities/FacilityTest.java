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

class FacilityTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Facility facility;

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
		facility = em.find(Facility.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		facility = null;
	}

	@Test
	@DisplayName("Testing basic mapping")
	void test1() {
		assertNotNull(facility);
		assertEquals("GloboGym", facility.getName());
		assertEquals("Ben Stiller", facility.getOwnerName());
	}
	@Test
	@DisplayName("Testing address mapping")
	void test2() {
		assertNotNull(facility);
		assertNotNull(facility.getAddress());
		assertEquals("100 Elm", facility.getAddress().getStreetAddress1());
	}
	@Test
	@DisplayName("Testing customer mapping")
	void test3() {
		assertNotNull(facility);
		assertNotNull(facility.getCustomers());
		assertTrue(facility.getCustomers().size() > 0);
	}
	@Test
	@DisplayName("Testing login mapping")
	void test4() {
		assertNotNull(facility);
		assertNotNull(facility.getLogin());
		assertEquals("kobrakommander",facility.getLogin().getUsername());
	}
	@Test
	@DisplayName("Testing activity mapping")
	void test5() {
		assertNotNull(facility);
		assertNotNull(facility.getActivities());
		assertTrue(facility.getActivities().size() > 0 );
		assertEquals("Powerlifting", facility.getActivities().get(0).getName());
	}
}
