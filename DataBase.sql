CREATE TABLE USE_CASES (
    USE_CASE_ID INT PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL CHECK (CHAR_LENGTH(NAME) BETWEEN 3 AND 255),
    DESCRIPTION TEXT
);

CREATE TABLE FUNCTIONAL_REQUIREMENTS (
    REQUIREMENT_ID INT PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL CHECK (CHAR_LENGTH(NAME) BETWEEN 3 AND 255),
    DESCRIPTION TEXT,
    USE_CASE_ID INT REFERENCES USE_CASES(USE_CASE_ID)
);

CREATE TABLE USERS (
    USER_ID INT PRIMARY KEY,
    USERNAME VARCHAR(50) NOT NULL CHECK (USERNAME ~ '^[A-Za-z]{3,50}$'),
    PASSWORD_HASH VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) NOT NULL UNIQUE CHECK (EMAIL ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
    IS_ACTIVE BOOLEAN DEFAULT TRUE
);

CREATE TABLE USER_SETTINGS (
    SETTING_ID INT PRIMARY KEY,
    USER_ID INT NOT NULL REFERENCES USERS(USER_ID),
    THEME VARCHAR(50) CHECK (THEME ~ '^[A-Za-z0-9_ -]{1,50}$'),
    LANGUAGE VARCHAR(50) CHECK (LANGUAGE ~ '^[A-Za-z]{2,50}$'),
    LAYOUT VARCHAR(255)
);

CREATE TABLE AUTHENTICATION_LOG (
    LOG_ID INT PRIMARY KEY,
    USER_ID INT NOT NULL REFERENCES USERS(USER_ID),
    LOGIN_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    IP_ADDRESS VARCHAR(50) CHECK (IP_ADDRESS ~ '^(\\d{1,3}\\.){3}\\d{1,3}$'),
    SUCCESS BOOLEAN
);
















