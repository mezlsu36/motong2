package com.hk.motong;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableFeignClients
@SpringBootApplication
public class Motong2Application {

	public static void main(String[] args) {
		SpringApplication.run(Motong2Application.class, args);
	} 

}
