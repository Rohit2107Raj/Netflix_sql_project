CREATE TABLE netflix
(
	show_id	VARCHAR(5),
	type    VARCHAR(10),
	title	VARCHAR(250),
	director VARCHAR(550),
	casts	VARCHAR(1050),
	country	VARCHAR(550),
	date_added	VARCHAR(55),
	release_year	INT,
	rating	VARCHAR(15),
	duration	VARCHAR(15),
	listed_in	VARCHAR(250),
	description VARCHAR(550)
);

SELECT * FROM netflix;
select count(*) as total_count from netflix;

--1 select count of each type:
select type, count(show_id) as type_count from netflix
group by type;

--2 maximum rating for each type:
select type, rating as max_rating
from (
select type, rating, count(show_id) as cnt, rank() over(partition by type order by count(show_id) desc) as rn
from netflix
group by type,rating
)t
where rn = 1;
--3 select all the movies from 2020
select title from netflix
where type = 'Movie' and date_added like '%, 2020';

--4 select top5 countries with most content on netflix

select unnest(string_to_array(country,',')), count(show_id) as total_content from netflix
group by 1
order by total_content desc
limit 5;

select unnest(string_to_array(country,',')) from netflix;

--5 identify the longest movie:
select title, duration from netflix
where type = 'Movie' and duration = (select max(duration) from netflix);

--6 Find the content added in the last 5 years:
select * from netflix
where to_date(date_added,'month dd,yyyy') > current_date - interval '5 years';

--7 select all movie, tvshows directed by
select * from netflix
where director Ilike '%Rajiv Chilaka%'

--8 select all tvshows with more than 5 seasons:
select * from netflix
where type = 'TV Show' and duration ilike '%season%' and split_part(duration,' ',1)::numeric>5;
--9 number of content in genre:
select unnest(string_to_array(listed_in,',')) , count(show_id) from netflix
group by 1;

-- 10. Find each year and the average numbers of content release by India on netflix. 
-- return top 5 year with highest avg content release !


SELECT 
	country,
	release_year,
	COUNT(show_id) as total_release,
	ROUND(
		COUNT(show_id)::numeric/
								(SELECT COUNT(show_id) FROM netflix WHERE country = 'India')::numeric * 100 
		,2
		)
		as avg_release
FROM netflix
WHERE country = 'India' 
GROUP BY country, 2
ORDER BY avg_release DESC 
LIMIT 5


-- 11. List all movies that are documentaries
SELECT * FROM netflix
WHERE listed_in LIKE '%Documentaries'



-- 12. Find all content without a director
SELECT * FROM netflix
WHERE director IS NULL


-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years!

SELECT * FROM netflix
WHERE 
	casts LIKE '%Salman Khan%'
	AND 
	release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10


-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.



SELECT 
	UNNEST(STRING_TO_ARRAY(casts, ',')) as actor,
	COUNT(*)
FROM netflix
WHERE country = 'India'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10

/*
Question 15:
Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
the description field. Label content containing these keywords as 'Bad' and all other 
content as 'Good'. Count how many items fall into each category.
*/


SELECT 
    category,
	TYPE,
    COUNT(*) AS content_count
FROM (
    SELECT 
		*,
        CASE 
            WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad'
            ELSE 'Good'
        END AS category
    FROM netflix
) AS categorized_content
GROUP BY 1,2
ORDER BY 2