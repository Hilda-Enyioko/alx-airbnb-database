# 0. Define Entities and Relationships in ER Diagram  

## Objective  
Create an Entity-Relationship (ER) diagram based on the Airbnb database specification.  

---

## 🧱 Entities and Attributes  

### 1. **User**
| Attribute | Type | Description |
|------------|------|-------------|
| user_id | UUID (PK, Indexed) | Unique identifier for each user |
| first_name | VARCHAR, NOT NULL | User’s first name |
| last_name | VARCHAR, NOT NULL | User’s last name |
| email | VARCHAR, UNIQUE, NOT NULL | User’s email address |
| password_hash | VARCHAR, NOT NULL | Encrypted password |
| phone_number | VARCHAR, NULL | Optional contact number |
| role | ENUM(`guest`, `host`, `admin`), NOT NULL | Defines user type |
| created_at | TIMESTAMP, DEFAULT CURRENT_TIMESTAMP | When the user account was created |

**Notes:**  
- Each **User** can act as a **Host** or **Guest** depending on their role.  
- Email is **unique** for each user.  

---

### 2. **Property**
| Attribute | Type | Description |
|------------|------|-------------|
| property_id | UUID (PK, Indexed) | Unique property identifier |
| host_id | UUID (FK → User.user_id) | The user who owns the property |
| name | VARCHAR, NOT NULL | Property name |
| description | TEXT, NOT NULL | Details about the property |
| location | VARCHAR, NOT NULL | Address or area |
| price_per_night | DECIMAL, NOT NULL | Cost per night |
| created_at | TIMESTAMP, DEFAULT CURRENT_TIMESTAMP | Record creation time |
| updated_at | TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP | Last update time |

**Notes:**  
- A **Host (User)** can have **many Properties**.  
- Each **Property** belongs to **one Host**.  

---

### 3. **Booking**
| Attribute | Type | Description |
|------------|------|-------------|
| booking_id | UUID (PK, Indexed) | Unique booking ID |
| property_id | UUID (FK → Property.property_id) | Booked property |
| user_id | UUID (FK → User.user_id) | Guest who made the booking |
| start_date | DATE, NOT NULL | Check-in date |
| end_date | DATE, NOT NULL | Check-out date |
| total_price | DECIMAL, NOT NULL | Total cost of booking |
| status | ENUM(`pending`, `confirmed`, `canceled`), NOT NULL | Booking status |
| created_at | TIMESTAMP, DEFAULT CURRENT_TIMESTAMP | When the booking was made |

**Notes:**  
- A **User (Guest)** can have **many Bookings**.  
- A **Property** can have **many Bookings**.  
- Each **Booking** belongs to **one User** and **one Property**.  

---

### 4. **Payment**
| Attribute | Type | Description |
|------------|------|-------------|
| payment_id | UUID (PK, Indexed) | Unique payment ID |
| booking_id | UUID (FK → Booking.booking_id) | Related booking |
| amount | DECIMAL, NOT NULL | Amount paid |
| payment_date | TIMESTAMP, DEFAULT CURRENT_TIMESTAMP | Payment timestamp |
| payment_method | ENUM(`credit_card`, `paypal`, `stripe`), NOT NULL | Payment method used |

**Notes:**  
- Each **Booking** can have **one Payment**.  
- A **Payment** is linked to exactly **one Booking**.  

---

### 5. **Review**
| Attribute | Type | Description |
|------------|------|-------------|
| review_id | UUID (PK, Indexed) | Unique review ID |
| property_id | UUID (FK → Property.property_id) | Reviewed property |
| user_id | UUID (FK → User.user_id) | Reviewer (guest) |
| rating | INTEGER (1–5), NOT NULL | Rating score |
| comment | TEXT, NOT NULL | Review text |
| created_at | TIMESTAMP, DEFAULT CURRENT_TIMESTAMP | Review creation time |

**Notes:**  
- A **User** can write **many Reviews**.  
- A **Property** can receive **many Reviews**.  
- Each **Review** belongs to **one User** and **one Property**.  

---

### 6. **Message**
| Attribute | Type | Description |
|------------|------|-------------|
| message_id | UUID (PK, Indexed) | Unique message ID |
| sender_id | UUID (FK → User.user_id) | Message sender |
| recipient_id | UUID (FK → User.user_id) | Message recipient |
| message_body | TEXT, NOT NULL | Message content |
| sent_at | TIMESTAMP, DEFAULT CURRENT_TIMESTAMP | When message was sent |

**Notes:**  
- A **User** can send or receive **many Messages**.  
- Each **Message** connects a **Sender** and a **Recipient** (both Users).  

---

## 🔗 Relationships Overview

| Relationship | Type | Description |
|---------------|------|-------------|
| User → Property | 1 : M | A host can list many properties |
| User → Booking | 1 : M | A guest can make many bookings |
| Property → Booking | 1 : M | A property can have many bookings |
| Booking → Payment | 1 : 1 | Each booking has one payment |
| User → Review | 1 : M | A guest can write multiple reviews |
| Property → Review | 1 : M | A property can receive multiple reviews |
| User → Message | 1 : M (self-referencing) | Users can send/receive messages to/from other users |

---

## 🧩 ER Diagram Description  

Use **Draw.io** (or any ERD tool) to visualize:  

- **Entities:** User, Property, Booking, Payment, Review, Message  
- **Relationships:**
  - **User (Host)** —< **Property**  
  - **User (Guest)** —< **Booking** >— **Property**  
  - **Booking** —1→1— **Payment**  
  - **User** —< **Review** >— **Property**  
  - **User (Sender)** —< **Message** >— **User (Recipient)**  

**Primary keys** are underlined, and **foreign keys** connect related tables.  

---

## 🧠 Key Insights  
- The **User** entity is central — it connects to every other table.  
- **Bookings** serve as the link between **Users**, **Properties**, and **Payments**.  
- The **Message** table uses **self-referencing relationships** between users.  
- Proper indexing ensures efficiency, especially for frequent joins and lookups.

---

## ✅ Deliverables
- **ER Diagram File:** Created using Draw.io  
- **Saved Location:** `ERD/airbnb_erd.png`  
- **Documentation:** `ERD/requirements.md` (this file)  
- **Repository:** [alx-airbnb-database](https://github.com/<your-username>/alx-airbnb-database)

---

**Author:** *Hilda*  
**Project:** ALX Airbnb Database – ER Diagram
