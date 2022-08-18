package com.skilldistillery.rewardforpay.data;

import com.skilldistillery.rewardforpay.entities.User;

public interface UserDAO {

		User findById(int userId);
}
