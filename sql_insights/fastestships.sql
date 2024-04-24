SELECT
    name AS starship_name,
    max_atmosphering_speed
FROM
    starship_query
WHERE
    max_atmosphering_speed IS NOT NULL
ORDER BY
    max_atmosphering_speed
LIMIT 5;