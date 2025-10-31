# Query Optimization Report: `booking` Table

This report analyzes the performance difference between a generic, inefficient query (Ordinary) and a business-focused, index-optimized query (Refactored) on the airbnb database's booking table.

## Ordinary Query Analysis (Worst-Case Baseline)

**Query:** `EXPLAIN SELECT * FROM booking;`

This query is highly inefficient as it processes the entire table, regardless of size, resulting in a slow operation whose speed degrades linearly as the table grows.

| Metric             | Execution Plan | Performance Impact                                                                                      |
| ------------------ | -------------- | ------------------------------------------------------------------------------------------------------- |
| Access Type (type) | ALL            | This indicates a mandatory Full Table Scan. Every block of the booking table must be read from storage. |
| Key Used (key) | NULL | No index is utilized for this operation. |
| Rows | Examined (rows) 100% of the table | The database must examine every single row ([Total Booking Count]). |
| Inefficiency | SELECT \* | Retrieves all columns, wasting I/O and increasing network latency for data that is mostly unused. |

## Refactored Query Analysis (Optimized Dashboard View)

**Query:** Targeted selection of recent confirmed bookings with joins.

This query is highly optimized because it uses indexing to drastically reduce the size of the dataset before performing joins and sorting.

### Query Execution Strategy

| Optimization Technique       | Description of Performance Gain                                                                                                                                                                                                                                  |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Index-Based Filtering        | The WHERE clause converts a slow Full Table Scan (type: ALL) into a fast Index Scan (type: range/ref), reducing the rows examined from 100% to a minimal subset.                                                                                                 |
| Efficient Sorting & Limiting | ORDER BY b.start_date DESC combined with LIMIT 100 allows the database to traverse the idx_booking_startdate index backward. This avoids a resource-intensive disk sort (Using filesort) and stops processing immediately after the first 100 results are found. |
| Minimal I/O                  | Explicitly selecting necessary columns (b.booking_id, p.name, etc.) avoids the waste of SELECT \*, reducing disk I/O, CPU cycles, and network transfer volume.                                                                                                   |
