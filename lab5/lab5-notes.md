1. output: 
1|Jordan Lee|jordan.lee@example.edu
2|Avery Patel|avery.patel@example.edu
1|1|IS 6465|Forms|2026-11-03|14:00|Open|2026-11-08 22:27:40
2|1|IS 6465|SQL SELECT|2026-11-05|15:00|Open|2026-11-08 22:27:40
3|2|IS 6465|SQLite CRUD|2026-11-07|13:00|Open|2026-11-08 22:27:40

- In students, the primary key is student_id. In tutoring_requests, it’s request_id.
- tutoring_requests.student_id is the foreign key. It references students.student_id and it represents the relationship between a student and their requests.
- student email is marked unique to ensure the same student is not added multiple times.


2. Insert statements: 
INSERT INTO students (student_name, student_email)
VALUES
  ('Jordan Lee',  'jordan.lee@example.edu'),
  ('Avery Patel', 'avery.patel@example.edu');

INSERT OR ignore INTO tutoring_requests
  (student_id, course, topic, preferred_date, preferred_time)
VALUES
    (1, 'IS 6465', 'Forms', '2026-11-03', '14:00'),
    (1, 'IS 6465', 'SQL SELECT', '2026-11-05', '15:00'),
    (2, 'IS 6465', 'SQLite CRUD', '2026-11-07', '13:00');

Output: 
1|Jordan Lee|jordan.lee@example.edu
2|Avery Patel|avery.patel@example.edu
1|1|IS 6465|Forms|2026-11-03|14:00|Open|2026-11-08 22:27:40
2|1|IS 6465|SQL SELECT|2026-11-05|15:00|Open|2026-11-08 22:27:40
3|2|IS 6465|SQLite CRUD|2026-11-07|13:00|Open|2026-11-08 22:27:40

- Jordan has one student row but two requests because 2 tutoring requests were created for the same student for different topics and dates.

3. output from join query: 
1|Jordan Lee|jordan.lee@example.edu|IS 6465|Forms|2026-11-03|14:00|Open
2|Jordan Lee|jordan.lee@example.edu|IS 6465|SQL SELECT|2026-11-05|15:00|Open
3|Avery Patel|avery.patel@example.edu|IS 6465|SQLite CRUD|2026-11-07|13:00|Open

- the join condition connects each tutoring request to the student who made it.
- join combines rows from two tables into one result, where filters rows by a given condition.
- a request id allows you to locate a unique request, multiple request might share the same topic so it would not help you find a specific request.

4. two update statements: 
UPDATE tutoring_requests
SET preferred_date = '2026-11-19',
    preferred_time = '13:00'
WHERE request_id = 2;


UPDATE tutoring_requests
SET status = 'Cancelled'
WHERE request_id = 3;

output before:
1|1|IS 6465|Forms|2026-11-03|14:00|Open|2026-11-08 23:06:41
2|1|IS 6465|SQL SELECT|2026-11-05|15:00|Open|2026-11-08 23:06:41
3|2|IS 6465|SQLite CRUD|2026-11-07|13:00|Open|2026-11-08 23:06:41

output after: 
1|1|IS 6465|Forms|2026-11-03|14:00|Open|2026-11-08 23:03:37
2|1|IS 6465|SQL SELECT|2026-11-19|13:00|Open|2026-11-08 23:03:37
3|2|IS 6465|SQLite CRUD|2026-11-07|13:00|Cancelled|2026-11-08 23:03:37

- the where clause is needed to specify a specific row to update, otherwise it would update all rows.
- the tutoring request hub uses cancelled to change the status of the request while still preserving the request history.

5. Instert statement:
INSERT OR ignore INTO tutoring_requests
  (student_id, course, topic, preferred_date, preferred_time)
VALUES
    (1, 'IS 6465', 'Delete Test', '2026-11-10', '9:00');

Delete statement:
DELETE FROM tutoring_requests
WHERE request_id = 4;

before/after output: 
1|1|IS 6465|Forms|2026-11-03|14:00|Open|2026-11-08 23:14:49
2|1|IS 6465|SQL SELECT|2026-11-19|13:00|Open|2026-11-08 23:14:49
3|2|IS 6465|SQLite CRUD|2026-11-07|13:00|Cancelled|2026-11-08 23:14:49
4|1|IS 6465|Delete Test|2026-11-10|9:00|Open|2026-11-08 23:14:49
1|1|IS 6465|Forms|2026-11-03|14:00|Open|2026-11-08 23:14:49
2|1|IS 6465|SQL SELECT|2026-11-19|13:00|Open|2026-11-08 23:14:49
3|2|IS 6465|SQLite CRUD|2026-11-07|13:00|Cancelled|2026-11-08 23:14:49

- the where clause is essential in a delete statement to ensure that only the desired row is deleted.

6. 
| CRUD action | SQL statement used in this lab | Peer Tutoring Hub example |
|---|---|---|
| Create | INSERT INTO | Added students Jordan Lee and Avery Patel, then added three tutoring requests linked to them by student_id|
| Read | SELECT (with WHERE, JOIN, ORDER BY) | Listed all students and requests, filtered to status = 'Open', looked up one request by request_id, and joined both tables to show each request with the student's name and email, ordered by preferred_date. |
| Update | UPDATE ... SET ... WHERE request_id = ... | Rescheduled Jordan's SQL SELECT request to a new date and time, and changed Avery's request status to Cancelled. |
| Delete | DELETE FROM ... WHERE request_id = ... | Removed only the "Delete Practice" test request by its request_id, then verified the real requests remained. |


- Each row in tutoring_requests stores a student_id. That column is a foreign key referencing the student_id primary key in students. The student's name and email are stored only once, and each request points back to its student by ID, which creates a one-to-many relationship.
**Which database constraint prevents two student rows from using the same email address?**

- The UNIQUE constraint on student_email prevents 2 rows with the same email from being created


- The statement would apply to every row in the table. An UPDATE without WHERE could, for example, set every request's status to Cancelled or give every request the same date. A DELETE without WHERE would erase all requests.


- to prevent users from entering improper data that could result in an sql injection attack.