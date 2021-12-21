package com.wei.creditcards.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.wei.creditcards.models.CreditCard;
import com.wei.creditcards.services.CreditCardService;

@RestController
public class APIController {
	@Autowired
	private CreditCardService ccService;
	
	@GetMapping("/api/creditcards")
	public List<CreditCard> index() {
		return ccService.findCCs();
	}
	
	@GetMapping("/api/creditcards/{id}")
	public CreditCard oneCard(
			@PathVariable("id")Long id) {
		CreditCard card = ccService.findCC(id);
		ccService.convertBenefits(id);
		return card;
	}
}
