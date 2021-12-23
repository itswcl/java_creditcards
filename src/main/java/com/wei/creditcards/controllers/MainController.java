package com.wei.creditcards.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.wei.creditcards.models.CreditCard;
import com.wei.creditcards.models.LoginUser;
import com.wei.creditcards.models.User;
import com.wei.creditcards.services.CreditCardService;
import com.wei.creditcards.services.UserService;

@Controller
public class MainController {
	@Autowired
	private CreditCardService ccService;

	@Autowired
	private UserService userService;

	@GetMapping("/")
	public String index() {
		return "redirect:/creditcards";
	}

// ---------------- Admin register and log in---------------------------

	// register route display - disable after admin register 
	@GetMapping("/register")
	public String indexRegister(Model model, HttpSession session) {
		
//		if (session.getAttribute("user_id") != null) {
//			return "redirect:/creditcards";
//		}
//		
//		model.addAttribute("newUser", new User());
//
//		return "/admin/register.jsp";
		return "redirect:/creditcards";
	}

//	@PostMapping("/register")
//	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
//			HttpSession session) {
//
//		userService.register(newUser, result);
//
//		if (result.hasErrors()) {
//			model.addAttribute("newLogin", new LoginUser());
//			return "/user/index.jsp";
//		}
//
//		session.setAttribute("user_id", newUser.getId());
//		return "redirect:/login";
//	}

	// log in route display
	@GetMapping("/login")
	public String indexLogin(Model model, HttpSession session) {
		if (session.getAttribute("user_id") != null) {
			return "redirect:/creditcards";
		}

		model.addAttribute("newLogin", new LoginUser());
		return "/admin/login.jsp";
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {

		User user = userService.login(newLogin, result);

		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "/user/index.jsp";
		}
		session.setAttribute("user_id", user.getId());
		return "redirect:/creditcards";
	}
// ---------------creditcards all and card detail-------------------------------------------------

	@GetMapping("/creditcards")
	public String cards(Model model) {
		List<CreditCard> cards = ccService.findCCs();
		model.addAttribute("cards", cards);
		
//		User user = userService.displayUser((Long) ses.getAttribute("user_id"));
//		model.addAttribute("user", user);
		
		return "index.jsp";
	}

	@GetMapping("/creditcards/bank/{bank}")
	public String cardsWithBank(Model model, @PathVariable String bank) {
		List<CreditCard> cards = ccService.findByBank(bank);

		model.addAttribute("cards", cards);

		return "index.jsp";
	}

	@GetMapping("/creditcards/{id}")
	public String cards(@PathVariable Long id, Model model) {
		CreditCard card = ccService.findCC(id);
		ArrayList<String> benefits = ccService.convertBenefits(id);

		model.addAttribute("card", card);
		model.addAttribute("benefits", benefits);

		return "detail.jsp";
	}
	
// ---------------- credit card detail edit --------------------------
	@GetMapping("creditcards/{id}/edit")
	public String cardEditForm(@PathVariable("id") Long cardId, Model model, HttpSession ses) {
		Long userId = (Long) ses.getAttribute("user_id");
		CreditCard card = ccService.findCC(cardId);
		
		if (userId == null) {
			return "redirect:/creditcards";
		} else {
			model.addAttribute("card", card);
			return "/admin/edit.jsp";
		}
	}
	
	@PutMapping("/creditcards/{id}/edit")
	public String cardSentForm(@Valid @ModelAttribute("card") CreditCard card, BindingResult result) {
		if (result.hasErrors()) {
			System.out.println(result);
			return "redirect:/creditcards/{id}/edit";
		} else {
			ccService.createCard(card);
			return "redirect:/creditcards/{id}";
		}
	}
	
	
}
