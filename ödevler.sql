SELECT InvoiceId,CustomerId,Total FROM invoices ORDER BY CustomerId ASC,Total DESC;
SELECT InvoiceId,CustomerId,Total FROM invoices ORDER BY Total DESC, CustomerId ASC;

 /* In the first example, we first sorted by customerid, and those with the same customerid were sorted in descending order of total. 
 In the second example, we first sorted by total in descending order, and those with the same total were sorted by customerid. 
 The two lists are very different from each other. */
 
 
SELECT * FROM invoices WHERE Total >= "10" LIMIT 10 ;
SELECT * FROM invoices WHERE Total < "10" LIMIT 5 ;
SELECT name FROM tracks WHERE name like "B%s";
SELECT * 
FROM invoices 
WHERE BillingCountry in ("Usa","Germany","Norway","Canada") 
AND InvoiceDate BETWEEN "2010-01-01" AND "2011-01-01"
ORDER by InvoiceDate DESC;