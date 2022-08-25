package com.skilldistillery.rewardforpay.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.rewardforpay.data.MessagingService;
import com.skilldistillery.rewardforpay.data.UserAndGroupService;
import com.skilldistillery.rewardforpay.entities.Message;
import com.skilldistillery.rewardforpay.entities.MessageGroup;

@RestController
@CrossOrigin
public class MessageController {

	@Autowired
	MessagingService messageService;
	
	@Autowired
	UserAndGroupService uagService;
	
	
	
	@MessageMapping("/chat/{to}")
	public void sendPersonalMessage(@DestinationVariable String to, Message message) {
		messageService.sendMessage(to,  message);
	}
	
	
	@GetMapping("listmessage/{from}/{to}")
	public List<Map<String, Object>> getListMessageChat(@PathVariable("from") Integer from, @PathVariable("to") Integer to) {
		return messageService.getListMessage(from, to);
	}
	
	
	@MessageMapping("/chat/group/{to}")
	public void sendMessageToGroup(@DestinationVariable Integer to, MessageGroup message) {
		messageService.sendMessageGroup(to, message);
	}
	
	
	@GetMapping("listmessage/group/{groupid}")
	public List<Map<String, Object>> getListMessageGroupChat(@PathVariable("groupid") Integer groupid) {
		return messageService.getListMessageGroups(groupid);
	}
	
	
	@GetMapping("/fetchAllUsers/{myId}")
	public List<Map<String, Object>> fetchAll(@PathVariable("myId") String myId) {
		return uagService.fetchAll(myId);
	}

	
	@GetMapping("/fetchAllGroups/{groupid}")
	public List<Map<String, Object>> fetchAllGroup(@PathVariable("groupid") String groupid) {
		return uagService.fetchAllGroup(groupid);
	}
	
	
}
