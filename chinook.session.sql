-- 1. non_usa_customers

SELECT
  c.CustomerId,
  c.FirstName,
  c.LastName,
  c.Country
FROM Customer c
Where c.Country != "USA";

-- 2. brazil_customers

SELECT
  c.CustomerId,
  c.FirstName,
  c.LastName,
  c.Country
FROM Customer c
WHERE c.Country = "Brazil";

-- 3. brazil_customers_invoices

SELECT
  c.FirstName,
  c.LastName,
  c.Country,
  i.InvoiceId,
  i.InvoiceDate,
  i.BillingCountry
FROM Customer c, Invoice i
WHERE c.Country = "Brazil";

-- 4. sales_agents

SELECT
  e.FirstName,
  e.LastName,
  e.title
FROM Employee e
WHERE e.title = "Sales Support Agent";

-- 5. unique_invoice_countries

SELECT
  i.BillingCountry
FROM Invoice i
GROUP BY BillingCountry;

-- 6. sales_agent_invoices

SELECT
  e.EmployeeId,
  e.FirstName as EmpFirst,
  e.LastName as EmpLast,
  e.title,
  c.SupportRepId,
  c.CustomerId,
  i.CustomerId,
  i.InvoiceId
FROM Employee e
JOIN Customer c
ON c.SupportRepId = e.EmployeeId
JOIN Invoice i
ON i.CustomerId = c.CustomerId
ORDER BY EmpFirst;

-- 7. invoice_totals: Provide a query that shows the Invoice Total, Customer name, 
-- Country and Sale Agent name for all invoices and customers.

SELECT
  e.EmployeeId,
  e.FirstName EmpFirst,
  e.LastName EmpLast,
  c.SupportRepId,
  c.FirstName CustFirst,
  c.LastName CustLast,
  c.CustomerId,
  c.Country,
  i.CustomerId InvoiceCustId,
  i.Total InvoiceTotal
FROM Employee e
JOIN Customer c   
ON c.SupportRepId = e.EmployeeId
JOIN Invoice i
ON c.CustomerId = InvoiceCustId
ORDER BY EmpFirst; 

-- 8. total_invoices_{year}: How many Invoices were there in 2009 and 2011?

SELECT
  i.InvoiceId,
  i.InvoiceDate
FROM Invoice i
WHERE i.InvoiceDate BETWEEN "2009-01-01 00:00:00" AND "2011-12-31 00:00:00";

-- 9. total_sales_{year}: What are the respective total sales for each of those years?

SELECT Total(Total),
  i.InvoiceDate
FROM Invoice i
WHERE i.InvoiceDate BETWEEN "2009-01-01 00:00:00" AND "2009-12-31 00:00:00";

SELECT Total(Total),
  i.InvoiceDate
FROM Invoice i
WHERE i.InvoiceDate BETWEEN "2010-01-01 00:00:00" AND "2010-12-31 00:00:00";

SELECT Total(Total),
  i.InvoiceDate
FROM Invoice i
WHERE i.InvoiceDate BETWEEN "2011-01-01 00:00:00" AND "2011-12-31 00:00:00";

-- 10. invoice_37_line_item_count: Looking at the InvoiceLine table,
--  provide a query that COUNTs the number of line items for Invoice ID 37.

SELECT Count(i.InvoiceId),
  i.InvoiceId,
  il.InvoiceId lineId
FROM Invoice i
Join InvoiceLine il 
ON i.InvoiceId = lineId
WHERE i.InvoiceId = 37;  

-- 11. line_items_per_invoice: Looking at the InvoiceLine table, 
-- provide a query that COUNTs the number of line items for each Invoice.


SELECT Count(lineId),
  i.InvoiceId,
  il.InvoiceId lineId
FROM Invoice i
Join InvoiceLine il
ON i.InvoiceId = lineId;


