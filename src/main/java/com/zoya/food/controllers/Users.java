package com.zoya.food.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.zoya.food.models.Recipe;
import com.zoya.food.models.User;
import com.zoya.food.services.RecipeService;
import com.zoya.food.services.UserService;
import com.zoya.food.validator.UserValidator;

@Controller
public class Users {
	private UserService userService;
	private UserValidator userValidator;
	private RecipeService recipeService;
    
    public Users(UserService userService, UserValidator userValidator,RecipeService recipeService) {
        this.userService = userService;
        this.userValidator = userValidator;
        this.recipeService=recipeService;
    }
    
    @RequestMapping("/home")
    public String home(Principal principal, Model model,@RequestParam(value="q",required=false) String q,RedirectAttributes flash) {
    	if(principal!= null) {
	        String username = principal.getName();
	        model.addAttribute("currentUser", userService.findByUsername(username));
    	}
    	if(q != null) {
			model.addAttribute("searchRecipes",recipeService.findByTitle(q));
			List<Recipe> allRecipes=recipeService.all();
			model.addAttribute("allRecipes",allRecipes);
		}
    	
    	else {
    		List<Recipe> allRecipes=recipeService.all();
    		model.addAttribute("allRecipes",allRecipes);
    		model.addAttribute("topRecipes",recipeService.topfive());
    		
    		}
    	
    			model.addAttribute("allRecipes",recipeService.all());
    	
        return "index";
    }
	
	@RequestMapping("/")
    public String loginForm() {
        return "Login";
    }
	
	@RequestMapping("/registration")
    public String registerForm(@Valid @ModelAttribute("user") User user) {
        return "register";
    }
	
	@PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session){
		userValidator.validate(user, result);
        if (result.hasErrors()) {
            return "register";
        }
        ArrayList<User> allUsers = userService.all();
		if (allUsers.size() == 0) {
			userService.saveUserWithAdminRole(user);

		}
		else {
		userService.saveWithUserRole(user);
		}
	
		return "redirect:/";
    }
	

    @RequestMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
        if(error != null) {
        	System.out.println("went worng");
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
            return "Login";
        }
        
        if(logout != null) {
        	System.out.println("logout success+++++++");
            model.addAttribute("logoutMessage", "Logout Successful!");
            return "Login";
        }
        
        System.out.println("login success***********");
        return "redirect:/home";
    }
    
    @RequestMapping("/admin/forRecipes")
    public String adminPage1(Principal principal, Model model) {
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        
        List<Recipe> allRecipes=recipeService.all();
        model.addAttribute("allRecipes",allRecipes);
        
        return "adminPage";
    }
    
    @RequestMapping("/admin/forUsers")
    public String adminPage2(Principal principal, Model model) {
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        
        List<User> allUsers=userService.all();
        model.addAttribute("allUsers",allUsers);
        
        return "adminPage2";
    }
    
   
}

