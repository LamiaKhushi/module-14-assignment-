# Task Manager Database

## Database Name
`task_manager`

## Tables
1. **users**
   - id (Primary Key)
   - name
   - email
   - created_at

2. **tasks**
   - id (Primary Key)
   - user_id (Foreign Key → users.id)
   - title
   - description
   - status
   - created_at

## Relationship
- One user can have many tasks (**1:N**).
- Implemented with `FOREIGN KEY (user_id)` in `tasks`.

## Inserted Data
- 3 users (Alice, Bob, Charlie).
- Multiple tasks assigned to each user.

## Queries Implemented
1. **Select all tasks**  
   `SELECT * FROM tasks;`

2. **Update a task’s status**  
   `UPDATE tasks SET status = 'completed' WHERE id = 1;`

3. **Delete a task**  
   `DELETE FROM tasks WHERE id = 2;`

4. **Show tasks with sorting and limit**  
   `SELECT * FROM tasks ORDER BY created_at DESC LIMIT 2;`

5. **Aggregator functions (COUNT, MAX, etc.)**  
   - Count tasks per user  
   - Max task id per user

6. **Joins**  
   - INNER JOIN → Show users with their tasks  
   - LEFT JOIN → Show all users even if no tasks  
   - RIGHT JOIN → Show all tasks even if user missing

## Export
The database can be exported with:
```bash
mysqldump -u root -p task_manager > task_manager.sql
