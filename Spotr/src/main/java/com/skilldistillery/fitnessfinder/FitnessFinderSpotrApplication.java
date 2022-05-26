package com.skilldistillery.fitnessfinder;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class FitnessFinderSpotrApplication extends SpringBootServletInitializer {
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(FitnessFinderSpotrApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(FitnessFinderSpotrApplication.class, args);
	}

}
