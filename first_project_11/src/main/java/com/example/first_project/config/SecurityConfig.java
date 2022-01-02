package com.example.first_project.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
 
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Bean
	public BCryptPasswordEncoder encodePwd() {
		return new BCryptPasswordEncoder();
	}

@Override
protected void configure(HttpSecurity http) throws Exception {
	http.csrf().disable();
	http.authorizeRequests()
	.antMatchers("/user/*")
	.authenticated()
	.anyRequest()
	.permitAll()
		.and()
	.formLogin()
	.loginPage("/login")
	.loginProcessingUrl("/loginProc")
	.defaultSuccessUrl("/")
		.and()
	.logout()
	.logoutUrl("/logout")
	.logoutSuccessUrl("/")
	.invalidateHttpSession(true);

	}
}
