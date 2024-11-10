package com.zoya.food.repositories;

import java.util.ArrayList;

import org.springframework.data.repository.CrudRepository;

import com.zoya.food.models.Ingredient;


public interface IngredientRepository extends CrudRepository<Ingredient, Long> {

	Ingredient save(String ingredient);
	
	ArrayList<Ingredient> findByIngredient(String ingredient);
	

}
