package com.skilldistillery.rewardforpay.data;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.rewardforpay.entities.Address;
import com.skilldistillery.rewardforpay.entities.Employee;
import com.skilldistillery.rewardforpay.entities.PointAwarded;
import com.skilldistillery.rewardforpay.entities.PointRedemption;
import com.skilldistillery.rewardforpay.entities.Prize;
import com.skilldistillery.rewardforpay.entities.Status;
import com.skilldistillery.rewardforpay.entities.User;

@Service
@Transactional
public interface AdminDAO {
	boolean updateStatus(Object obj,int statusId);	
		
}
