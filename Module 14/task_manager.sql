-- 1. Create database
CREATE DATABASE task_manager;
USE task_manager;

-- 2. Create tables
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 3. Insert 3 users
INSERT INTO users (name, email) VALUES
('Alice Johnson', 'alice@example.com'),
('Bob Smith', 'bob@example.com'),
('Charlie Brown', 'charlie@example.com');

-- 4. Insert multiple tasks for each user
INSERT INTO tasks (user_id, title, description, status) VALUES
(1, 'Buy groceries', 'Milk, eggs, bread', 'pending'),
(1, 'Finish project', 'Submit SQL project report', 'in progress'),
(2, 'Workout', 'Morning gym session', 'completed'),
(2, 'Call client', 'Discuss project details', 'pending'),
(3, 'Read book', 'Finish reading database book', 'in progress'),
(3, 'Pay bills', 'Electricity and water bills', 'pending');

-- 5. Queries

-- Select all tasks
SELECT * FROM tasks;

-- Update a task’s status
UPDATE tasks SET status = 'completed' WHERE id = 1;

-- Delete a task
DELETE FROM tasks WHERE id = 2;

-- Show tasks with Sorting (by created_at desc) and Limit (2 tasks only)
SELECT * FROM tasks ORDER BY created_at DESC LIMIT 2;

-- Aggregator functions: count tasks per user
SELECT u.name, COUNT(t.id) AS total_tasks
FROM users u
LEFT JOIN tasks t ON u.id = t.user_id
GROUP BY u.id;

-- Max task id per user
SELECT u.name, MAX(t.id) AS last_task_id
FROM users u
JOIN tasks t ON u.id = t.user_id
GROUP BY u.id;

-- Inner Join
SELECT u.name, t.title, t.status
FROM users u
INNER JOIN tasks t ON u.id = t.user_id;

-- Left Join
SELECT u.name, t.title, t.status
FROM users u
LEFT JOIN tasks t ON u.id = t.user_id;

-- Right Join
SELECT u.name, t.title, t.status
FROM users u
RIGHT JOIN tasks t ON u.id = t.user_id;



