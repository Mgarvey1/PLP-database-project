# Library Management System Database

## Overview
This project implements a simple **Library Management System** using MySQL. The database tracks authors, books, library members, and book loans. It demonstrates proper relational database design with **primary keys**, **foreign keys**, **data integrity**, and **One-to-Many relationships**.  

The system is designed for educational purposes and can be extended for more complex scenarios (e.g., multiple genres, Many-to-Many relationships, additional constraints).

---

## Database: `LibraryDB`

### Tables and Structure

1. **Authors**
   - `author_id` (PRIMARY KEY)
   - `name` (Author's full name, NOT NULL)
   - `birth_year` (SMALLINT to support historical years)
   - **Relationship:** One author can write many books (One-to-Many with Books)

2. **Members**
   - `member_id` (PRIMARY KEY)
   - `full_name` (NOT NULL)
   - `email` (UNIQUE, NOT NULL)
   - `join_date` (TIMESTAMP, defaults to current date/time)
   - **Relationship:** A member can have multiple loans (One-to-Many with Loans)

3. **Books**
   - `book_id` (PRIMARY KEY)
   - `title` (NOT NULL)
   - `author_id` (FOREIGN KEY referencing Authors)
   - `published_year` (SMALLINT)
   - `genre` (VARCHAR)
   - **Relationship:** Each book belongs to one author (Many-to-One with Authors)  
   - **Relationship:** A book can be loaned multiple times (One-to-Many with Loans)

4. **Loans**
   - `loan_id` (PRIMARY KEY)
   - `book_id` (FOREIGN KEY referencing Books)
   - `member_id` (FOREIGN KEY referencing Members)
   - `loan_date` (TIMESTAMP, defaults to current date/time)
   - `return_date` (DATE)
   - **Relationship:** Links books and members

---

## Features
- Well-structured relational database with **primary keys** and **foreign keys**
- Enforces **data integrity** with `ON DELETE CASCADE` and `ON UPDATE CASCADE`
- **Sample data** included for authors, books, members, and loans
- Ready-to-run MySQL script with **no errors**
- Demonstrates **One-to-Many relationships** and proper referential integrity
- Extensible for future enhancements
