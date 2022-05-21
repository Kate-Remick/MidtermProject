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

class GoalTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Goal goal;

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
		goal = em.find(Goal.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		goal = null;
	}

	@Test
	@DisplayName("Testing basic mapping")
	void test1() {
		assertNotNull(goal);
		assertEquals("Pump Iron", goal.getName());
	}
	@Test
	@DisplayName("Testing customer mapping")
	void test2() {
		assertNotNull(goal);
		assertNotNull(goal.getCustomer());
		assertEquals("Max", goal.getCustomer().getFirstName());
	}
	@Test
	@DisplayName("Testing journal mapping")
	void test3() {
		assertNotNull(goal);
		assertNotNull(goal.getLogs());
		assertEquals("workout 1", goal.getLogs().get(0).getEntry());
	}

}
