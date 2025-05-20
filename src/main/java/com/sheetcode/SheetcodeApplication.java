package com.sheetcode;

import org.jdbi.v3.spring.EnableJdbiRepositories;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableJdbiRepositories
public class SheetcodeApplication {
	public static void main(String[] args) {
		SpringApplication.run(SheetcodeApplication.class, args);
	}
}
