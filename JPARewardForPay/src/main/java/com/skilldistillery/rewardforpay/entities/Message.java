package com.skilldistillery.rewardforpay.entities;

public class Message {
	private String message;
	private int fromLogin;
	
	
	
	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public int getFromLogin() {
		return fromLogin;
	}
	
	public void setFromLogin(int fromLogin) {
		this.fromLogin = fromLogin;
	}
	
	@Override
	public String toString() {
		return "Message [message=" + message + ", fromLogin=" + fromLogin + "]";
	}
}