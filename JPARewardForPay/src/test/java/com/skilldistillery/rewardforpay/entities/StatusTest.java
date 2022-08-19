package com.skilldistillery.rewardforpay.entities;

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

class StatusTest {
	static EntityManagerFactory emf;
	EntityManager em;
	private Actor actor;
	
	@BeforeAll
	static void setUpTest() {
		emf = Persistence.createEntityManagerFactory("VideoStore");
	}
	
	@AfterAll
	static void tearDownTest() {
		emf.close();
	}
	
	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		actor = em.find(Actor.class, 3);
	}

	@AfterEach
	void tearDown() throws Exception {
		actor = null;
		em.close();
	}

	@Test
	void test_Actor_creates_new_actor() {
		assertNotNull(actor);
		assertEquals("Ed", actor.getFirstName());
		assertEquals("Chase", actor.getLastName());
	}
	
	@Test
	void test_Actor_to_Films_mapping() {
		assertNotNull(actor);
		assertNotNull(actor.getFilms());
		assertEquals("ALONE TRIP", actor.getFilms().get(0).getTitle());
	}

}
