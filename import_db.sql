DROP table if exists users;

CREATE TABLE users(
    id = INTEGER PRIMARY KEY,
    fname = TEXT NOT NULL,
    lname = TEXT NOT NULL,

    question_id = INTEGER NOT NULL
    FOREIGN KEY (question_id) REFERENCES (questions(id))
)

DROP table if exists questions;
CREATE TABLE questions(
    id = INTEGER PRIMARY KEY,
    title = TEXT NOT NULL,
    body = TEXT NOT NULL
)

DROP table if exists question_follows;
CREATE TABLE question_follows (
    id = INTEGER PRIMARY KEY,
    question_id = INTEGER NOT NULL,
    users_id = INTEGER NOT NULL
)


DROP table if exists replies;
CREATE TABLE replies (
    id = INTEGER PRIMARY KEY,
    question_id = INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES (questions(id))
)
