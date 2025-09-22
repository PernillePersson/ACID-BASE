CREATE OR REPLACE PROCEDURE transfer_funds(
    p_from_account_id INTEGER,
    p_to_account_id INTEGER,
    p_amount DECIMAL(18,2)
)
LANGUAGE plpgsql
AS $$
DECLARE
    from_balance DECIMAL(18,2);
BEGIN
    -- Hent saldo på afsenderkonto
    SELECT Balance INTO from_balance
    FROM Account
    WHERE id = p_from_account_id;

    -- Tjek for tilstrækkelige midler
    IF from_balance < p_amount THEN
        RAISE EXCEPTION 'INSUFFICIENT_FUNDS: Konto % har kun %', p_from_account_id, from_balance;
    END IF;

    -- Træk beløb fra afsenderkonto
    UPDATE Account
    SET Balance = Balance - p_amount
    WHERE id = p_from_account_id;

    -- Tilføj beløb til modtagerkonto
    UPDATE Account
    SET Balance = Balance + p_amount
    WHERE id = p_to_account_id;

    -- Indsæt transaktioner for begge konti
    INSERT INTO "Transaction"(Amount, Date, AccountId)
    VALUES (-p_amount, CURRENT_DATE, p_from_account_id);

    INSERT INTO "Transaction"(Amount, Date, AccountId)
    VALUES (p_amount, CURRENT_DATE, p_to_account_id);
END;
$$;
