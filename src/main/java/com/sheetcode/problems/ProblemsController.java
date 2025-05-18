package com.sheetcode.problems;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sheetcode.problems.dto.GetProblemResponse;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@RestController
@RequestMapping("v1/problems")
public class ProblemsController {
    @GetMapping("{id}")
    public GetProblemResponse getProblem(@PathVariable String id) {
        return new GetProblemResponse(id, "Problem name", "Problem description");
    }

}
