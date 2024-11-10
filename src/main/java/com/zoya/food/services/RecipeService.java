package com.zoya.food.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zoya.food.models.Recipe;
import com.zoya.food.repositories.RecipeRepository;

@Service
public class RecipeService {
	@Autowired
	private RecipeRepository recipeRepo;
	
	public Recipe create(Recipe recipe) {
		return recipeRepo.save(recipe);
	}
	
	public List<Recipe> all() {
		return (List<Recipe>) recipeRepo.findAll();
	}

	public Recipe findById(Long id) {
		return recipeRepo.findOne(id);
	}

	public Recipe update(Recipe recipe) {
		return recipeRepo.save(recipe);
		
	}

	public void delete(Long id) {
		recipeRepo.delete(id);
	}
	
	public ArrayList<Recipe> findByTitle(String search) {
		return   (ArrayList<Recipe>)recipeRepo.findByTitleContaining(search);
    }
	
	public ArrayList<Recipe> topfive(){
		return (ArrayList<Recipe>) recipeRepo.OrderByRating();
	}
	
//	public void destroy(Recipe recipe) {
//        recipeRepo.delete(recipe);
//    }
}
