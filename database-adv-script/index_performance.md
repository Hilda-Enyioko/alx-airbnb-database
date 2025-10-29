# Index Performance

---

## High-Usage Columns for Indexing

| Table        | Column Name(s)  | Usage Type          | Rationale for Indexing                                                                            |
| ------------ | --------------- | ------------------- | ------------------------------------------------------------------------------------------------- |
| **user**     | `email`         | Filtering (Login)   | Critical for authenticating users quickly (used in `WHERE` clauses).                              |
| **user**     | `role`          | Filtering           | Used to quickly segregate user types (e.g., finding all 'hosts').                                 |
| **property** | `host_id`       | Joining, Filtering  | Essential for finding all properties owned by a specific host (used in JOIN and WHERE).           |
| **property** | `location`      | Filtering           | Ordering Key column for user search functionality (WHERE location = '...' or ORDER BY location).  |
| **property** | `pricepernight` | Filtering, Ordering | Used for price range searches and sorting search results.                                         |
| **booking**  | `property_id`   | Joining             | Critical for retrieving the booking history for a specific property (used in JOIN with property). |
| **booking**  | `user_id`       | Joining             | Critical for retrieving the booking history for a specific guest (used in JOIN with user).        |
| **booking**  | `start_date`    | Filtering, Ordering | Used for availability checks and sorting bookings chronologically.                                |
| **booking**  | `status`        | Filtering           | Used to filter bookings by state (e.g., getting all 'confirmed' bookings).                        |

---

## Impact of Index Implementation on Query Performance

Creating these indexes is a crucial step for maintaining performance on a normal day. They primarily work by converting slow, full table scans into extremely fast index lookups for common tasks like user logins, product searches by location, and fetching order history. This vastly improves the speed of your SELECT queries and complex joins.

However, remember the trade-off: data modification operations (INSERT, UPDATE, DELETE) will be slightly slower because every time data is changed in the main table, the database must also update and rebalance the B-Tree structure of each associated index to keep the pointers correct. For a high-read, moderate-write application like Airbnb, this read-speed benefit far outweighs the write-speed cost.
