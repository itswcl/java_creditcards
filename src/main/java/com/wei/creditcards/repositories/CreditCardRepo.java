package com.wei.creditcards.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.wei.creditcards.models.CreditCard;

@Repository
public interface CreditCardRepo extends CrudRepository<CreditCard, Long> {
	List<CreditCard> findAll();
}
