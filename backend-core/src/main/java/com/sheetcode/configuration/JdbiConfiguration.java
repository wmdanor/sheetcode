package com.sheetcode.configuration;

import java.util.List;

import javax.sql.DataSource;

import org.jdbi.v3.core.ConnectionFactory;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.spi.JdbiPlugin;
import org.jdbi.v3.spring.SpringConnectionFactory;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.TransactionAwareDataSourceProxy;

@Configuration
public class JdbiConfiguration {
    private final Logger logger = LoggerFactory.getLogger(JdbiConfiguration.class);

    @Bean
    public Jdbi jdbi(DataSource ds) {
        ConnectionFactory cf = new SpringConnectionFactory(ds);
        Jdbi jdbi = Jdbi.create(cf);

        logger.info("Installing SqlObject plugin");
        jdbi.installPlugin(new SqlObjectPlugin());

        return jdbi;
    }
}
