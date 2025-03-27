-- application config
CREATE TABLE config (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    key             VARCHAR(255) NOT NULL UNIQUE,
    value           TEXT NOT NULL
);

-- authentication
CREATE TABLE user (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    username        VARCHAR(100) NOT NULL UNIQUE,
    password        VARCHAR(255) NOT NULL,
    active          BOOLEAN DEFAULT TRUE,
    created         TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- secret management
CREATE TABLE secret_type (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    type            VARCHAR(255) NOT NULL
);

INSERT INTO secret_type (type)
VALUES
    ('credential'),
    ('api_key');

CREATE TABLE secret (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    key             VARCHAR(255) NOT NULL UNIQUE,
    value           TEXT NOT NULL,
    type_id         INTEGER NOT NULL,
    description     TEXT,
    active          BOOLEAN DEFAULT TRUE,
    user_id         INTEGER NOT NULL,
    created         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (type_id) REFERENCES type(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- tags
CREATE TABLE tag (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    tag             VARCHAR(100) NOT NULL UNIQUE,
    created         TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE secret_tag (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    secret_id       INTEGER NOT NULL,
    tag_id          INTEGER NOT NULL,
    created         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (secret_id) REFERENCES secret(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id)
);

-- secret history
CREATE TABLE secret_history (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    secret_id       INTEGER NOT NULL,
    key             VARCHAR(255) NOT NULL,
    value           TEXT NOT NULL,
    created         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (secret_id) REFERENCES secret(id)
);

-- env keys
CREATE TABLE env_key (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    secret_id       INTEGER NOT NULL,
    env_key         VARCHAR(255) NOT NULL,
    created         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (secret_id) REFERENCES secret(id)
)
