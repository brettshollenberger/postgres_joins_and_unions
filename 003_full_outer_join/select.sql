SELECT *
FROM projects
FULL OUTER JOIN backers
ON projects.id=backers.project_id;
