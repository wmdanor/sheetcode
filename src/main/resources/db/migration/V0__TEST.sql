CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS problems (
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,

    PRIMARY KEY (id)
);
