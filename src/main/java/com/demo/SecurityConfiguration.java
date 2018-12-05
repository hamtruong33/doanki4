package com.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.context.SecurityContextPersistenceFilter;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter;

import com.demo.services.UserService;



@EnableWebSecurity
@Configuration
@Order(1)
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private UserService userService;
	
	@Override
	protected void configure(HttpSecurity httpSecurity) throws Exception {
		httpSecurity.cors().and().csrf().disable();
		httpSecurity.antMatcher("/user/**")
					//.antMatcher("/checkout/**")
					.authorizeRequests()
					//.antMatchers("/").permitAll()
					.antMatchers("/user/**").access("hasRole('ROLE_Buyer')")
					//.antMatchers("/checkout/**").access("hasRole('ROLE_Buyer')")
					.and()
					.formLogin().loginPage("/home/login")
					.loginProcessingUrl("/user/process-login")
					.defaultSuccessUrl("/user/profile")
					.failureUrl("/home/login?error")
					.usernameParameter("username").passwordParameter("password")//username, password la name trong form login
					.and()
					.logout().logoutUrl("/user/logout")
					.logoutSuccessUrl("/home/login?logout")
					.deleteCookies("JSESSIONID")
					.invalidateHttpSession(true)
					.and()
					.exceptionHandling().accessDeniedPage("/home/login?accessDenied");
//		httpSecurity.authorizeRequests()
//					.antMatchers("/").permitAll();
	}
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder builder) throws Exception {
		builder.userDetailsService(userService);
	}
	
	@Bean
	public BCryptPasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}
	@Bean
	public SecurityContextHolderAwareRequestFilter awareRequestFilter() {
	    return new SecurityContextHolderAwareRequestFilter();
	}
	
	@Bean
	public SecurityContextPersistenceFilter persistenceFilter() {
		return new SecurityContextPersistenceFilter();
	}
}
