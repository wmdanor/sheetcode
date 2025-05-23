package com.sheetcode.problems.dto;

import com.sheetcode.problems.Problem;

public record GetProblemResponse(
                String id,
                String name,
                String description) {
        public GetProblemResponse(Problem problem) {
                this(problem.id(), problem.name(), problem.name());
        }
}
