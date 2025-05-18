package com.sheetcode.submissions;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sheetcode.submissions.dto.GetSubmissionResponse;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@RestController
@RequestMapping("v1/submissions")
public class SubmissionsController {
    @GetMapping("{id}")
    public GetSubmissionResponse getSubmission(@PathVariable String id) {
        return new GetSubmissionResponse(id);
    }

}
