# WITH FIRST_GEN AS (
#     SELECT
#         ID
#     FROM
#         ECOLI_DATA
#     WHERE
#         PARENT_ID IS NULL
# ),
# SECOND_GEN AS (
#     SELECT
#         ID
#     FROM
#         ECOLI_DATA
#     WHERE
#         PARENT_ID IN (SELECT ID FROM FIRST_GEN)
# )
# SELECT
#     ID
# FROM
#     ECOLI_DATA
# WHERE
#     PARENT_ID IN (SELECT ID FROM SECOND_GEN);

WITH RECURSIVE GENERATION AS (
    SELECT
        ID,
        PARENT_ID,
        1 AS GEN
    FROM
        ECOLI_DATA
    WHERE
        PARENT_ID IS NULL
    -- 1세대
    UNION ALL
    SELECT
        ED.ID,
        ED.PARENT_ID,
        GEN + 1 AS GEN
    FROM
        ECOLI_DATA AS ED
    JOIN
        GENERATION AS G
        ON ED.PARENT_ID = G.ID
)
SELECT
    ID
FROM
    GENERATION
WHERE
    GEN = 3
ORDER BY
    1;