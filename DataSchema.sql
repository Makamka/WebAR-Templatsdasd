-- Створення таблиці для зберігання прецедентів
CREATE TABLE UseCases (
    UseCaseID INT PRIMARY KEY,  -- Унікальний ідентифікатор прецедента
    Name VARCHAR(255) NOT NULL,  -- Назва прецедента
    Description TEXT            -- Опис прецедента
);

-- Створення таблиці для зберігання функціональних вимог
CREATE TABLE FunctionalRequirements (
    RequirementID INT PRIMARY KEY,  -- Унікальний ідентифікатор функціональної вимоги
    Name VARCHAR(255) NOT NULL,      -- Назва функціональної вимоги
    Description TEXT,                -- Опис функціональної вимоги
    UseCaseID INT,                   -- Зовнішній ключ на таблицю UseCases
    FOREIGN KEY (UseCaseID) REFERENCES UseCases(UseCaseID)
);

-- Створення таблиці для зберігання інформації про користувачів
CREATE TABLE Users (
    UserID INT PRIMARY KEY,        -- Унікальний ідентифікатор користувача
    Username VARCHAR(50) NOT NULL,  -- Ім'я користувача
    PasswordHash VARCHAR(255) NOT NULL,  -- Хеш пароля
    Email VARCHAR(255),             -- Адреса електронної пошти
    IsActive BOOLEAN DEFAULT TRUE   -- Статус активності користувача
);

-- Створення таблиці для зберігання налаштувань інтерфейсу користувача
CREATE TABLE UserSettings (
    SettingID INT PRIMARY KEY,         -- Унікальний ідентифікатор налаштування
    UserID INT,                        -- Зовнішній ключ на таблицю Users
    Theme VARCHAR(50),                 -- Тема інтерфейсу
    Language VARCHAR(50),              -- Мова інтерфейсу
    Layout VARCHAR(255),               -- Налаштування макету
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Створення таблиці для зберігання журналу аутентифікації користувачів
CREATE TABLE AuthenticationLog (
    LogID INT PRIMARY KEY,          -- Унікальний ідентифікатор запису журналу
    UserID INT,                      -- Зовнішній ключ на таблицю Users
    LoginTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Час аутентифікації
    IPAddress VARCHAR(50),           -- IP-адреса користувача
    Success BOOLEAN,                 -- Статус аутентифікації (успішна/неуспішна)
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
