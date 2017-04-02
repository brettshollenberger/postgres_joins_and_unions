CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  release_date DATE,
  count_stars INTEGER,
  director_id INTEGER
);

CREATE TABLE directors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE projects (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL
);

CREATE TABLE backers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  contribution FLOAT NOT NULL,
  project_id INTEGER NOT NULL
);

CREATE TABLE stores (
  id SERIAL PRIMARY KEY,
  location VARCHAR(200)
);

CREATE TABLE rentable_movies (
  movie_id INTEGER NOT NULL REFERENCES movies(id),
  store_id INTEGER NOT NULL REFERENCES stores(id),
  copy_number INTEGER NOT NULL,
  PRIMARY KEY (movie_id, store_id, copy_number)
);

CREATE TABLE guests (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  email VARCHAR(200) NOT NULL
);

CREATE TABLE rentings (
  guest_id INTEGER REFERENCES guests(id),
  movie_id INTEGER NOT NULL,
  store_id INTEGER NOT NULL,
  copy_number INTEGER NOT NULL,
  due_back DATE,
  returned BOOLEAN,
  FOREIGN KEY (movie_id, store_id, copy_number) REFERENCES rentable_movies(movie_id, store_id, copy_number)
);

CREATE TABLE acquired_projects (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL
);

CREATE TABLE acquired_backers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  contribution FLOAT NOT NULL,
  acquired_project_id INTEGER NOT NULL
);

CREATE TABLE bids (
  id SERIAL PRIMARY KEY,
  object_name VARCHAR(200),
  bid_cents INTEGER NOT NULL
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL
);

CREATE TABLE bid_histories (
  id SERIAL PRIMARY KEY,
  bid_id INTEGER NOT NULL,
  object_name VARCHAR(200),
  bid_cents INTEGER NOT NULL,
  history_started_at TIMESTAMP NOT NULL,
  history_ended_at TIMESTAMP,
  history_user_id INTEGER NOT NULL
);

INSERT INTO users (name) VALUES ('Doug Funny'), ('Skeeter Valentine');

INSERT INTO bids (object_name, bid_cents) VALUES 
(
  'of Montreal Concert Poster',
  5000
),
(
  'of Montreal Concert Poster',
  10000
);

INSERT INTO bid_histories (bid_id, object_name, bid_cents, history_started_at, history_ended_at, history_user_id) VALUES
(
  1,
  'of Montreal Concert Poster',
  500,
  '2016-12-01 01:02:30.152015',
  '2016-12-01 01:03:33.723338',
  1
),
(
  2,
  'of Montreal Concert Poster',
  700,
  '2016-12-01 01:02:50.139761',
  '2016-12-01 01:10:24.13845',
  2
),
(
  3,
  'of Montreal Concert Poster',
  800,
  '2016-12-01 01:03:50.139761',
  NULL,
  3
),
(
  1,
  'of Montreal Concert Poster',
  1500,
  '2016-12-01 01:03:33.723338',
  '2016-12-01 01:10:35.835884',
  1
),
(
  2,
  'of Montreal Concert Poster',
  3000,
  '2016-12-01 01:10:24.13845',
  '2016-12-01 01:12:05.03138',
  2
),
(
  1,
  'of Montreal Concert Poster',
  5000,
  '2016-12-01 01:10:35.835884',
  NULL,
  1
),
(
  2,
  'of Montreal Concert Poster',
  10000,
  '2016-12-01 01:12:05.03138',
  NULL,
  2
);

INSERT INTO projects (name) VALUES 
(
  'Make A Zombie Movie'
),
(
  'Give Tom Hanks a Christmas Present'
),
(
	'Great Project'
),
(
  'Make A Zombie Movie'
);

INSERT INTO backers (name, contribution, project_id) VALUES 
(
  'Dave Foley',
  5.50,
  1
),
(
  'Pam Beasley',
  25.00,
  1
),
(
  'Dwayne Johnson',
  30.00,
  1
),
(
  'Brad Pitt',
  500.00,
  1
),
(
  'Dave Foley',
  55.50,
  2
),
(
  'Pam Beasley',
  900.00,
  2
),
(
  'Dwayne Johnson',
  300.00,
  2
),
(
  'Brad Pitt',
  35.00,
  2
), 
('Great Backer',
  500,
  20
),
(
  'Shamu',
  25.00,
  1
);

INSERT INTO acquired_projects (name) VALUES 
(
  'Save the Whales'
),
(
  '350.org'
),
(
	'REDD+'
),
(
  'UNFCCC'
);

INSERT INTO acquired_backers (name, contribution, acquired_project_id) VALUES 
(
  'Free Willy',
  500,
  1
),
(
  'Shamu',
  25.00,
  1
),
(
  'Chris Martin',
  30.00,
  1
),
(
  'Nicolas Cage',
  500.00,
  1
),
(
  'Bill McKibben',
  55.50,
  2
),
(
  'Al Gore',
  900.00,
  2
),
(
  'Sarah Silverman',
  300.00,
  2
),
(
  'Barack Obama',
  35.00,
  2
);

INSERT INTO directors (name) VALUES ('Quentin Tarantino'), ('Judd Apatow');

INSERT INTO movies (title, release_date, count_stars, director_id) VALUES (
  'Kill Bill',
  '10-10-2003',
  3,
  1
), (
  'Funny People',
  '07-20-2009',
  5,
  2
);

INSERT INTO stores (location) VALUES ('San Francisco'), ('Philadelphia');

INSERT INTO rentable_movies (movie_id, store_id, copy_number) VALUES (1, 1, 1), (1, 1, 2), (2, 1, 1), (2, 2, 1);

INSERT INTO guests (name, email) VALUES (
  'Brett Cassette',
  'brett@theinternet.com'
), (
  'Bradley Cooper',
  'brad@thecoop.com'
);

INSERT INTO rentings (guest_id, movie_id, store_id, copy_number, due_back, returned) VALUES (
  1,
  1,
  1,
  1,
  '2017-02-01',
  FALSE
), (
  2,
  1,
  1,
  2,
  '2017-01-01',
  TRUE
);

