CREATE OR REPLACE VIEW all_backers AS (
 WITH all_backers AS (
  SELECT id,
  name,
  'backers' AS backer_type,
  project_id,
  'projects' AS project_type
  FROM backers
  UNION
  SELECT id,
  name,
  'acquired_backers' AS backer_type,
  acquired_project_id AS project_id,
  'acquired_projects' AS project_type
  FROM acquired_backers
 ), all_projects AS (
  SELECT id,
  name,
  'projects' AS project_type
  FROM projects
  UNION
  SELECT id,
  name,
  'acquired_projects' AS project_type
  FROM acquired_projects
 )
 SELECT all_backers.id AS backer_id,
 all_backers.name AS backer_name,
 all_projects.name AS project_name,
 backer_type,
 all_projects.project_type,
 project_id
 FROM all_backers
 INNER JOIN all_projects
 ON all_backers.project_id=all_projects.id
 AND all_backers.project_type=all_projects.project_type
 ORDER BY backer_type, backer_id
);
