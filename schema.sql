-- application config
create table config (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    key         VARCHAR(255) NOT NULL UNIQUE,
    value       TEXT NOT NULL
);

-- authentication
create table users (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    username    VARCHAR(100) NOT NULL UNIQUE,
    password    VARCHAR(255) NOT NULL,
    active      BOOLEAN DEFAULT TRUE
);

-- secret management
create table secret (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    key         VARCHAR(255) NOT NULL UNIQUE,
    value       TEXT NOT NULL,
    description TEXT,
    timestamp   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

create table secret_type (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    type        VARCHAR(255) NOT NULL
);

insert into secret_type (type)
values ('credential'), ('api_key');

create table secret_history (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    secret_id   INTEGER NOT NULL,
    key         VARCHAR(255) NOT NULL UNIQUE,
    value       TEXT NOT NULL,
    timestamp   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
