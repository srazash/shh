--name: SetConfig :one
INSERT INTO config (key, value)
VALUES (?, ?)
RETURNING *;

--name: GetConfig :one
SELECT value FROM config
WHERE key = ?;

--name: DeleteConfig :exec
DELETE FROM config
WHERE key = ?;
