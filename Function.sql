--Få konti for customerID
CREATE OR REPLACE FUNCTION get_accounts_for_customer(p_customer_id INTEGER)
RETURNS TABLE (
    AccountId INTEGER,
    Balance DECIMAL(18,2)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT a.id, a.Balance
    FROM Account a
    JOIN AccountCustomer ac ON a.id = ac.accountId
    WHERE ac.customerId = p_customer_id;
END;
$$;
