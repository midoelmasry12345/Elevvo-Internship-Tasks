-- Top Selling Products 
Select 
t.Name as "Track_Name",
sum(il.UnitPrice * il.Quantity) as "Total_Revenue" ,
sum(il.quantity) as "Units_Sold "
from 
track t join invoiceline il 
on t.trackid = il.trackid 
group by t.Name
order by Total_Revenue desc
limit 10 ;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  Revenue per Region 
Select 
BillingCountry as "Region",
sum(Total) as "Revenue"
from 
invoice
group by BillingCountry 
order by Revenue desc
limit 10 ;

-------------------------------------------------------------
-- Monthly Performance
SELECT 
    DATE_FORMAT(i.InvoiceDate, '%Y-%m') AS Sale_Month, 
    SUM(i.Total) AS Monthly_Revenue
FROM Invoice i
GROUP BY Sale_Month
ORDER BY Sale_Month ASC;
----------------------------------------------------------------
----------------------------------------------------------------
-- Revenue Rank Using window function (Rank)
SELECT 
    BillingCountry AS Region,
    SUM(Total) AS Total_Revenue,
    RANK() OVER (ORDER BY SUM(Total) DESC) AS Revenue_Rank
FROM invoice
GROUP BY BillingCountry
LIMIT 10;
