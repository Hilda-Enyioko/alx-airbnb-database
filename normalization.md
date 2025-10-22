# Normalization of Airbnb Database Schema

## Objective
To ensure the Airbnb database design follows **Third Normal Form (3NF)**, reducing redundancy and improving data integrity.

---

## 1. First Normal Form (1NF)

**Rule:**  
Each table must have:
- A unique primary key.  
- Atomic (indivisible) attribute values.  
- No repeating groups or arrays.

**Application:**  
✅ All tables in the Airbnb schema already meet 1NF because:
- Every table has a primary key (`user_id`, `property_id`, `booking_id`, `payment_id`, `review_id`, `message_id`).
- All attributes hold atomic values (e.g., `first_name`, `last_name`, `email`, etc.).
- There are no repeating fields.

---

## 2. Second Normal Form (2NF)

**Rule:**  
A table is in 2NF if:
- It’s in 1NF.  
- All non-key attributes are **fully dependent** on the primary key (no partial dependency).

**Application:**  
✅ Each entity’s non-key attributes depend entirely on its primary key:
- **User:** All attributes depend on `user_id`.
- **Property:** All depend on `property_id`.
- **Booking:** All depend on `booking_id`.
- **Payment:** All depend on `payment_id`.
- **Review:** All depend on `review_id`.
- **Message:** All depend on `message_id`.

**Conclusion:**  
No table violates 2NF because there are no composite keys and no partial dependencies.

---

## 3. Third Normal Form (3NF)

**Rule:**  
A table is in 3NF if:
- It’s in 2NF.  
- There are no **transitive dependencies** (non-key attributes must not depend on other non-key attributes).

**Application:**  

✅ **User Table:**  
- All attributes (name, email, password, etc.) depend only on `user_id`.  
- No transitive dependencies.  

✅ **Property Table:**  
- `host_id` references `User(user_id)` but does not depend on other attributes.  
- No transitive dependencies.  

✅ **Booking Table:**  
- Depends on `booking_id` only.  
- `property_id` and `user_id` are foreign keys, not determinants of other attributes.  

✅ **Payment Table:**  
- `booking_id` is a foreign key linking payment to a booking.  
- `amount`, `payment_method`, and `payment_date` depend only on `payment_id`.  

✅ **Review Table:**  
- All attributes depend solely on `review_id`.  

✅ **Message Table:**  
- All attributes depend solely on `message_id`.  

---

## 4. Summary of Normalization Steps

| Normal Form | Validation | Action Taken |
|--------------|-------------|--------------|
| **1NF** | Ensured atomic attributes and primary keys. | No change needed. |
| **2NF** | Verified full dependency on primary keys. | No change needed. |
| **3NF** | Removed potential transitive dependencies. | Schema already satisfied 3NF. |

---

## ✅ Final Conclusion

The **Airbnb Database Schema** is already in **Third Normal Form (3NF)**.  
No further normalization is required since:
- Each entity has a single primary key.  
- All attributes are atomic and non-redundant.  
- Relationships are managed using foreign keys.
