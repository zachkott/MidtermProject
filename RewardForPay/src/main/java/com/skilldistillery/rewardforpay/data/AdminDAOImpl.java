package com.skilldistillery.rewardforpay.data;

import com.skilldistillery.rewardforpay.entities.Employee;
import com.skilldistillery.rewardforpay.entities.PointAwarded;
import com.skilldistillery.rewardforpay.entities.PointRedemption;
import com.skilldistillery.rewardforpay.entities.Prize;

public class AdminDAOImpl implements AdminDAO {



	@Override
	public boolean updateStatus(Object obj,int statusId) {
		boolean changed = false;
		if(obj instanceof Prize) {
			((Prize) obj).getStatus().setId(statusId);
			changed =true;
		}
		if(obj instanceof Employee) {
			((Employee) obj).getRequestStatus().setId(statusId);
			changed =true;
		}
		if(obj instanceof PointAwarded) {
			((PointAwarded) obj).getStatus().setId(statusId);
			changed =true;
		}
		return changed;
	}

}
