--create catalog database
CREATE DATABASE catalog;

--create genre table
CREATE TABLE genre(
  id BIGINT PRIMARY KEY,
  name VARCHAR(70),
  items VARCHAR(50)[]
);

--create Item table
CREATE TABLE items(
  id BIGINT PRIMARY KEY,
  published_date DATE,
  archived BOOLEAN
  genre INTEGER REFERENCES genre(id)
);

--create MusicAlbum table share association with genre
CREATE TABLE MusicAlbum(
  id INTEGER PRIMARY KEY,
  on_spotify BOOLEAN,
  published_date DATE,
  artist VARCHAR(50),
  name VARCHAR(50),
  genre INTEGER REFERENCES genre(id)
);

-- Create book table share association with label
CREATE TABLE books(
  id INT GENERATED ALWAYS AS IDENTITY,
  published_date DATE,
  publisher VARCHAR(50),
  cover_state VARCHAR(50),
  Item_id INTEGER REFERENCES Item(id),
  PRIMARY KEY (id)
);

-- Create label table
CREATE TABLE labels(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50),
  color VARCHAR(50),
  PRIMARY KEY (id)
);

-- Create items_labels table
CREATE TABLE items_labels(
  id INT GENERATED ALWAYS AS IDENTITY,
  item_id INTEGER REFERENCES items(id),
  label_id INTEGER REFERENCES labels(id),
  PRIMARY KEY (id)
);

-- Create Game table
CREATE TABLE games (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  genre_id INTEGER,
  author_id INTEGER REFERENCES author(id),
  source_id INTEGER,
  label_id INTEGER ,
  published_date INTEGER,
  archived BOOLEAN
  last_played_at VARCHAR,
  multiplayer VARCHAR
 
);
--Create Author table
CREATE TABLE author (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR,
    items VARCHAR(80)[]
)