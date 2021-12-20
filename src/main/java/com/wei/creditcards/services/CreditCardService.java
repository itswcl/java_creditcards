package com.wei.creditcards.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wei.creditcards.models.CreditCard;
import com.wei.creditcards.repositories.CreditCardRepo;

@Service
public class CreditCardService {
	@Autowired
	private CreditCardRepo ccRepo;
	
	public List<CreditCard> findCCs() {
		return ccRepo.findAll();
	}
	
	public CreditCard findCC(Long id) {
		Optional<CreditCard> optionalCC = ccRepo.findById(id);
		
		if (optionalCC.isPresent()) {
			return optionalCC.get();
		} else {
			return null;
		}
	}
}
