package com.skilldistillery.rewardforpay.data;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import com.skilldistillery.rewardforpay.entities.Message;
import com.skilldistillery.rewardforpay.entities.MessageGroup;

@Service
public class MessagingService {
	
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	public void sendMessage(String to, Message message) {
		jdbcTemplate.update("INSERT INTO message (message_content, message_from, message_to, created)" +
							" VALUES(?, ?, ?, current_time)", message.getMessage(), message.getFromLogin(), to);
		
		simpMessagingTemplate.convertAndSend("/topic/messages/" + to, message);
	}
	
	
	public List<Map<String, Object>> getListMessage(@PathVariable("from") Integer from, @PathVariable("to") Integer to) {
		return jdbcTemplate.queryForList("SELECT * from message where (message_from = ? AND message_to = ?)" +
				" OR (message_to = ? AND message_from = ?) ORDER BY created ASC", from, to, from, to);
	}
	
	
	public List<Map<String, Object>> getListMessageGroups(@PathVariable("groupid") Integer groupid) {
			return jdbcTemplate.queryForList("SELECT gm.*, us.name AS name FROM group_message gm JOIN user us ON" +
						" us.id = gm.user_id WHERE gm.group_id =? ORDER BY created ASC", groupid);
	}
	
	
	public void sendMessageGroup(Integer to, MessageGroup message) {
		jdbcTemplate.update("INSERT INTO 'group_message'('group_id', 'user_id', 'message', 'created') " +
				"VALUES(?, ?, ?, current_timestamp)", to, message.getFromLogin(), message.getMessage());
		message.setGroupId(to);
		simpMessagingTemplate.convertAndSend("/topic/messages/group/" + to, message);
	}
}
