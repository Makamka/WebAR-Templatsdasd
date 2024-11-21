CREATE TABLE USE_CASES (
    USE_CASE_ID INT PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,
    DESCRIPTION TEXT
);

CREATE TABLE FUNCTIONAL_REQUIREMENTS (
    REQUIREMENT_ID INT PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,
    DESCRIPTION TEXT,
    USE_CASE_ID INT,
    FOREIGN KEY (USE_CASE_ID)
        REFERENCES USE_CASES(USE_CASE_ID)
);

CREATE TABLE USERS (
    USER_ID INT PRIMARY KEY,
    USERNAME VARCHAR(50) NOT NULL,
    PASSWORD_HASH VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255),
    IS_ACTIVE BOOLEAN DEFAULT TRUE
);

CREATE TABLE USER_SETTINGS (
    SETTING_ID INT PRIMARY KEY,
    USER_ID INT,
    THEME VARCHAR(50),
    LANGUAGE VARCHAR(50),
    LAYOUT VARCHAR(255),
    FOREIGN KEY (USER_ID)
        REFERENCES USERS(USER_ID)
);

CREATE TABLE AUTHENTICATION_LOG (
    LOG_ID INT PRIMARY KEY,
    USER_ID INT,
    LOGIN_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    IP_ADDRESS VARCHAR(50),
    SUCCESS BOOLEAN,
    FOREIGN KEY (USER_ID)
        REFERENCES USERS(USER_ID)
);



