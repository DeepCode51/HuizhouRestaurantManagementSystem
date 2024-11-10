package com.zoya.food.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
private UserDetailsService userDetailsService;
    
    public WebSecurityConfig(UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }
	
	@Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
	
	@Override
    protected void configure(HttpSecurity http) throws Exception {
        http.
            authorizeRequests()
                .antMatchers("/","/home","/css/**","/images/**", "/js/**", "/registration").permitAll()
                .antMatchers("/admin/**").access("hasRole('ADMIN')")
                .anyRequest().authenticated()
                .and()
            .formLogin()
            	.defaultSuccessUrl("/home")
                .loginPage("/login")
                .permitAll()
                .and()
            .logout()
                .permitAll();
    }
	//This method is configuring Spring Security to use our custom implementation of the UserDetailsService with Bcrypt.
	@Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
    }    
}
//authorizeRequests(): Allows restricting access based upon the HttpServletRequest
//antMatchers("/css/**", "/js/**, "/registration"): PathMatcher implementation for Ant-style path patterns.
//** matches zero or more directories in a path.
//.anyRequest(): Maps any request
//.authenticated(): Specify URLs that are allowed by authenticated users only
//.formLogin(): Specifies to support form based authentication. Now, our users are going to be authenticated via a FORM
//.loginPage("/login"): Specifies the URL to send users to if login is required


