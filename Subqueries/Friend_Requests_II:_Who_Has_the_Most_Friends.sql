WITH all_users AS(
SELECT requester_id AS user FROM RequestAccepted
UNION ALL
SELECT accepter_id FROM RequestAccepted)
SELECT user AS id, COUNT(user) AS num
FROM all_users
GROUP BY user
ORDER BY COUNT(user) DESC
LIMIT 1;
