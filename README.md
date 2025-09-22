## ACID opgaver:
(Udgangspunkt i postgres)
- **Design et diagram for en bankapplikation med konti og transaktioner**
<img width="1050" height="584" alt="image" src="https://github.com/user-attachments/assets/012b5d5c-f11c-4aa5-a9be-fd87cdb84aa1" />

- **Generer den nødvendige SQL kode til at oprette tabellerne**
  - [Create Tables SQL](./createTables.sql)
  
- **Indsæt data og vis eksempler på transaktioner**
  - [Indsæt testdata SQL](./TestData.sql)
  - [Transfer procedure SQL](./TransferFunds.sql)
  
- **Vis hvordan ACID egenskaberne sikrer dataintegritet ved overførsler mellem konti**
  - Atomicity
      - BEGIN TRANSACTION ... COMMIT sikrer at hele transaktionen sker, eller ingen af dem - Så vi ikke trækker penge ud af én konto, uden at sætte dem ind på en anden konto
  - Consistency
      - CHECK (Balance >= 0) sikrer at en saldo ikke går i minus
  - Isolation
      - Flere overførsler, der sker samtidig, må ikke påvirke hinanden på en måde, der giver inkonsistente data. Kan sikres med isolation levels som SERIALIZABLE eller REPEATABLE READ
  - Durability
      - Når en overførsel er fuldført og committed, er ændringerne permanente, selv hvis systemet crasher bagefter.

- **Opret eksempler med SQL kode for transaktioner**
  - [Trasfer funds](./TransferFunds.sql)
  - Eks: CALL transfer_funds(1, 2, 50.00);
- **Undersøg om der findes andre database systemer der understøtter ACID**
   - Generelt SQL-databaser, som fks oracle, MySql, Microsoft SQL Server


## BASE opgaver:
(Udganspunkt i MongoDB)
- **Design et diagram for et socialt medie feed system samt brugere, opslag, kommentarer og reactions (e.g. likes og dislikes)**
- **Generer den nødvendige NoSQL kode til at oprette collections og indsætte dokumenter**
- **Indsæt data og vis eksempler på opslag, kommentarer og reactions**
- **Vis hvordan BASE egenskaberne sikrer høj tilgængelighed og skalerbarhed ved opslag og kommentarer**
- **Opret eksempler med NoSQL kode for opslag, kommentarer og reactions**
- **Undersøg om der findes andre database systemer der understøtter BASE**
