-- =========================================
-- Library Management System SQL Script
-- =========================================

-- 1. Create the database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- =========================================
-- 2. Create Tables
-- =========================================

-- Table: Authors (Parent Table)
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique ID for each author
    name VARCHAR(100) NOT NULL,                -- Author's full name
    birth_year SMALLINT                         -- Year of birth, supports historical years
);

-- Table: Members (Parent Table)
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique ID for each member
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,        -- Email must be unique
    join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Automatically set join date/time
);

-- Table: Books (Child Table of Authors)
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,    -- Unique ID for each book
    title VARCHAR(200) NOT NULL,               -- Book title
    author_id INT NOT NULL,                    -- Reference to author
    published_year SMALLINT,                   -- Book published year
    genre VARCHAR(50),
    -- Foreign key linking to Authors table
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES Authors(author_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table: Loans (Child Table of Books and Members)
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,    -- Unique ID for each loan
    book_id INT NOT NULL,                      -- Which book is loaned
    member_id INT NOT NULL,                    -- Which member borrowed
    loan_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Automatically set loan date/time
    return_date DATE,
    -- Foreign keys
    CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES Books(book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_member FOREIGN KEY (member_id) REFERENCES Members(member_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================================
-- 3. Insert Sample Data
-- =========================================

-- Insert authors
INSERT INTO Authors (name, birth_year) VALUES
('J.K. Rowling', 1965),
('George Orwell', 1903),
('J.R.R. Tolkien', 1910);

-- Insert members
INSERT INTO Members (full_name, email) VALUES
('Alice Johnson', 'alice@example.com'),
('Bob Smith', 'bob@example.com');

-- Insert books (make sure author IDs match inserted authors)
INSERT INTO Books (title, author_id, published_year, genre) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 1997, 'Fantasy'),
('1984', 2, 1949, 'Dystopian'),
('The Hobbit', 3, 1937, 'Fantasy');

-- Insert loans
INSERT INTO Loans (book_id, member_id, loan_date, return_date) VALUES
(1, 1, CURRENT_TIMESTAMP, NULL),
(2, 2, CURRENT_TIMESTAMP, '2025-09-12');

-- =========================================
-- End of Library Management System
-- =========================================
