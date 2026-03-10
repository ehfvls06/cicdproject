package com.example.demo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class HelloController {
    @GetMapping("/hello")
    public String hello() {
        return "AWS CI/CD Deploy Success! (t4g.small - Seoul Region)";
    }
}