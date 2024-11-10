package com.zoya.food.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonSubTypes.Type;


@Entity
@Table(name="recipes")
public class Recipe {
	
	@Id
	@GeneratedValue
	private Long id;
	
	@Size(min=2,message="Name must be 2 characters or longer")
	private String title;
	
	@Size(min=5,message="Description must be 5 characters or longer")
	private String description;
	
	@Column(length = 1500)
	@Size(min=15,message="Recipe should be atleast 15 characters long")
	private String formula;
	
	
	@Size(min=2,message="This field cannot be empty")
	private String prep;
	
	private Double avgRating;
	
	@Lob
	@Column(columnDefinition="longblob")
	private String img;
	
	private Date createdAt;
	private Date updatedAt;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User uploader;
	
	@OneToMany(mappedBy="recipe", fetch = FetchType.LAZY,cascade=CascadeType.ALL)
    private List<Review> reviews;
	
	@ManyToMany(fetch = FetchType.LAZY,cascade=CascadeType.MERGE)
    @JoinTable(
        name = "user_fav_recipes", 
        joinColumns = @JoinColumn(name = "recipe_id"), 
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<User> favs;
	
	@ManyToMany(fetch = FetchType.LAZY,cascade=CascadeType.ALL)
    @JoinTable(
        name = "recipe_ing", 
        joinColumns = @JoinColumn(name = "recipe_id"), 
        inverseJoinColumns = @JoinColumn(name = "ing_id")
    )
    private List<Ingredient> ingredients;
	
	public Recipe() {
		
	}

	
	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}


	public String getFormula() {
		return formula;
	}



	public void setFormula(String formula) {
		this.formula = formula;
	}

	

	public String getPrep() {
		return prep;
	}


	public void setPrep(String prep) {
		this.prep = prep;
	}


	public Double getAvgRating() {
		return avgRating;
	}



	public void setAvgRating(Double avgRating) {
		this.avgRating = avgRating;
	}

	

	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
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



	public User getUploader() {
		return uploader;
	}



	public void setUploader(User uploader) {
		this.uploader = uploader;
	}
	
	



	public List<Review> getReviews() {
		return reviews;
	}


	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	

	public List<User> getFavs() {
		return favs;
	}


	public void setFavs(List<User> favs) {
		this.favs = favs;
	}

	

	public List<Ingredient> getIngredients() {
		return ingredients;
	}


	public void setIngredients(List<Ingredient> ingredients) {
		this.ingredients = ingredients;
	}


	@PrePersist
	protected void onCreate(){
		this.updatedAt = new Date();
	    this.createdAt = new Date();
	}
	
	@PreUpdate
	protected void onUpdate(){
	    this.updatedAt = new Date();
	}

}
