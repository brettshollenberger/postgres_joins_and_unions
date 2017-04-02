-- Contributions to this project

SELECT *
FROM projects
INNER JOIN backers
ON projects.id=backers.project_id;

-- Contributions to every other project, but not this one

SELECT *
FROM projects
INNER JOIN backers
ON projects.id<>backers.project_id;

-- These are weird, but still fulfill the join condition

SELECT *
FROM projects
INNER JOIN backers
ON 1=1;

SELECT *
FROM projects
INNER JOIN backers
ON 1=2;

SELECT *
FROM projects
INNER JOIN backers
ON true;

SELECT *
FROM projects
INNER JOIN backers
ON projects.name='Great Project';

-- ON and WHERE are functionally the same

SELECT *
FROM projects
INNER JOIN backers
ON true
WHERE projects.name='Great Project';

SELECT *
FROM projects
INNER JOIN backers
ON true
WHERE projects.id=backers.project_id;

-- The query planner comes up with the exact same execution

EXPLAIN 
SELECT *
FROM projects
INNER JOIN backers
ON true
WHERE projects.id=backers.project_id;

EXPLAIN 
SELECT *
FROM projects
INNER JOIN backers
ON projects.id=backers.project_id;
