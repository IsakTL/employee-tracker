//From activity 23, module 10

import express from 'express';
import { QueryResult } from 'pg';
import { pool, connectToDb } from './connection.js';

await connectToDb();

const PORT = process.env.PORT || 3001;
const app = express();

// Express middleware
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// Hardcoded query for all roles
const queryStr = 'SELECT * FROM employees JOIN roles ON employees.role_id = roles.id';

async function showAllWorkers() {
    pool.query(queryStr, (err: Error, result: QueryResult) => {
        if (err) {
            console.log(err);
        } else if (result) {
            console.log(result.rows);
        }
    });
}

showAllWorkers();

// Default response for any other request (Not Found)
app.use((_req, res) => {
  res.status(404).end();
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});