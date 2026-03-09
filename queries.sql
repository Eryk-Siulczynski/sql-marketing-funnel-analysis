SELECT *
FROM survey
LIMIT 10;

SELECT question, COUNT(DISTINCT user_id) AS responses
FROM survey
GROUP BY question
ORDER BY question;

SELECT *
FROM quiz
LIMIT 10;

SELECT *
FROM home_try_on
LIMIT 10;

SELECT *
FROM purchase
LIMIT 10;

SELECT 
q.user_id,
h.user_id IS NOT NULL AS is_home_try_on,
h.number_of_pairs,
p.user_id IS NOT NULL AS is_purchase
FROM quiz q
LEFT JOIN home_try_on h
  ON q.user_id = h.user_id
LEFT JOIN purchase p
  ON q.user_id = p.user_id;
