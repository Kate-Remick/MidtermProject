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

class JournalTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Journal journal;

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
		journal = em.find(Journal.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		journal = null;
	}

	@Test
	@DisplayName("Testing basic mapping")
	void test1() {
		assertNotNull(journal);
		assertEquals("workout 1", journal.getEntry());
	}
	@Test
	@DisplayName("Testing createdAt mapping")
	void test2() {
		assertNotNull(journal);
		assertNotNull(journal.getCreatedAt());
		assertEquals(2022, journal.getCreatedAt().getYear());
	}
	@Test
	@DisplayName("Testing customer mapping")
	void test3() {
		assertNotNull(journal);
		assertNotNull(journal.getCustomer());
		assertEquals("Max", journal.getCustomer().getFirstName());
	}
	@Test
	@DisplayName("Testing goal mapping")
	void test4() {
		assertNotNull(journal);
		assertNotNull(journal.getGoal());
		assertEquals("Pump Iron", journal.getGoal().getName());
	}

}
