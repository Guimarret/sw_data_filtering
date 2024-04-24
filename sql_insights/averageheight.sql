SELECT
    s.name AS species_name,
    average_height
FROM
    specie_query s
WHERE
    average_height IS NOT NULL
GROUP BY
    average_height,
    s.name;