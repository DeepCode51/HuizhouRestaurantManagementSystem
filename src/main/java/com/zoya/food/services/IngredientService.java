package com.zoya.food.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zoya.food.models.Ingredient;
import com.zoya.food.repositories.IngredientRepository;

@Service
public class IngredientService {
	@Autowired
	private IngredientRepository ingRepo;
	
	public Ingredient create( String ingredient) {
		return ingRepo.save(new Ingredient(ingredient));
	}
	
	public List<Ingredient> all() {
		return (List<Ingredient>) ingRepo.findAll();
	}
	
	public Ingredient update(Ingredient ingredient) {
		return ingRepo.save(ingredient);
		
	}
	
	public ArrayList<Ingredient> findByIngredient(String ingredient) {
		return ingRepo.findByIngredient(ingredient);
	}
}
