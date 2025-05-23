package com.sheetcode;

import org.springframework.boot.SpringApplication;

public class TestSheetcodeApplication {

	public static void main(String[] args) {
		SpringApplication.from(SheetcodeApplication::main).with(TestcontainersConfiguration.class).run(args);
	}

}
