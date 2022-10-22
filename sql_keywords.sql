/*Adds a column in an existing table. (Pridá stĺpec do existujúcej tabuľky)*/
ADD 
ALTER TABLE my_data
ADD Email varchar(255);

/*Adds a constraint after a table is already created. (Pridá obmedzenie po vytvorení tabuľky)*/
ALTER TABLE my_data
ADD CONSTRAINT PK_Person PRIMARY KEY (Wc,Angle);

/*Returns true if all of the subquery values meet the condition. 
(Vráti hodnotu true, ak všetky hodnoty poddotazu spĺňajú podmienku)*/
SELECT ProductName
FROM Products
WHERE ProductID = ALL (SELECT ProductID FROM OrderDetails WHERE Quantity = 10);

/* Adds, deletes, or modifies columns in a table, or changes the data type of a column in a table
Pridáva, odstraňuje alebo upravuje stĺpce v tabuľke alebo mení typ údajov stĺpca v tabuľke */
ALTER TABLE my_data
ADD Email varchar(255);
/*The following SQL deletes the "Email" column from the "Customers" table:
(Nasledujúci SQL vymaže stĺpec "E-mail" z tabuľky "Zákazníci":)*/
ALTER TABLE Customers
DROP COLUMN Email;

/*ALTER COLUMN. The following SQL changes the data type of the column 
named "BirthDate" in the "Employees" table to type year:
(Nasledujúci SQL zmení typ údajov stĺpca
s názvom "Dátum narodenia" v tabuľke "Zamestnanci" a zadajte rok:)*/
ALTER TABLE my_data
ALTER COLUMN BirthDate year;

/*Adds, deletes, or modifies columns in a table. 
(Pridáva, odstraňuje alebo upravuje stĺpce v tabuľke) */
/*The following SQL adds an "Email" column to the "Customers" table:
(Nasledujúci SQL pridá stĺpec „E-mail“ do tabuľky „Zákazníci“:)*/
ALTER TABLE my_data
ADD Email varchar(255);
/*The following SQL deletes the "Email" column from the "Customers" table:
(Nasledujúci SQL vymaže stĺpec "E-mail" z tabuľky "Zákazníci":)*/
ALTER TABLE Customers
DROP COLUMN Email;.

/*Only includes rows where both conditions is true
(Zahŕňa iba riadky, v ktorých sú splnené obe podmienky)*/
SELECT * FROM Customers
WHERE Country='Germany' AND City='Berlin';

/*Returns true if any of the subquery values meet the condition
(Vráti hodnotu true, ak ktorákoľvek z hodnôt poddotazu spĺňa podmienku)*/
/*The following SQL statement returns TRUE and lists the productnames if it finds 
ANY records in the OrderDetails table where quantity = 10:
(Nasledujúci príkaz SQL vráti hodnotu TRUE a uvedie názvy produktov, 
ak nájde AKÉKOĽVEK záznamy v tabuľke OrderDetails, kde množstvo = 10:)*/
SELECT ProductName
FROM Products
WHERE ProductID = ANY (SELECT ProductID FROM OrderDetails WHERE Quantity = 10); 
/*The following SQL statement returns TRUE and lists the productnames if it finds 
ANY records in the OrderDetails table where quantity > 99:
(Nasledujúci príkaz SQL vráti hodnotu TRUE a uvedie názvy produktov, 
ak v tabuľke OrderDetails nájde AKÉKOĽVEK záznamy, kde množstvo > 99:)*/
SELECT ProductName
FROM Products
WHERE ProductID = ANY (SELECT ProductID FROM OrderDetails WHERE Quantity > 99); 

/*Renames a column or table with an alias
(Premenuje stĺpec alebo tabuľku pomocou aliasu)*/
/*The following SQL statement creates two aliases, 
one for the CustomerID column and one for the CustomerName column:
(Nasledujúci príkaz SQL vytvorí dva aliasy, 
jeden pre stĺpec CustomerID a jeden pre stĺpec CustomerName:)*/
SELECT CustomerID AS ID, CustomerName AS Customer
FROM Customers;
/*The following SQL statement creates two aliases. Notice that it requires double
quotation marks or square brackets if the alias name contains spaces:
(Nasledujúci príkaz SQL vytvorí dva aliasy. Všimnite si, že ak názov aliasu 
obsahuje medzery, vyžaduje sa dvojité úvodzovky alebo hranaté zátvorky:)*/
SELECT CustomerName AS Customer, ContactName AS [Contact Person]
FROM Customers; 
/*The following SQL statement creates an alias named "Address" 
that combine four columns (Address, PostalCode, City and Country):
(Nasledujúci príkaz SQL vytvorí alias s názvom „Adresa“, 
ktorý kombinuje štyri stĺpce (Adresa, PSČ, Mesto a Krajina):)*/
SELECT CustomerName, Address + ', ' + PostalCode + ' ' + City + ', ' + Country AS Address
FROM Customers; 
/*Note: To get the SQL statement above to work in MySQL use the following:
(Poznámka: Ak chcete, aby vyššie uvedený príkaz SQL fungoval v MySQL, použite nasledovné:)*/
SELECT CustomerName, CONCAT(Address,', ',PostalCode,', ',City,', ',Country) AS Address
FROM Customers; 
/*The following SQL statement selects all the orders from the customer with 
CustomerID=4 (Around the Horn). We use the "Customers" and "Orders" tables, 
and give them the table aliases of "c" and "o" respectively 
(Here we use aliases to make the SQL shorter):
(Nasledujúci príkaz SQL vyberie všetky objednávky od zákazníka s 
CustomerID=4 (Around the Horn). Používame tabuľky "Zákazníci" a "Objednávky" 
a dávame im aliasy tabuliek "c" a "o" (tu používame aliasy na skrátenie SQL):)*/
SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName="Around the Horn" AND c.CustomerID=o.CustomerID;

/*Sorts the result set in ascending order
(Zoradí sadu výsledkov vo vzostupnom poradí)*/
SELECT * FROM Customers
ORDER BY CustomerName ASC; 

/*Creates a back up of an existing database
(Vytvorí zálohu existujúcej databázy)*/
BACKUP DATABASE testDB
TO DISK = 'D:\backups\testDB.bak'; 
/*A differential back up only backs up the parts of the database 
that have changed since the last full database backup.
(Rozdielové zálohovanie zálohuje iba časti databázy, 
ktoré sa zmenili od poslednej úplnej zálohy databázy.)*/
BACKUP DATABASE testDB
TO DISK = 'D:\backups\testDB.bak'
WITH DIFFERENTIAL; 

/*Selects values within a given range
(Vyberie hodnoty v rámci daného rozsahu)*/
/*The following SQL statement selects all products with a price BETWEEN 10 and 20:
(Nasledujúci príkaz SQL vyberie všetky produkty s cenou 10 až 20:)*/
SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;
/*To display the products outside the range of the previous example, use NOT BETWEEN:
(Ak chcete zobraziť produkty mimo rozsahu predchádzajúceho príkladu, použite NOT BETWEEN:)*/
SELECT * FROM Products
WHERE Price NOT BETWEEN 10 AND 20;
/*The following SQL statement selects all products with a ProductName BETWEEN 
'Carnarvon Tigers' and 'Mozzarella di Giovanni':
(Nasledujúci príkaz SQL vyberie všetky produkty s názvom produktu MEDZI 
'Carnarvon Tigers' a 'Mozzarella di Giovanni':)*/
SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

/*Creates different outputs based on conditions
(Vytvára rôzne výstupy na základe podmienok)*/
/*The following SQL goes through several conditions and returns a value when the specified condition is met:
(Nasledujúci SQL prechádza niekoľkými podmienkami a vracia hodnotu, keď je zadaná podmienka splnená:)*/
SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END
FROM OrderDetails; 
/*The following SQL will order the customers by City. However, if City is NULL, then order by Country:
(Nasledujúce SQL zoradí zákazníkov podľa mesta. Ak je však Mesto NULL, zoraďte podľa krajiny:)*/
SELECT CustomerName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END); 

/*A constraint that limits the value that can be placed in a column
(Obmedzenie, ktoré obmedzuje hodnotu, ktorú možno umiestniť do stĺpca)*/
/*The following SQL creates a CHECK constraint on the "Age" column when the "Persons"
table is created. The CHECK constraint ensures that you can not have any person below 18 years:
(Nasledujúci SQL vytvára obmedzenie CHECK v stĺpci "Vek" pri vytváraní tabuľky "Osoby". 
Obmedzenie CHECK zaisťuje, že nemôžete mať žiadnu osobu mladšiu ako 18 rokov:)*/
CREATE TABLE Persons (
    Age int,
    CHECK (Age>=18)
); 
/*To create a CHECK constraint on the "Age" column when the table is already created, use the following SQL:
(Ak chcete vytvoriť obmedzenie CHECK v stĺpci "Vek", keď je tabuľka už vytvorená, použite nasledujúci SQL:)*/
ALTER TABLE Persons
ADD CHECK (Age>=18); 
/*To drop a CHECK constraint, use the following SQL:
(Ak chcete zrušiť obmedzenie CHECK, použite nasledujúci SQL:)*/
ALTER TABLE Persons
DROP CHECK CHK_PersonAge; 

/*Changes the data type of a column or deletes a column in a table
(Zmení typ údajov stĺpca alebo odstráni stĺpec v tabuľke)*/
/*ALTER COLUMN
(ZMENIŤ STĹPEC)*/
ALTER TABLE Employees
ALTER COLUMN BirthDate year;
/*DROP COLUMN
(ODSTRÁNI STĹPEC)*/
ALTER TABLE Customers
DROP COLUMN ContactName;

/*Adds or deletes a constraint / ADD CONSTRAINT
(Pridá alebo odstráni obmedzenie) / PRIDAŤ OBMEDZENIE*/
ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);
/*DROP CONSTRAINT
(ODSTRÁNI OBMEDZENIA)*/
ALTER TABLE Persons
DROP INDEX UC_Person; 
/*DROP a PRIMARY KEY Constraint
(ZRUŠÍ obmedzenie PRIMÁRNEHO KĽÚČA)*/
ALTER TABLE Persons
DROP PRIMARY KEY; 
/*DROP a FOREIGN KEY Constraint
(ZRUŠÍ INÉ KĽÚČOVÉ obmedzenie)*/
ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonOrder;
/*DROP a CHECK Constraint
(ZRUŠÍ OBMEDZENIE CHECK)*/
ALTER TABLE Persons
DROP CHECK CHK_PersonAge; 

/*Creates a database, index, view, table, or procedure
(Vytvorí databázu, index, zobrazenie, tabuľku alebo procedúru)*/
/*The following SQL creates a database called "testDB":
(Nasledujúci SQL vytvorí databázu s názvom "testDB":)*/
 CREATE DATABASE testDB; 
/*The CREATE TABLE command creates a new table in the database.
(Príkaz CREATE TABLE vytvorí novú tabuľku v databáze.)*/
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);
/*The following SQL creates a new table called "TestTables" 
(which is a copy of two columns of the "Customers" table): 
(Nasledujúci SQL vytvorí novú tabuľku s názvom "TestTables" 
(čo je kópia dvoch stĺpcov tabuľky "Customers"):)*/
CREATE TABLE TestTable AS
SELECT customername, contactname
FROM customers; 
/*The CREATE INDEX command is used to create indexes in tables (allows duplicate values).
(Príkaz CREATE INDEX sa používa na vytváranie indexov v tabuľkách (umožňuje duplicitné hodnoty).)*/
CREATE INDEX idx_lastname
ON Persons (LastName); 
/*adn*/
CREATE INDEX idx_pname
ON Persons (LastName, FirstName); 
/*The CREATE UNIQUE INDEX command creates a unique index on a table 
(no duplicate values allowed)
(Príkaz CREATE UNIQUE INDEX vytvorí jedinečný index v tabuľke 
(nie sú povolené žiadne duplicitné hodnoty))*/
CREATE UNIQUE INDEX uidx_pid
ON Persons (PersonID); 
/*The CREATE VIEW command creates a view.
(Príkaz CREATE VIEW vytvorí pohľad.)*/
CREATE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = "Brazil"; 
/*The CREATE OR REPLACE VIEW command updates a view.
(The CREATE OR REPLACE VIEW command updates a view.)*/
CREATE OR REPLACE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName, City
FROM Customers
WHERE Country = "Brazil";
/*We can query the view above as follows:
(Na zobrazenie vyššie môžeme dopytovať takto:)*/
 SELECT * FROM [Brazil Customers]; 
/*The CREATE PROCEDURE command is used to create a stored procedure.
(Príkaz CREATE PROCEDURE sa používa na vytvorenie uloženej procedúry.)*/
CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;

/*Creates a new SQL database
(Vytvorí novú SQL databázu)*/
 CREATE DATABASE testDB; 

/*Creates an index on a table (allows duplicate values)
(Vytvorí index v tabuľke (umožňuje duplicitné hodnoty))*/
/*The following SQL creates an index named "idx_lastname" on the "LastName" column in the "Persons" table:
(Nasledujúci SQL vytvorí index s názvom "idx_lastname" v stĺpci "LastName" v tabuľke "Persons":)*/
CREATE INDEX idx_lastname
ON Persons (LastName); 
/*If you want to create an index on a combination of columns, 
you can list the column names within the parentheses, separated by commas:
(Ak chcete vytvoriť index pre kombináciu stĺpcov, 
názvy stĺpcov môžete uviesť v zátvorkách oddelených čiarkami:)*/
CREATE INDEX idx_pname
ON Persons (LastName, FirstName);
