package com.sheetcode.problems;

import java.util.Optional;
import java.util.UUID;

import org.jdbi.v3.core.Jdbi;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;

@Service
public class ProblemsService {
    private ProblemsRepository problemsRepository;

    public ProblemsService(Jdbi jdbi) {
        problemsRepository = jdbi.onDemand(ProblemsRepository.class);
    }

    public Optional<Problem> getProblemById(@NonNull UUID id) {
        return problemsRepository.getProblemById(id);
    }
}
