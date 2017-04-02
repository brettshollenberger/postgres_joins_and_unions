SELECT
name
FROM backers
UNION
SELECT
name
FROM acquired_backers
ORDER BY name;

SELECT
name
FROM backers
UNION ALL
SELECT
name
FROM acquired_backers
ORDER BY name;
