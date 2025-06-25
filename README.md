#  Student Database Project (MySQL - DB Fiddle)

This mini project demonstrates how to work with a `students` table in MySQL using **DB Fiddle**. The project covers:

- Table creation
- Data insertion (including NULL values)
- Identification of missing values
- Handling of missing data using `UPDATE`
- Deleting specific records using `DELETE`
- Viewing cleaned data using `SELECT`

---

##  Table Schema

The `students` table includes the following fields:

| Column Name      | Data Type       | Description                                 |
|------------------|------------------|---------------------------------------------|
| `stu_id`         | `INT` (PK)       | Auto-incremented unique student ID          |
| `name`           | `VARCHAR(50)`    | Student's full name                         |
| `gender`         | `ENUM('M','F','O')` | Gender                                      |
| `dob`            | `DATE`           | Date of birth                               |
| `class`          | `CHAR(1)`        | Class section (A, B, C, etc.)               |
| `marks`          | `INT`            | Marks scored (0–100)                        |
| `email`          | `VARCHAR(100)`   | Email ID (unique)                           |
| `phone`          | `VARCHAR(15)`    | Phone number                                |
| `address`        | `TEXT`           | Home address                                |
| `admission_date` | `DATE`           | Date of admission                           |

---

##  Sample Data Inserted

7 student records were inserted, some of them with `NULL` values in columns like `dob`, `email`, `phone`, `marks`, and `address`.

---

##  Identifying Missing (NULL) Values

Missing values were identified using:

- Individual `SELECT` statements for each nullable column
- A summary query to count NULLs column-wise

---

##  Handling Missing Values

NULL values were handled using `UPDATE` statements. Examples:

```sql
UPDATE students
SET marks = 65
WHERE marks IS NULL;

UPDATE students
SET email = CONCAT(LOWER(REPLACE(name, ' ', '')), '@example.com')
WHERE email IS NULL;

UPDATE students
SET admission_date = CURDATE()
WHERE admission_date IS NULL;
