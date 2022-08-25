package com.skilldistillery.rewardforpay.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="point_award")
public class PointAwarded {
	
	@Id  
	@GeneratedValue( strategy =GenerationType.IDENTITY)
	private int id;
	
	private int amount;
	
	@CreationTimestamp
	private LocalDate issued;
	
	@ManyToOne
	@JoinColumn(name="employee_id")
	private Employee employee;
		
	private String description;
	
	@ManyToOne
	@JoinColumn(name="award_status_id")
	private Status status;
	
	private boolean judgement;
	
	@ManyToOne
	@JoinColumn(name="requested_id")
	private User user;

	
	
	
	public PointAwarded() {
		super();
	}
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}


	public LocalDate getIssued() {
		return issued;
	}



	public void setIssued(LocalDate issued) {
		this.issued = issued;
	}



	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public boolean isJudgement() {
		return judgement;
	}

	public void setJudgement(boolean judgement) {
		this.judgement = judgement;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}


	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PointAwarded other = (PointAwarded) obj;
		return id == other.id;
	}

	
}
