--View til at se brugernavn, id og balance
CREATE OR REPLACE VIEW CustomerAccounts AS
SELECT 
    c.Name AS CustomerName,
    a.id   AS AccountId,
    a.Balance
FROM Customer c
JOIN AccountCustomer ac ON c.id = ac.customerId
JOIN Account a ON ac.accountId = a.id;
