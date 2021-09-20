package com.comac.usersupport_web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EntityScan("com.comac.usersupport_web.model")
public class UsersupportWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(UsersupportWebApplication.class, args);
    }

}
