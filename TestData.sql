-- Insert Customers
INSERT INTO Customer (Name, Phone) VALUES 
('Victoria', 11111111),
('Esben',    22222222),
('Thomas',   33333333),
('Pernille', 44444444);

-- Insert Accounts
INSERT INTO Account (Balance) VALUES
(1000.00),
(2500.50),
(500.75),
(3200.00);

-- Link Customers to Accounts (many-to-many)
-- Victoria har konto 1 og 2
INSERT INTO AccountCustomer (customerId, accountId) VALUES (1, 1), (1, 2);

-- Esben har konto 2
INSERT INTO AccountCustomer (customerId, accountId) VALUES (2, 2);

-- Thomas har konto 3
INSERT INTO AccountCustomer (customerId, accountId) VALUES (3, 3);

-- Pernille har konto 4 og deler konto 1 med Victoria
INSERT INTO AccountCustomer (customerId, accountId) VALUES (4, 4), (4, 1);

-- Insert Transactions
INSERT INTO Transaction (Amount, Date, AccountId) VALUES
(200.00, '2025-01-01', 1),   -- Indbetaling på Victoria/Pernilles konto
(-50.00, '2025-01-03', 1),   -- Hævning
(500.00, '2025-01-05', 2),   -- Indbetaling på Victoria/Esbens konto
(-100.00, '2025-01-06', 2),  -- Hævning
(75.50, '2025-01-07', 3),    -- Indbetaling på Thomas’ konto
(-25.00, '2025-01-08', 3),   -- Hævning
(300.00, '2025-01-09', 4);   -- Indbetaling på Pernilles konto
