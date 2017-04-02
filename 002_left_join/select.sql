SELECT *
FROM projects
INNER JOIN backers
ON projects.id=backers.project_id;

SELECT *
FROM projects
INNER JOIN backers
ON projects.id=backers.project_id
WHERE backers.id IS NULL;

SELECT *
FROM projects
LEFT JOIN backers
ON projects.id=backers.project_id;

SELECT *
FROM projects
LEFT JOIN backers
ON projects.id=backers.project_id
WHERE backers.id IS NULL;

SELECT *
FROM projects
RIGHT JOIN backers
ON projects.id=backers.project_id;
