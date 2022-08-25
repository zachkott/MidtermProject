package com.skilldistillery.rewardforpay.data;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class UserAndGroupService {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	public List<Map<String, Object>> fetchAll(String myId) {
		List<Map<String, Object>> getAllUser = jdbcTemplate.queryForList("SELECT u.*, CONCAT(e.first_name, \" \",e.last_name)" +
					" AS eName, e.employee_photo AS image FROM user u join employee e on u.employee_id=e.id WHERE u.id != ?", myId);
		return getAllUser;
	}
	//https://cdn-icons-png.flaticon.com/128/1177/1177568.png
	//"SELECT * FROM user WHERE id != ?", myId
	public List<Map<String, Object>> fetchAllGroup(String groupId) {
		List<Map<String, Object>> getAllUser = jdbcTemplate.queryForList("SELECT gr.* FROM squad gr JOIN group_member gm " +
											"ON gm.squad_id = gr.id AND gm.user_id = ?", groupId);
		return getAllUser;
	}
}
