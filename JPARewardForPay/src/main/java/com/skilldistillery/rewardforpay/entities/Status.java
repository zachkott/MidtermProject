package com.skilldistillery.rewardforpay.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="request_status")
public class Status {

	@Id
	private int id;
	private String name;
	
	@OneToMany(mappedBy="status")
	private List<Prize> prizes;
	
	@OneToMany(mappedBy="requestStatus")
	private List<Employee> employees;
	
	@OneToMany(mappedBy="status")
	private List<PointAwarded> pointsAwarded;

	
	
	
	public Status() {
	}
	
	

	public List<Employee> getEmployees() {
		return employees;
	}



	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}



	public List<PointAwarded> getPointsAwarded() {
		return pointsAwarded;
	}



	public void setPointsAwarded(List<PointAwarded> pointsAwarded) {
		this.pointsAwarded = pointsAwarded;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Prize> getPrizes() {
		return prizes;
	}

	public void setPrizes(List<Prize> prizes) {
		this.prizes = prizes;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
		Status other = (Status) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Status [id=" + id + "]";
	}
	
	
}
