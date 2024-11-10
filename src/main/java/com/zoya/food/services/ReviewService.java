package com.zoya.food.services;

import org.springframework.stereotype.Service;

import com.zoya.food.models.Review;
import com.zoya.food.repositories.ReviewRepository;

@Service
public class ReviewService {
	
	private ReviewRepository reviewRepo;
	
	public ReviewService(ReviewRepository reviewRepo) {
		this.reviewRepo = reviewRepo;
	}
	
	public Review create(Review review) {
		return reviewRepo.save(review);
	}
}
