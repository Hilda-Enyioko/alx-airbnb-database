# Database Advanced Scripts: JOINS, SUBQUERIES, AGGREGATIONS

This project is a part of the ALX Airbnb Database Module, where you will implement advanced SQL querying and optimization techniques to work with a simulated Airbnb database. By diving into real-world challenges like optimizing query performance, writing complex SQL scripts, and applying indexing and partitioning, participants will gain hands-on experience with database management and performance tuning. This ensures you are equipped to handle large-scale applications where efficiency and scalability are critical.

### Learning Objectives

- **Master Advanced SQL:** Write complex queries involving joins, subqueries, and aggregations for data retrieval and analysis.
- **Optimize Query Performance:** Analyze and refactor SQL scripts using performance tools like EXPLAIN and ANALYZE.
- **Implement Indexing and Partitioning:** Understand and apply indexing and table partitioning to improve database performance for large datasets.
- **Monitor and Refine Performance:** Continuously monitor database health and refine schemas and queries for optimal performance.
- **Think Like a DBA:** Learn to make data-driven decisions about schema design and optimization strategies for high-volume applications.

---

## Task 0: Write Complex Queries with Joins

**Objective:** Master SQL joins by writing complex queries using different types of joins.

### Instructions:

- Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
- Write a query using a LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
- Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

---

## Task 1: Practice Subqueries

**Objective:** Write both correlated and non-correlated subqueries.

**Instructions:**

- Write a query to find all properties where the average rating is greater than 4.0 using a subquery.
- Write a correlated subquery to find users who have made more than 3 bookings.

---

## Task 2: Apply Aggregations and Window Functions

**Objective:** Use SQL aggregation and window functions to analyze data.

**Instructions:**

- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
