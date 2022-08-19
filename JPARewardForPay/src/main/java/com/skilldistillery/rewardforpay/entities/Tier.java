package com.skilldistillery.rewardforpay.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Tier {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToMany(mappedBy="tier")
	private List<Prize> prize;

	
	
	
	
	public Tier() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Prize> getPrize() {
		return prize;
	}

	public void setPrize(List<Prize> prize) {
		this.prize = prize;
	}

	@Override
	public String toString() {
		return "Tier [id=" + id + ", prize=" + prize + "]";
	}
	
	
}
