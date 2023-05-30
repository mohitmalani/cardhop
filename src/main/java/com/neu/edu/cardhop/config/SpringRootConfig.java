/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.neu.edu.cardhop.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 *
 * @author MohitMalani
 */

@Configuration
@ComponentScan(basePackages = {"com.neu.edu.cardhop.dao","com.neu.edu.cardhop.service"})
public class SpringRootConfig {
    @Bean
    public BasicDataSource getDataSource(){
       BasicDataSource bds=new BasicDataSource();
       bds.setDriverClassName("com.mysql.jdbc.Driver");
       bds.setUrl("jdbc:mysql://localhost:3306/capp_db?serverTimezone=UTC");
       bds.setUsername("root");
       bds.setPassword("rootuser");
       bds.setMaxTotal(2);
       bds.setInitialSize(1);
       bds.setValidationQuery("SELECT 1");
       bds.setDefaultAutoCommit(Boolean.TRUE);
       return bds;
    }
}
