package com.zoya.food.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.zoya.food.models.Recipe;
import com.zoya.food.models.User;
import com.zoya.food.services.UserService;


@Component
public class UserValidator implements Validator {
	
	 @Autowired
	    UserService userService;
	
	//supports(Class<?>): Specifies that a instance of the User Domain Model can be validated with this custom validator.
	@Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }
    
	//validate(Object, Errors): Creating custom validation. We can add errors via .rejectValue(String, String).
    @Override
    public void validate(Object object, Errors errors) {
        User user = (User) object;
        
        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
            
            errors.rejectValue("passwordConfirmation", "Match");
        }
        
        User existing = userService.findByUsername(user.getUsername());

		if (existing != null){
			errors.rejectValue("username", "Exists");
		}
    }
 
//    public void Recipevalidate(Object object, Errors errors) {
//        Recipe recipe = (Recipe) object;
//        
//        if (recipe.getTitle().length()<2) {
//            
//            errors.rejectValue("Name", "title");
//        }
//        
//        if (recipe.getDescription().length()<5) {
//            
//            errors.rejectValue("description", "Size");
//        }
//
//    }
}