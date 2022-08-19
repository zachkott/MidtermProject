package com.skilldistillery.rewardforpay.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name="point_redemption")
public class PointRedemption {
	
	@Id  
	@GeneratedValue( strategy =GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="reward_id")
	private Prize prize;
	
	@ManyToOne
	@JoinColumn(name="employee_id")
	private Employee employee;
	
	@Column(name="redeemed_date")
	private LocalDateTime redeemedDate;
	

	public PointRedemption() {
		super();
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public Prize getPrize() {
		return prize;
	}



	public void setPrize(Prize prize) {
		this.prize = prize;
	}



	public Employee getEmployee() {
		return employee;
	}



	public void setEmployee(Employee employee) {
		this.employee = employee;
	}



	public LocalDateTime getRedeemedDate() {
		return redeemedDate;
	}



	public void setRedeemedDate(LocalDateTime redeemedDate) {
		this.redeemedDate = redeemedDate;
	}



	@Override
	public String toString() {
		return "PointRedemption [id=" + id + ", prize=" + prize + ", employee=" + employee + ", redeemedDate="
				+ redeemedDate + "]";
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
		PointRedemption other = (PointRedemption) obj;
		return id == other.id;
	}



	





	
	
}
