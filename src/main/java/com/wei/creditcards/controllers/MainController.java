package com.wei.creditcards.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.wei.creditcards.models.CreditCard;
import com.wei.creditcards.services.CreditCardService;

@Controller
public class MainController {
	@Autowired
	private CreditCardService ccService;
	
	@GetMapping("/")
	public String index() {
		return "redirect:/creditcards";
	}
	
	@GetMapping("/creditcards")
	public String cards(Model model) {
		List<CreditCard> cards = ccService.findCCs();
		model.addAttribute("cards", cards);
		
		return "index.jsp";
	}
	
	@GetMapping("/creditcards/bank/{bank}")
	public String cardsWithBank(
			Model model,
			@PathVariable String bank
			) {
		List<CreditCard> cards = ccService.findByBank(bank);
		
		model.addAttribute("cards", cards);
		
		return "index.jsp";
	}
	
	@GetMapping("/creditcards/{id}")
	public String cards(
			@PathVariable Long id,
			Model model) {
		CreditCard card = ccService.findCC(id);
		ArrayList<String> benefits = ccService.convertBenefits(id);
		
		model.addAttribute("card", card);
		model.addAttribute("benefits", benefits);
		
		return "detail.jsp";
	}
}
