-- Створення таблиці користувачів
CREATE TABLE Users (
    UserID INT PRIMARY KEY,                -- Первинний ключ
    UserName VARCHAR(50) NOT NULL,         -- Ім'я користувача (обов'язковий)
    Email VARCHAR(100) NOT NULL,           -- Email користувача
    RegistrationDate DATE DEFAULT CURRENT_DATE, -- Дата реєстрації

    -- Обмеження цілісності для атрибута UserName
    CONSTRAINT chk_UserName CHECK (UserName ~ '^[A-Za-z]{3,50}$'), 
    -- Обмеження цілісності для атрибута Email
    CONSTRAINT chk_Email CHECK (Email ~ '^[\\w.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$')
);

-- Створення таблиці замовлень
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,                  -- Первинний ключ
    UserID INT REFERENCES Users(UserID),      -- Зовнішній ключ
    OrderDate DATE DEFAULT CURRENT_DATE,      -- Дата замовлення
    OrderTotal DECIMAL(10, 2) NOT NULL        -- Загальна сума замовлення
);
