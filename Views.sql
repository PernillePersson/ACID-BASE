--View til at se brugernavn, id og balance
CREATE OR REPLACE VIEW CustomerAccounts AS
SELECT 
    c.Name AS CustomerName,
    a.id   AS AccountId,
    a.Balance
FROM Customer c
JOIN AccountCustomer ac ON c.id = ac.customerId
JOIN Account a ON ac.accountId = a.id;

--View til konti kun tilknyttet én bruger
CREATE OR REPLACE VIEW SingleUserAccounts AS
SELECT 
    a.id   AS AccountId,
    a.Balance,
    c.id   AS CustomerId,
    c.Name AS CustomerName
FROM Account a
JOIN AccountCustomer ac ON a.id = ac.accountId
JOIN Customer c ON ac.customerId = c.id
GROUP BY a.id, a.Balance, c.id, c.Name
HAVING COUNT(ac.customerId) = 1;
