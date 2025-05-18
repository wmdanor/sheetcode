package com.sheetcode.health;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
@RequestMapping("health")
public class HealthController {
    @GetMapping("ping")
    public String ping() {
        return "pong";
    }
}
