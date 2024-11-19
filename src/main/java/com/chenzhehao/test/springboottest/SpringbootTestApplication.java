package com.chenzhehao.test.springboottest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class SpringbootTestApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringbootTestApplication.class, args);
    }

    @RequestMapping("/")
    public Object jvmboot(){
        return "success jvm";
    }

    @RequestMapping("/v1")
    public Object jvmbootV1(){
        return "success jvm V1";
    }
}
