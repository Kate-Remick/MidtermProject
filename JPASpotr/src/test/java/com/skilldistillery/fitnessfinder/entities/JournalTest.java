package com.skilldistillery.fitnessfinder.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
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
	void test_User_entity_mapping() {
		assertNotNull(journal);
		assertEquals("workout 1", journal.getEntry());
	}

}
