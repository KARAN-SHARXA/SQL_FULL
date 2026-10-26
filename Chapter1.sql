-- =========================================
-- SQL NOTES: DATABASE, TABLES AND CONSTRAINTS
-- Database: PostgreSQL (pgAdmin)
-- =========================================

-- 1. DATABASE COMMANDS

-- CREATE DATABASE:
-- Creates a new database.
CREATE DATABASE users;

-- DROP DATABASE:
-- Deletes the database permanently.
-- Run this separately while connected to another database.
DROP DATABASE users;


-- 2. TABLE COMMANDS

-- CREATE TABLE:
-- Creates a new table in the database.
CREATE TABLE users (
    user_id INTEGER,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);

-- TRUNCATE TABLE:
-- Deletes all rows but keeps the table structure.
TRUNCATE TABLE users;

-- DROP TABLE:
-- Deletes the table and its structure permanently.
DROP TABLE IF EXISTS users;


-- 3. CONSTRAINTS
-- Constraints are rules applied to columns to maintain
-- data accuracy, validity and integrity.


-- A. NOT NULL
-- Prevents a column from storing NULL values.

CREATE TABLE users (
    user_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL
);


-- B. UNIQUE
-- Prevents duplicate values in a column.

CREATE TABLE users (
    email VARCHAR(255) UNIQUE
);


-- C. PRIMARY KEY
-- Uniquely identifies each record.
-- Does not allow duplicate or NULL values.

CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    name VARCHAR(255)
);


-- D. AUTO INCREMENT
-- Automatically generates a numeric value for each new row.
-- PostgreSQL uses IDENTITY instead of AUTO_INCREMENT.

CREATE TABLE users (
    user_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255)
);


-- E. CHECK
-- Ensures that values satisfy a specified condition.

CREATE TABLE Student (
    age INTEGER CHECK (age >= 18)
);


-- F. DEFAULT
-- Assigns a predefined value when no value is supplied.

CREATE TABLE Student (
    city VARCHAR(50) DEFAULT 'Ludhiana'
);


-- G. FOREIGN KEY
-- Establishes a relationship between two tables.
-- Referenced values must exist in the parent table.

CREATE TABLE Department (
    dept_id INTEGER PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Student (
    student_id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    dept_id INTEGER REFERENCES Department(dept_id)
);


-- 4. COMPLETE EXAMPLE: ALL CONSTRAINTS

CREATE TABLE Department (
    dept_id INTEGER PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE
);

CREATE TABLE Student (
    student_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    age INTEGER CHECK (age >= 18),
    city VARCHAR(50) DEFAULT 'Ludhiana',
    dept_id INTEGER REFERENCES Department(dept_id)
);

-- Insert departments
INSERT INTO Department (dept_id, dept_name)
VALUES (1, 'CSE'), (2, 'IT');

-- Insert a student
INSERT INTO Student (name, email, password, age, dept_id)
VALUES ('Karan', 'karan@example.com', 'demo_password', 21, 1);

-- Display student records
SELECT * FROM Student;


-- 5. QUICK REVISION
-- NOT NULL    : Prevents NULL values.
-- UNIQUE      : Prevents duplicate values.
-- PRIMARY KEY : Unique identity; no NULL or duplicates.
-- IDENTITY    : Automatically generates numeric values.
-- CHECK       : Enforces a condition.
-- DEFAULT     : Provides a default value.
-- FOREIGN KEY : Connects related tables.
-- TRUNCATE    : Removes all rows, keeps the table.
-- DROP        : Deletes the table or database.
-- CREATE      : Creates a database or table.