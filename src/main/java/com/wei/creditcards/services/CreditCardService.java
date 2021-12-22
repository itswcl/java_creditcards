package com.wei.creditcards.services;

import java.util.ArrayList;
import java.util.Arrays;
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
	
	public List<CreditCard> findByBank(String bank) {
		return ccRepo.findByBank(bank);
	}
	
	public CreditCard findCC(Long id) {
		Optional<CreditCard> optionalCC = ccRepo.findById(id);
		
		if (optionalCC.isPresent()) {
			return optionalCC.get();
		} else {
			return null;
		}
	}
	

	public ArrayList<String> convertBenefits(Long id) {
		Optional<CreditCard> optionalCC = ccRepo.findById(id);
		
		if (optionalCC.isPresent()) {
			CreditCard card = optionalCC.get();
			String list = card.getBenefits().replace("[\"", "").replace("\"]", "").replace("\", \"", "-");
			
			String[] listSplit = list.split("-");
			ArrayList<String> benefitList = new ArrayList<String>(Arrays.asList(listSplit));
			return benefitList;
				
		} else {
			return null;
		}
	}
}
