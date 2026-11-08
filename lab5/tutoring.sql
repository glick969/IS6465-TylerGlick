

CREATE TABLE if not exists students (
  student_id INTEGER PRIMARY KEY,
  student_name TEXT NOT NULL,
  student_email TEXT NOT NULL UNIQUE
);

CREATE TABLE if not exists tutoring_requests (
  request_id INTEGER PRIMARY KEY,
  student_id INTEGER NOT NULL,
  course TEXT NOT NULL,
  topic TEXT NOT NULL,
  preferred_date TEXT NOT NULL,
  preferred_time TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'Open',
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);

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


SELECT * from students;
SELECT * from tutoring_requests;

SELECT * FROM tutoring_requests
WHERE status = 'Open';

SELECT * FROM tutoring_requests
WHERE request_id = 1;

SELECT
  r.request_id,
  s.student_name,
  s.student_email,
  r.course, r.topic,
  r.preferred_date, r.preferred_time, r.status
FROM tutoring_requests AS r
JOIN students AS s ON r.student_id = s.student_id
ORDER BY r.preferred_date;

SELECT * from tutoring_requests;

UPDATE tutoring_requests
SET preferred_date = '2026-11-19',
    preferred_time = '13:00'
WHERE request_id = 2;


UPDATE tutoring_requests
SET status = 'Cancelled'
WHERE request_id = 3;

INSERT OR ignore INTO tutoring_requests
  (student_id, course, topic, preferred_date, preferred_time)
VALUES
    (1, 'IS 6465', 'Delete Test', '2026-11-10', '9:00');

SELECT * from tutoring_requests;

DELETE FROM tutoring_requests
WHERE request_id = 4;

SELECT * from tutoring_requests;


