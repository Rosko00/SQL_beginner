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
ALTER TABLE Customers
ADD Email varchar(255);
/*The following SQL deletes the "Email" column from the "Customers" table:
(Nasledujúci SQL vymaže stĺpec "E-mail" z tabuľky "Zákazníci":)*/
ALTER TABLE Customers
DROP COLUMN Email;

/*ALTER COLUMN. The following SQL changes the data type of the column 
named "BirthDate" in the "Employees" table to type year:
(Nasledujúci SQL zmení typ údajov stĺpca
s názvom "Dátum narodenia" v tabuľke "Zamestnanci" a zadajte rok:)*/
ALTER TABLE Employees
ALTER COLUMN BirthDate year;

/*Adds, deletes, or modifies columns in a table. 
(Pridáva, odstraňuje alebo upravuje stĺpce v tabuľke) */
/*The following SQL adds an "Email" column to the "Customers" table:
(Nasledujúci SQL pridá stĺpec „E-mail“ do tabuľky „Zákazníci“:)*/
ALTER TABLE Customers
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

