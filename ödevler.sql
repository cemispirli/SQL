	
	
	/*Questions:
	
		1. Write a query that displays InvoiceId, CustomerId and total dollar amount for each invoice, 
	sorted first by CustomerId (in ascending order), and then by total dollar amount  (in descending order).*/
	SELECT InvoiceId,CustomerId,Total FROM invoices ORDER BY CustomerId ASC,Total DESC;
	
	/*	2. Write a query that displays InvoiceId, CustomerId and total dollar amount for each invoice,
	but this time sorted first by total dollar amount (in descending order),
	and then by CustomerId (in ascending order).*/
	SELECT InvoiceId,CustomerId,Total FROM invoices ORDER BY Total DESC, CustomerId ASC;
-- 

	/*  3. Compare the results of these two queries above. How are the results different
	when you switch the column you sort on first? (Explain it in your own words.)*/
	
	/* In the first example, we first sorted by customerid, and those with the same customerid were sorted in descending order of total. 
	In the second example, we first sorted by total in descending order, and those with the same total were sorted by customerid. 
	The two lists are very different from each other. */
 
	/*  4. Write a query to pull the first 10 rows and all columns from the invoices table 
	that have a dollar amount of total greater than or equal to 10.*/
	SELECT * FROM invoices WHERE Total >= "10" LIMIT 10 ;
	
	/*  5. Write a query to pull the first 5 rows and all columns from the invoices table 
	that have a dollar amount of total less than 10.*/
	SELECT * FROM invoices WHERE Total < "10" LIMIT 5 ;
	
	/*	6. Find all track names that start with 'B' and end with 's'.*/
	SELECT name FROM tracks WHERE name like "B%s";
	
	/*	7. Use the invoices table to find all information regarding invoices
	whose billing address is USA or Germany or Norway or Canada and 
	invoice date is at any point in 2010, sorted from newest to oldest.*/
	SELECT * FROM invoices WHERE BillingCountry in ("Usa","Germany","Norway","Canada") 
	AND InvoiceDate BETWEEN "2010-01-01" AND "2011-01-01" ORDER by InvoiceDate DESC;
	
	
	
	
	/*Questions:*/ 
	
	/*How many tracks does each album have? 
	Your solution should include Album id and its number of tracks sorted from highest to lowest.*/
	SELECT AlbumId , count(AlbumId) as Number_of_tracks 
	FROM tracks 
	GROUP by AlbumId 
	ORDER by Number_of_tracks desc;
	 
	

	/*Find the album title of the tracks. Your solution should include track name and its album title.*/
	SELECT t.name as track_name, a.Title as album_title
	FROM tracks t
	INNER JOIN albums a
	on a.AlbumId = t.AlbumId ;
	
	/*Find the minimum duration of the track in each album. 
	Your solution should include album id, album title and duration of the track sorted from highest to lowest.*/
	SELECT t.AlbumId as album_id, a.Title as album_title, 
	min(t.Milliseconds) as duration_of_the_track
	FROM tracks t
	INNER JOIN albums a
	on a.AlbumId = t.AlbumId
	group by t.AlbumId 
	order by min(t.Milliseconds) DESC;
	

	/*Find the total duration of each album. 
	Your solution should include album id, album title and its total duration sorted from highest to lowest.*/
	SELECT t.AlbumId as album_id, a.Title as album_title, 
	sum(t.Milliseconds) as total_duration
	FROM tracks t
	INNER JOIN albums a
	on a.AlbumId = t.AlbumId
	group by t.AlbumId
	order by sum(t.Milliseconds) desc ;
	
	

	/*Based on the previous question, find the albums whose total duration is higher than 70 minutes. 
	Your solution should include album title and total duration.	*/
	
	SELECT  a.Title as album_title, 
	sum(t.Milliseconds) as total_duration
	FROM tracks t
	INNER JOIN albums a
	on a.AlbumId = t.AlbumId
	group by a.Title
	HAVING sum(t.Milliseconds) > 4200000
	order by sum(t.Milliseconds) desc ;


	
	

	