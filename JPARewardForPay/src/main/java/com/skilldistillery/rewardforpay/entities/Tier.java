package com.skilldistillery.rewardforpay.entities;

import java.util.List;
import java.util.Objects;

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
	private String name;
	private int threshold;
	
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
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getThreshold() {
		return threshold;
	}

	public void setThreshold(int threshold) {
		this.threshold = threshold;
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
		Tier other = (Tier) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Tier [id=" + id + ", name=" + name + ", threshold=" + threshold + ", prize=" + prize.get(0).getName() + "]";
	}

}
