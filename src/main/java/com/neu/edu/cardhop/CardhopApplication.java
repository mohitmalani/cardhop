package com.neu.edu.cardhop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@SpringBootApplication
@ComponentScan({"com.neu.edu.cardhop.action","com.neu.edu.cardhop.config", "com.neu.edu.cardhop.controller", "com.neu.edu.cardhop.dao", "com.neu.edu.cardhop.exception", "com.neu.edu.cardhop.mapper", "com.neu.edu.cardhop.pojo", "com.neu.edu.cardhop.service" })
public class CardhopApplication {

	public static void main(String[] args) {
		SpringApplication.run(CardhopApplication.class, args);
	}
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver multipartResolver()
	{
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(10000000);
		return multipartResolver;
	}

}
