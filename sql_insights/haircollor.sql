SELECT
    hair_color,
    COUNT(*) AS character_count
FROM
    people_query
WHERE
    hair_color IS NOT NULL
GROUP BY
    hair_color
ORDER BY
    character_count DESC;