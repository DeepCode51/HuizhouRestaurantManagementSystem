package com.zoya.food.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoya.food.models.Role;
import com.zoya.food.repositories.RoleRepository;

@Service
public class RoleService {
	@Autowired
	private RoleRepository roleRepo;
	
	public void createRoles() {
		Role userRole = new Role("ROLE_USER");
		Role adminRole =new Role("ROLE_ADMIN");
		roleRepo.save(userRole);
		roleRepo.save(adminRole);
	}
	
	public List<Role> findByName(String name) {
		return roleRepo.findByName(name);
	}
	
	public List<Role> findAll() {
		return roleRepo.findAll();
	}


}
