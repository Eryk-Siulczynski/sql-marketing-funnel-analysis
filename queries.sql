-- =========================================
-- Warby Parker Funnel Analysis
-- =========================================

-- -----------------------------------------
-- 1. Inspect survey table
-- -----------------------------------------

SELECT *
FROM survey
LIMIT 10;


-- -----------------------------------------
-- 2. Survey funnel: responses per question
-- -----------------------------------------

SELECT 
  question,
  COUNT(DISTINCT user_id) AS responses
FROM survey
GROUP BY question
ORDER BY question ASC;


-- -----------------------------------------
-- 3. Inspect purchase funnel tables
-- -----------------------------------------

SELECT *
FROM quiz
LIMIT 10;

SELECT *
FROM home_try_on
LIMIT 10;

SELECT *
FROM purchase
LIMIT 10;


-- -----------------------------------------
-- 4. Build base funnel dataset
-- -----------------------------------------

SELECT 
  q.user_id,
  h.user_id IS NOT NULL AS is_home_try_on,
  h.number_of_pairs,
  p.user_id IS NOT NULL AS is_purchase
FROM quiz q
LEFT JOIN home_try_on h
  ON q.user_id = h.user_id
LEFT JOIN purchase p
  ON q.user_id = p.user_id
LIMIT 10;


-- -----------------------------------------
-- 5. Overall funnel conversion rates
-- -----------------------------------------

WITH funnel AS (
  SELECT 
    q.user_id,
    h.user_id IS NOT NULL AS is_home_try_on,
    h.number_of_pairs,
    p.user_id IS NOT NULL AS is_purchase
  FROM quiz q
  LEFT JOIN home_try_on h
    ON q.user_id = h.user_id
  LEFT JOIN purchase p
    ON q.user_id = p.user_id
)

SELECT 
  COUNT(*) AS number_of_clients,
  SUM(is_home_try_on) AS number_of_try_on,
  SUM(is_purchase) AS number_of_purchase,
  1.0 * SUM(is_home_try_on) / COUNT(*) AS quiz_to_try_on_conversion_rate,
  1.0 * SUM(is_purchase) / SUM(is_home_try_on) AS try_on_to_purchase_conversion_rate
FROM funnel;


-- -----------------------------------------
-- 6. A/B comparison: 3 pairs vs 5 pairs
-- -----------------------------------------

WITH funnel AS (
  SELECT 
    q.user_id,
    h.user_id IS NOT NULL AS is_home_try_on,
    h.number_of_pairs,
    p.user_id IS NOT NULL AS is_purchase
  FROM quiz q
  LEFT JOIN home_try_on h
    ON q.user_id = h.user_id
  LEFT JOIN purchase p
    ON q.user_id = p.user_id
)

SELECT 
  number_of_pairs,
  COUNT(*) AS number_of_clients,
  SUM(is_purchase) AS number_of_purchased_items,
  1.0 * SUM(is_purchase) / COUNT(*) AS purchase_rate
FROM funnel
WHERE number_of_pairs IS NOT NULL
GROUP BY number_of_pairs;
