package com.zoya.food.repositories;

import org.springframework.data.repository.CrudRepository;

import com.zoya.food.models.Review;

public interface ReviewRepository extends CrudRepository<Review, Long> {

}
