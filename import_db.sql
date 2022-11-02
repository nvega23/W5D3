-- PRAGMA foreign_keys = ON;


DROP table if exists users;
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
    -- question_id INTEGER NOT NULL,
    -- FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP table if exists questions;
CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP table if exists question_follows;
CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    users_id INTEGER NOT NULL
);


DROP table if exists replies;

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_reply_id TEXT NULL,
    user_id TEXT NOT NULL,
    reply_body TEXT NOT NULL,
    top_level TEXT NOT NULL,
    subject_question TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id)
    FOREIGN KEY(parent_reply_id) REFERENCES replies(id)
    FOREIGN KEY(user_id) REFERENCES users(id)
    -- FOREIGN KEY (reply_body) REFERENCES questions(body)

);

DROP table if exists question_likes;
CREATE TABLE question_likes (
    -- COLUMN NAMES
    id INTEGER PRIMARY KEY,
    question_likes BOOLEAN NOT NULL,
    -- TO REFERENCE
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO
  users (fname, lname)
VALUES
  ('Arthur', 'Miller'),
  ('Eugene', 'Neill');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('whatever', 'whats my name', (SELECT id FROM users WHERE fname = 'Arthur')),
  ('i dont know', 'where am i', (SELECT id FROM users WHERE fname = 'Eugene'));
