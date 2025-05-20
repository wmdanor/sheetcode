package com.sheetcode.problems;

import java.util.Optional;
import java.util.UUID;

import org.jdbi.v3.spring.JdbiRepository;
import org.jdbi.v3.sqlobject.config.RegisterConstructorMapper;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.springframework.lang.NonNull;

@JdbiRepository
public interface ProblemsRepository {
    @SqlQuery("SELECT id, name FROM problems p WHERE p.id = ?")
    @RegisterConstructorMapper(Problem.class)
    public abstract Optional<Problem> getProblemById(@NonNull UUID id);
}
