# Partitioning Performance Report: Booking Table

## Objective

To implement table partitioning on the large `booking` table using the `start_date` column and measure the resulting performance improvements for time-based queries.

## Methodology

### 1. Partitioning Scheme

The `booking` table was partitioned using `PARTITION BY RANGE (YEAR(start_date))` to segment data into yearly chunks (e.g., p0 < 2023, p1 < 2024, etc.).

### 2. Test Queries

The following query was used to test performance both **Before Partitioning** (on the unpartitioned table) and **After Partitioning**:

```sql
SELECT
    booking_id, start_date, total_price
FROM
    booking
WHERE
    start_date BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY
    start_date;
```
