package com.broadcom.appone;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1")
public class ApponeController {

    @GetMapping("/foo")
    public String foo() {
        return "foo";
    }

}
