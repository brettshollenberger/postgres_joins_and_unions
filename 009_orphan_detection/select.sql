-- Histories with no bids

SELECT *
FROM bid_histories
LEFT JOIN bids
ON bids.id=bid_histories.bid_id
WHERE bids.id IS NULL;

-- Histories with no users

SELECT *
FROM bid_histories
LEFT JOIN users
ON users.id=bid_histories.history_user_id
WHERE users.id IS NULL;
