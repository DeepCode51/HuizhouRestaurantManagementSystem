package com.zoya.food.models;

import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Size;



@Entity
@Table(name="ingredients")
public class Ingredient {
	@Id
	@GeneratedValue
	private Long id;
	
	@Size(min=2,message="Ingredient name must be 2 characters on longer")
	private String ingredient;
	
    private Date createdAt;
    private Date updatedAt;
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "recipe_ing", 
        joinColumns = @JoinColumn(name = "ing_id"), 
        inverseJoinColumns = @JoinColumn(name = "recipe_id")
    )
    private List<Recipe> ing_recipes;
    
    public Ingredient() {
    	
    }
    public Ingredient(String ingredient) {
    	this.ingredient=ingredient;
    	this.createdAt=new Date();
    	this.updatedAt=new Date();
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getIngredient() {
		return ingredient;
	}

	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public List<Recipe> getIng_recipes() {
		return ing_recipes;
	}

	public void setIng_recipes(List<Recipe> ing_recipes) {
		this.ing_recipes = ing_recipes;
	}
    
	@PrePersist
	protected void onCreate() {
		this.setCreatedAt(new Date());
	}
	
	@PreUpdate
	protected void onUpdate() {
		this.setUpdatedAt(new Date());
	}
    
}
