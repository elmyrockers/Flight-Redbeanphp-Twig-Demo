CREATE TABLE user (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT NOT NULL,
    email       TEXT NOT NULL UNIQUE,
    website     TEXT NOT NULL,
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at  DATETIME DEFAULT CURRENT_TIMESTAMP
);


CREATE TRIGGER update_user_updated_at
AFTER UPDATE ON user
FOR EACH ROW
BEGIN
    UPDATE user SET updated_at = CURRENT_TIMESTAMP WHERE id = OLD.id;
END;