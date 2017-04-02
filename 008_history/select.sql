SELECT *
FROM bids;

SELECT bids.object_name,
users.name,
bid_histories.bid_cents,
history_started_at,
history_ended_at
FROM bids
INNER JOIN bid_histories
ON bid_histories.bid_id=bids.id
INNER JOIN users
ON users.id=bid_histories.history_user_id
ORDER BY history_started_at;
