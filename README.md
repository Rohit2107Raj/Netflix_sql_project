Netflix Data Analysis using SQL

## 📌 Project Overview
This project focuses on analyzing the **Netflix Movies and TV Shows dataset** using SQL.  
The dataset contains metadata such as show type, title, director, cast, country, release year, rating, duration, genres, and description.  

The aim is to extract insights and answer analytical questions such as:
- How many movies vs. TV shows are available?
- Which country has the most Netflix content?
- Who are the most featured actors?
- What’s the trend of releases in India over the years?
- Which TV shows have the most seasons?
- Categorizing content based on keywords like *kill* or *violence*.

---

## 📂 Dataset Schema
The Netflix table contains the following columns:
- `show_id`  
- `type` (Movie/TV Show)  
- `title`  
- `director`  
- `casts`  
- `country`  
- `date_added`  
- `release_year`  
- `rating`  
- `duration`  
- `listed_in` (Genre)  
- `description`  

---

## 📊 Key SQL Queries Implemented
1. Count of Movies vs TV Shows  
2. Most frequent rating for each type  
3. Movies released in 2020  
4. Top 5 countries with most content  
5. Longest movie on Netflix  
6. Content added in the last 5 years  
7. Movies/TV shows by a specific director  
8. TV shows with more than 5 seasons  
9. Number of contents by genre  
10. Average yearly releases from India  
11. Documentaries on Netflix  
12. Content without a director  
13. Movies featuring Salman Khan in last 10 years  
14. Top 10 actors in Indian movies on Netflix  
15. Categorizing content as *Good* or *Bad* based on keywords in description  

---

## ⚙️ Tech Stack
- **SQL (PostgreSQL syntax)**  
- Dataset: Netflix Movies & TV Shows  

---

## 📈 Insights
- Netflix has more movies than TV shows in the dataset.  
- The U.S. and India are the top contributors of Netflix content.  
- Certain directors and actors dominate Netflix listings.  
- Thematic analysis reveals categories based on keywords like "kill" and "violence".  

---

## 🚀 How to Run
1. Create the `netflix` table using the provided schema.  
2. Import dataset into the table.  
3. Run the queries from the SQL script file.  

---

## 📌 Author
**Rohit Raj**  
