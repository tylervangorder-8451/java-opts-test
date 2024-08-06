package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DemoApplication {

	public static void main(String[] args) {
		Runtime.getRuntime().addShutdownHook(new Thread(() -> {
			//This logging line should show up when the docker container is stopped!
			System.out.println("Shutting down Gracefully, BYE!");
		}));
		SpringApplication.run(DemoApplication.class, args);
	}

}
