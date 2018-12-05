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
@Order(2)
public class AdminSecurityConfiguration extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private UserService userService;
	
	@Override
	protected void configure(HttpSecurity httpSecurity) throws Exception {
		httpSecurity.cors().and().csrf().disable();
		httpSecurity.antMatcher("/admin/**")
					.authorizeRequests()
					.antMatchers("/admin/login").permitAll()
					.antMatchers("/admin/**").access("hasRole('ROLE_Admin') ")
					.and()
					.formLogin().loginPage("/admin/login")
					.loginProcessingUrl("/admin/process_login")
					.defaultSuccessUrl("/admin/home")
					.failureUrl("/admin/login?error")
					.usernameParameter("username").passwordParameter("password")//username, password la name trong form login
					.and()
					.logout().logoutUrl("/admin/logout")
					.logoutSuccessUrl("/admin/login?logout")
					.deleteCookies("JSESSIONID")
					.invalidateHttpSession(true)
					.and()
					.exceptionHandling().accessDeniedPage("/admin/login?accessdenied");

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
