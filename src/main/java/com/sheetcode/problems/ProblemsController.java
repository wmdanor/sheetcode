package com.sheetcode.problems;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.sheetcode.problems.dto.GetProblemResponse;

import java.util.Optional;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@RestController
@RequestMapping("v1/problems")
public class ProblemsController {
    private final Logger logger = LoggerFactory.getLogger(ProblemsController.class);

    @Autowired
    private ProblemsService problemsService;

    @GetMapping("{id}")
    public ResponseEntity<GetProblemResponse> getProblem(@PathVariable UUID id) {
        logger.atInfo()
                .setMessage("getProblem request")
                .addKeyValue("id", id)
                .addKeyValue("seq", 2)
                .log();

        Optional<Problem> problem = problemsService.getProblemById(id);
        if (problem.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "problem not found");
        }

        return ResponseEntity.ok(new GetProblemResponse(problem.get()));
    }

}
