package com.skilldistillery.rewardforpay.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
@Entity
public class PointAwarded {
	
	@Id  
	@GeneratedValue( strategy =GenerationType.IDENTITY)
	private int id;
	
	private int amount;
	
	private LocalDateTime issued;
	
	@ManyToOne
	@JoinColumn(name="employee_id")
	private int employeeId;
		
	private String description;
	
	@ManyToOne
	@JoinColumn(name="award_status_id")
	private int award_status_id;
	
	

	public PointAwarded() {
		super();
	}

	
}
