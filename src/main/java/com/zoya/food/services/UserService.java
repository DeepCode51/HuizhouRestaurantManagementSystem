package com.zoya.food.services;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.zoya.food.models.Role;
import com.zoya.food.models.User;
import com.zoya.food.repositories.RoleRepository;
import com.zoya.food.repositories.UserRepository;



@Service
public class UserService {
	private UserRepository userRepository;
    private RoleRepository roleRepository;
    private RoleService roleService;
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    
    public UserService(UserRepository userRepository, RoleRepository roleRepository, BCryptPasswordEncoder bCryptPasswordEncoder,RoleService roleService){
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
        this.roleService=roleService;
    }
    
    //Saves a client with only the user role.
    public void saveWithUserRole(User user) {
    	 user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
         user.setRoles(roleRepository.findByName("ROLE_USER"));
         userRepository.save(user);

   }
    
//    public void addAdminRole(User user) {
//    	List<Role> role=roleService.findAll();
//  
//    	if(role == null) {
//    		roleService.createRoles();
//    		
//    	}
//
//        List<Role> userroles = user.getRoles();
//        List<Role> adminrole = roleRepository.findByName("ROLE_ADMIN");
//    	List<Role> newList = Stream.concat(userroles.stream(), adminrole.stream()).collect(Collectors.toList());	
//        user.setRoles(newList);
//      
//        userRepository.save(user);
//    }   
    
    //Saves a client with only the admin role.
    public void saveUserWithAdminRole(User user) {
    	List<Role> role=roleService.findAll();
    	  System.out.println(role+"=======");
   //create rows of ADMIN and USER in roles table. 	  
    	if(role.isEmpty()) {
    		roleService.createRoles();
    		System.out.println(role+"******");
    		
    	}
    
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_ADMIN"));
        userRepository.save(user);
    }    
    
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public ArrayList<User> all() {
    	return (ArrayList<User>) userRepository.findAll();
    }

    public User findById(Long id) {
		return userRepository.findOne(id);
	}
	
    public void update(User user) {
        userRepository.save(user);
    }

	public void delete(Long id) {
		userRepository.delete(id);
		
	}
    
}
