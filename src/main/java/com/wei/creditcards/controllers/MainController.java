package com.wei.creditcards.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
}
