package com.skilldistillery.rewardforpay.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class CompanyTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Company company;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPARewardForPay");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		company = em.find(Company.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		company=null;
		
	}
	
	@Test
	void test_Company_Entity_mapping() {
		assertNotNull(company);
		assertEquals("Social Engineering", company.getName());
		assertEquals("Bringing together people, whether you like it or not.", company.getDescription());


	}
	
	@Test
	public void test_Company_to_address_association() {
		Address address = company.getAddress();
		assertNotNull(address);
		assertEquals("5934 Se Duke St", address.getStreet());
		assertEquals("Portland", address.getCity());
		assertEquals("Oregon", address.getState());
		assertEquals("97206", address.getPostalCode());
	}
	
	@Test
	void test_Company_Department_OneToMany_mapping() {
		assertNotNull(company);
		assertNotNull(company.getDepartments());
		assertTrue(company.getDepartments().size() >  0);
	}
}
