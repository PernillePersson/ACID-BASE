-- Table: Customer
CREATE TABLE Customer (
    id SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Phone INTEGER,
    UNIQUE (id)
);

-- Table: Account
CREATE TABLE Account (
    id SERIAL PRIMARY KEY,
    Balance DECIMAL(18,2),
    UNIQUE (id)
);

-- Table: Transaction
CREATE TABLE Transaction (
    id SERIAL PRIMARY KEY,
    Amount DECIMAL(18,2),
    Date DATE,
    AccountId INTEGER,
    UNIQUE (id),
    CONSTRAINT fk_Transaction_AccountId
        FOREIGN KEY (AccountId) REFERENCES Account(id)
        ON DELETE SET DEFAULT
        ON UPDATE SET DEFAULT
);

-- Table: AccountCustomer (many-to-many relation)
CREATE TABLE AccountCustomer (
    customerId INTEGER NOT NULL,
    accountId INTEGER NOT NULL,
    PRIMARY KEY (customerId, accountId),
    CONSTRAINT fk_AccountCustomer_customer
        FOREIGN KEY (customerId) REFERENCES Customer(id)
        ON DELETE SET DEFAULT
        ON UPDATE SET DEFAULT,
    CONSTRAINT fk_AccountCustomer_account
        FOREIGN KEY (accountId) REFERENCES Account(id)
        ON DELETE SET DEFAULT
        ON UPDATE SET DEFAULT
);
