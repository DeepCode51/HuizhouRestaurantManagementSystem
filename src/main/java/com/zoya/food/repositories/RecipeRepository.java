package com.zoya.food.repositories;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.zoya.food.models.Recipe;

public interface RecipeRepository extends CrudRepository<Recipe, Long> {
	ArrayList<Recipe> findByTitleContaining(String search);
	
	@Query(value="SELECT * FROM recipes ORDER BY avg_Rating DESC LIMIT 5", nativeQuery=true)
	public ArrayList<Recipe> OrderByRating();
}
