-- Створення таблиці для зберігання прецедентів
CREATE TABLE USE_CASES (
    USE_CASE_ID INT PRIMARY KEY,  -- Унікальний ідентифікатор прецедента
    NAME VARCHAR(255) NOT NULL,   -- Назва прецедента
    DESCRIPTION TEXT              -- Опис прецедента
);

-- Створення таблиці для зберігання функціональних вимог
CREATE TABLE FUNCTIONAL_REQUIREMENTS (
    REQUIREMENT_ID INT PRIMARY KEY,  -- Унікальний ідентифікатор функціональної вимоги
    NAME VARCHAR(255) NOT NULL,      -- Назва функціональної вимоги
    DESCRIPTION TEXT,                -- Опис функціональної вимоги
    USE_CASE_ID INT,                 -- Зовнішній ключ на таблицю USE_CASES
    FOREIGN KEY (USE_CASE_ID) REFERENCES USE_CASES(USE_CASE_ID)
);

-- Створення таблиці для зберігання інформації про користувачів
CREATE TABLE USERS (
    USER_ID INT PRIMARY KEY,        -- Унікальний ідентифікатор користувача
    USERNAME VARCHAR(50) NOT NULL,   -- Ім'я користувача
    PASSWORD_HASH VARCHAR(255) NOT NULL,  -- Хеш пароля
    EMAIL VARCHAR(255),             -- Адреса електронної пошти
    IS_ACTIVE BOOLEAN DEFAULT TRUE   -- Статус активності користувача
);

-- Створення таблиці для зберігання налаштувань інтерфейсу користувача
CREATE TABLE USER_SETTINGS (
    SETTING_ID INT PRIMARY KEY,         -- Унікальний ідентифікатор налаштування
    USER_ID INT,                        -- Зовнішній ключ на таблицю USERS
    THEME VARCHAR(50),                  -- Тема інтерфейсу
    LANGUAGE VARCHAR(50),               -- Мова інтерфейсу
    LAYOUT VARCHAR(255),                -- Налаштування макету
    FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID)
);

-- Створення таблиці для зберігання журналу аутентифікації користувачів
CREATE TABLE AUTHENTICATION_LOG (
    LOG_ID INT PRIMARY KEY,          -- Унікальний ідентифікатор запису журналу
    USER_ID INT,                     -- Зовнішній ключ на таблицю USERS
    LOGIN_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Час аутентифікації
    IP_ADDRESS VARCHAR(50),          -- IP-адреса користувача
    SUCCESS BOOLEAN,                 -- Статус аутентифікації (успішна/неуспішна)
    FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID)
);
